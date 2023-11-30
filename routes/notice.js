const Router = require('koa-router')
const router = new Router()

const GenId = require('../utils/GenId')
const noticeModel = require('../model/notice')
const Sequelize = require('sequelize')
const Op = Sequelize.Op
const { checkAuth } = require("../middleware/auth")
const Permission = require("../middleware/permission")
const Log = require("../middleware/log")

// 分页查询公告
router.get('/list/:current/:limit', checkAuth, new Log('公告模块', '分页查询公告列表').setLog, async (ctx) => {
  const { rows, count } = await noticeModel.findAndCountAll({
    where: {
      [Op.or]: {
        id: {
          [Op.like]: `%${ctx.request.query.searchKey}%`
        },
        name: {
          [Op.like]: `%${ctx.request.query.searchKey}%`
        }
      }
    },
    offset: (parseInt(ctx.params.current) - 1) * parseInt(ctx.params.limit),
    limit: parseInt(ctx.params.limit),
    order: [
      ['create_time', 'DESC']
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

// 添加公告
router.post('/', checkAuth, new Permission(['admin']).hasPermission, new Log('公告模块', '添加公告').setLog, async (ctx) => {
  const notice = ctx.request.body

  const genid = new GenId({ WorkerId: 1 })

  const res = await noticeModel.create({
    id: genid.NextId().toString(),
    name: notice.name,
    content: notice.content,
    create_time: new Date(),
  })
  if (res) {
    ctx.response.body = {
      code: 20000,
      message: '公告添加成功',
      success: true
    }
  } else {
    ctx.response.body = {
      code: 20001,
      message: '公告添加失败',
      success: false
    }
  }
})

// 删除公告
router.delete('/:id', checkAuth, new Permission(['admin']).hasPermission, new Log('公告模块', '删除公告').setLog, async (ctx) => {
  const res = noticeModel.destroy({
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

// 修改公告
router.put('/:id', checkAuth, new Permission(['ROLE_UPDATE_NOTICE']).hasPermission, new Log('公告模块', '修改公告').setLog,  async (ctx) => {
  const notice = ctx.request.body
  const res = await noticeModel.update(notice, {
    where: {
      id: notice.id
    }
  })
  if (res) {
    ctx.response.body = {
      code: 20000,
      message: '修改成功',
      success: true
    }
  } else {
    ctx.response.body = {
      code: 20001,
      message: '修改失败',
      success: false
    }
  }
})

module.exports = router
