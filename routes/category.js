const fs = require("fs");
const stream = require("stream");
const Router = require("koa-router");
const router = new Router();

const GenId = require("../utils/GenId");
const categoryModel = require("../model/category");
const navigationModel = require("../model/navigation");
const { checkAuth } = require("../middleware/auth");
const Log = require("../middleware/log");

// 查询每一级的分类
router.get(
  "/list",
  checkAuth,
  new Log("分类模块", "查询每一级分类").setLog,
  async (ctx) => {
    console.log(ctx.user_id, ctx.query.parent_id);
    const categoryList = await categoryModel.findAll({
      where: {
        user_id: ctx.user_id,
        parent_id: ctx.query.parent_id,
      },
      raw: true,
    });
    ctx.response.body = {
      code: 20000,
      message: "查询成功",
      success: true,
      data: categoryList,
    };
  }
);

// 添加分类
router.post(
  "/",
  checkAuth,
  new Log("分类模块", "添加分类").setLog,
  async (ctx) => {
    const category = ctx.request.body;
    const res = await categoryModel.findOne({
      where: {
        category_name: category.category_name,
        user_id: ctx.user_id,
      },
    });
    if (res) {
      ctx.response.body = {
        code: 20001,
        message: "该分类名称已存在",
        success: false,
      };
    } else {
      const genid = new GenId({ WorkerId: 1 });

      const res = await categoryModel.create({
        id: genid.NextId().toString(),
        user_id: ctx.user_id,
        category_name: category.category_name,
        parent_id: category.parent_id,
        create_time: new Date(),
      });
      if (res) {
        ctx.response.body = {
          code: 20000,
          message: "添加成功",
          success: true,
          data: res,
        };
      } else {
        ctx.response.body = {
          code: 20001,
          message: "添加失败",
          success: false,
        };
      }
    }
  }
);

// 删除分类及其子分类及对应的导航
router.delete(
  "/:id",
  checkAuth,
  new Log("分类模块", "删除分类").setLog,
  async (ctx) => {
    const children = await categoryModel.findAll({
      where: {
        parent_id: ctx.params.id,
      },
    });
    // 先删除所有子分类及对应的导航
    for (const child of children) {
      await navigationModel.destroy({
        where: {
          cat_id: child.id,
        },
      });
    }
    const res = await categoryModel.destroy({
      where: {
        id: ctx.params.id,
      },
    });
    if (res) {
      ctx.response.body = {
        code: 20000,
        message: "删除成功",
        success: true,
      };
    } else {
      ctx.response.body = {
        code: 20001,
        message: "删除失败",
        success: false,
      };
    }
  }
);

// 修改分类信息
router.put(
  "/:id",
  checkAuth,
  new Log("分类模块", "修改分类信息").setLog,
  async (ctx) => {
    const category = ctx.request.body;
    const res = await categoryModel.update(category, {
      where: {
        id: ctx.request.params.id,
      },
    });
    if (res) {
      ctx.response.body = {
        code: 20000,
        message: "修改成功",
        success: true,
      };
    } else {
      ctx.response.body = {
        code: 20001,
        message: "修改失败",
        success: false,
      };
    }
  }
);

// 导入（分类及对应导航）
router.post(
  "/import",
  checkAuth,
  new Log("分类模块", "导出分类").setLog,
  async (ctx) => {
    const { file } = ctx.request.files;
    try {
      const data = fs.readFileSync(file.filepath, "utf-8");
      const obj = JSON.parse(data);

      const categoryList = obj.data;

      for (const category of categoryList) {
        await categoryModel.create({
          id: category.id,
          user_id: category.user_id,
          category_name: category.category_name,
          parent_id: category.parent_id,
          create_time: category.create_time,
        });

        for (const subCategory of category.children) {
          await categoryModel.create({
            id: subCategory.id,
            user_id: subCategory.user_id,
            category_name: subCategory.category_name,
            parent_id: subCategory.parent_id,
            create_time: subCategory.create_time,
          });

          for (const nav of subCategory.navigation) {
            await navigationModel.create({
              id: nav.id,
              cat_id: nav.cat_id,
              name: nav.name,
              description: nav.description,
              url: nav.url,
              ladder: nav.ladder,
              create_time: nav.create_time,
            });
          }
        }
      }

      ctx.response.body = {
        code: 20000,
        message: "导入成功",
        success: true,
      };
    } catch (err) {
      ctx.response.body = {
        code: 20001,
        message: "导入失败",
        success: false,
      };
    }
  }
);

// 导出所有数据
router.get(
  "/export",
  checkAuth,
  new Log("分类模块", "导出分类").setLog,
  async (ctx) => {
    // 先查询一级分类
    const categoryList = await categoryModel.findAll({
      where: {
        user_id: ctx.user_id,
        parent_id: -1,
      },
      raw: true,
    });

    // 遍历一级分类查询二级分类并将相应导航添加到二级分类对应的属性中
    for (const category of categoryList) {
      const subCategoryList = await categoryModel.findAll({
        where: {
          user_id: ctx.user_id,
          parent_id: category.id,
        },
        raw: true,
      });
      for (const subCategory of subCategoryList) {
        const navList = await navigationModel.findAll({
          where: {
            cat_id: subCategory.id,
          },
        });
        subCategory.navigation = navList;
      }

      category.children = subCategoryList;
    }

    const exportData = JSON.stringify({ data: categoryList }, null, 2);

    // 用数据生成json文件
    const readable = stream.Readable;
    const s = new readable();
    // 将json传入到流中
    s.push(exportData);
    // 结束流
    s.push(null);

    ctx.response.body = s;
  }
);
module.exports = router;
