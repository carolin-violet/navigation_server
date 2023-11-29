const Router = require('koa-router')
const router = new Router()

const GenId = require('../utils/GenId')
const noticeModel = require('../model/notice')
const photoModel = require('../model/photo')
const Sequelize = require('sequelize')
const Op = Sequelize.Op
const { checkAuth } = require("../middleware/auth")
const Permission = require("../middleware/permission")
const Log = require("../middleware/log")

// 分页查询公告
router.get('/list/:current/:limit', checkAuth, new Log('公告模块', '分页查询公告列表').setLog, async (ctx) => {
  const { rows, count } = await noticeModel.findAndCountAll({
    where: {
      important: {
        [Op.like]: `%${ctx.request.query.important}%`
      },
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
  for (const row of rows) {
    const cover = await photoModel.findOne({
      where: {
        id: row.cover
      },
      raw: true
    })
    row.cover = cover
  }
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

// 修改公告重要性
router.patch('/important', checkAuth, new Permission(['ROLE_UPDATE_NOTICE']).hasPermission, new Log('公告模块', '修改公告是否为精华').setLog, async (ctx) => {

  const { id, important } = ctx.request.body

  const rows = await noticeModel.findAll({
    where: {
      important: 1
    },
    raw: true
  })

  const exist = rows.find(notice => notice.id === id)

  if (!exist && rows.length === 3) {
    ctx.response.body = {
      code: 20001,
      message: '最多只能添加三条，修改失败',
      success: false
    }
  } else {
    const updated = await noticeModel.update({
      important
    }, {
      where: {
        id
      }
    })
    if (updated) {
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
  }
})

// 查询公告详情
router.get('/info/:id', async (ctx) => {
  const notice = await noticeModel.findOne({
    where: {
      id: ctx.request.params.id
    },
    raw: true
  })
  const cover = await photoModel.findOne({
    where: {
      id: notice.cover
    },
    raw: true
  })
  notice.cover = cover
  ctx.response.body = {
    code: 20000,
    message: '查询成功',
    success: true,
    data: {
      notice
    }
  }
})

// 添加公告
router.post('/', checkAuth, new Permission(['ROLE_CREATE_NOTICE']).hasPermission, new Log('公告模块', '添加公告').setLog, async (ctx) => {
  const notice = ctx.request.body

  const genid = new GenId({ WorkerId: 1 })

  const res = await noticeModel.create({
    id: genid.NextId().toString(),
    name: notice.name,
    cover: notice.cover,
    content: notice.content,
    important: 0,
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
router.delete('/:id', checkAuth, new Permission(['ROLE_DELETE_NOTICE']).hasPermission, new Log('公告模块', '删除公告').setLog, async (ctx) => {
  const res = noticeModel.destroy({
    where: {
      id: ctx.params.id
    }
  })
  photoModel.destroy({
    where: {
      mark_id: ctx.request.params.id
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
