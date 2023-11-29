const Router = require('koa-router')
const router = new Router()

const logModel = require('../model/log')
const Sequelize = require('sequelize')
const Op = Sequelize.Op
const { checkAuth } = require("../middleware/auth")
const Permission = require("../middleware/permission")

// 分页查询操作日志
router.get('/list/:current/:limit', checkAuth, new Permission(['ROLE_QUERY_LOG_LIST']).hasPermission, async (ctx) => {
  const { rows, count } = await logModel.findAndCountAll({
    attributes: {exclude: ['params', 'result', 'user_id']},
    where: {
      [Op.or]: {
        description: {
          [Op.like]: `%${ctx.request.query.searchKey}%`
        },
        user_name: {
          [Op.like]: `%${ctx.request.query.searchKey}%`
        }
      }
    },
    offset: (parseInt(ctx.params.current) - 1) * parseInt(ctx.params.limit),
    limit: parseInt(ctx.params.limit),
    order: [
      ['time', 'DESC']
    ],
    raw: true
  })
  ctx.response.body = {
    code: 20000,
    message: '查询成功',
    success: true,
    data: {
      rows,
      count
    }
  }
})

// 删除日志
router.delete("/:id", checkAuth, new Permission(['ROLE_DELETE_LOG']).hasPermission, async (ctx) => {
  const res = await logModel.destroy({
    where: {
      id: ctx.params.id
    }
  })
  if (res) {
    ctx.response.body = {
      code: 20000,
      message: '删除成功',
      success: true
    }
  } else {
    ctx.response.body = {
      code: 20001,
      message: '删除失败',
      success: false
    }
  }
})

// 根据id查询日志详情
router.get("/info/:id", checkAuth, new Permission(['ROLE_QUERY_LOG_DETAIL']).hasPermission, async (ctx) => {
  const res = await logModel.findOne({
    where: {
      id: ctx.request.params.id
    },
    raw: true
  })
  ctx.response.body = {
    code: 20000,
    message: '查询成功',
    success: true,
    data: {
      log: res
    }
  }
})

module.exports = router
