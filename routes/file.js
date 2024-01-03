const fs = require("fs");
const stream = require("stream");
const Router = require("koa-router");
const router = new Router();

const categoryModel = require("../model/category");
const navigationModel = require("../model/navigation");
const { checkAuth } = require("../middleware/auth");
const Log = require("../middleware/log");

// 导入（分类及对应导航）
router.post(
  "/import",
  checkAuth,
  new Log("文件模块", "导入数据").setLog,
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
          name: category.name,
          parent_id: category.parent_id,
          create_time: category.create_time,
        });

        for (const subCategory of category.children) {
          await categoryModel.create({
            id: subCategory.id,
            user_id: subCategory.user_id,
            name: subCategory.name,
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
  new Log("文件模块", "导出数据").setLog,
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
