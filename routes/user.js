const Router = require("koa-router");
const router = new Router();

const GenId = require("../utils/GenId");
const jwtUtils = require("../utils/JwtUtil");
const userModel = require("../model/user");
const Sequelize = require("sequelize");
const Op = Sequelize.Op;
const { checkAuth } = require("../middleware/auth");
const Permission = require("../middleware/permission");
const Log = require("../middleware/log");

// 分页查询用户
router.get(
  "/list/:current/:limit",
  checkAuth,
  new Permission(["admin"]).hasPermission,
  new Log("用户模块", "分页查询用户列表信息").setLog,
  async (ctx) => {
    const { rows, count } = await userModel.findAndCountAll({
      attributes: { exclude: ["password"] },
      where: {
        username: {
          [Op.like]: `%${ctx.request.query.key}%`,
        },
        [Op.not]: {
          role: "admin",
        },
      },
      offset: (parseInt(ctx.params.current) - 1) * parseInt(ctx.params.limit),
      limit: parseInt(ctx.params.limit),
      order: [["create_time", "DESC"]],
      raw: true,
    });
    ctx.response.body = {
      code: 20000,
      message: "查询成功",
      success: true,
      data: {
        rows,
        count,
      },
    };
  }
);

// 根据用户id查看用户详情信息
router.get(
  "/info",
  checkAuth,
  new Log("用户模块", "查询用户详情信息").setLog,
  async (ctx) => {
    const user = await userModel.findOne({
      attributes: { exclude: ["password"] },
      where: {
        id: ctx.user_id,
      },
      raw: true,
    });
    ctx.response.body = {
      code: 20000,
      message: "查询成功",
      success: true,
      data: {
        user,
      },
    };
  }
);

// 添加用户
router.post(
  "/",
  checkAuth,
  new Log("用户模块", "添加用户").setLog,
  async (ctx) => {
    const user = ctx.request.body;
    const res = await userModel.findOne({
      where: {
        username: user.username,
      },
    });
    if (res) {
      ctx.response.body = {
        code: 20001,
        message: "该名称已被注册",
        success: false,
      };
    } else {
      const genid = new GenId({ WorkerId: 1 });

      const res = await userModel.create({
        id: genid.NextId().toString(),
        username: user.username,
        role: user.role,
        gender: user.gender,
        email: user.email,
        password: user.password,
        site_id: genid.NextId().toString(),
        open: 0,
        create_time: new Date(),
      });
      if (res) {
        ctx.response.body = {
          code: 20000,
          message: "注册成功,请前往登录",
          success: true,
        };
      } else {
        ctx.response.body = {
          code: 20001,
          message: "注册失败",
          success: false,
        };
      }
    }
  }
);

// 删除用户
router.delete(
  "/:id",
  checkAuth,
  new Permission(["admin"]).hasPermission,
  new Log("用户模块", "删除用户").setLog,
  async (ctx) => {
    const res = await userModel.destroy({
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

// 修改用户信息
router.put(
  "/info/:id",
  checkAuth,
  new Permission(["admin"]).hasPermission,
  new Log("用户模块", "修改用户信息").setLog,
  async (ctx) => {
    const user = ctx.request.body;
    const res = await userModel.update(user, {
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

// 用户修改个人信息
router.put(
  "/info",
  checkAuth,
  new Log("用户模块", "修改个人信息").setLog,
  async (ctx) => {
    const user = ctx.request.body;
    const res = await userModel.update(user, {
      where: {
        id: ctx.user_id,
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

// 登录
router.post("/login", async (ctx) => {
  const { username, password } = ctx.request.body;
  const user = await userModel.findOne({
    where: { username },
    raw: true,
  });
  if (user) {
    if (password === user.password) {
      const token = jwtUtils.generateToken({ id: user.id }, "1 days");
      ctx.response.body = {
        code: 20000,
        message: "登录成功",
        success: true,
        data: {
          info: user,
          token,
          failure_time: new Date().getTime() + 1000 * 60 * 60 * 24,
        },
      };
    } else {
      ctx.response.body = {
        code: 20001,
        message: "密码错误",
        success: false,
      };
    }
  } else {
    ctx.response.body = {
      code: 20001,
      message: "用户不存在",
      success: false,
    };
  }
});

// 管理员重置密码
router.patch(
  "/reset-password",
  checkAuth,
  new Permission(["admin"]).hasPermission,
  new Log("用户模块", "管理员重置密码").setLog,
  async (ctx) => {
    const updated = await userModel.update(
      {
        password: ctx.request.body.password,
      },
      {
        where: {
          id: ctx.request.body.id,
        },
      }
    );
    if (updated) {
      ctx.response.body = {
        code: 20000,
        message: "密码重置成功",
        success: true,
      };
    } else {
      ctx.response.body = {
        code: 20001,
        message: "密码重置失败",
        success: false,
      };
    }
  }
);
module.exports = router;
