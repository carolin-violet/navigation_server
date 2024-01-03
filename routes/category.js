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
        name: category.name,
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
        name: category.name,
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

module.exports = router;
