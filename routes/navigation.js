const Router = require('koa-router')
const router = new Router()

const GenId = require('../utils/GenId')
const navigationModel = require('../model/navigation')
const { checkAuth } = require("../middleware/auth")
const Log = require("../middleware/log")

// 分页查询导航
router.get('/list/:current/:limit', checkAuth, new Log('导航模块', '分页查询导航列表信息').setLog, async (ctx) => {
  const { rows, count } = await navigationModel.findAndCountAll({
    attributes: {exclude: ['password']},
    where: {
      name: {
        [Op.like]: `%${ctx.request.query.key}%`
      },
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

// 添加导航
router.post('/', checkAuth, new Log('导航模块', '添加导航').setLog, async (ctx) => {
  const navigation = ctx.request.body
  const res = await navigationModel.findOne({
    where: {
      name: navigation.name,
      cat_id: navigation.cat_id
    }
  })
  if (res) {
    ctx.response.body = {
      code: 20001,
      message: '该导航名称已存在',
      success: false
    }
  } else {
    const genid = new GenId({ WorkerId: 1 })

    const res = await navigationModel.create({
      id: genid.NextId().toString(),
      cat_id: navigation.cat_id,
      name: navigation.name,
      description: navigation.description,
      url: navigation.url,
      ladder: navigation.ladder,
      create_time: new Date(),
    })
    if (res) {
      ctx.response.body = {
        code: 20000,
        message: '添加成功',
        success: true
      }
    } else {
      ctx.response.body = {
        code: 20001,
        message: '添加失败',
        success: false
      }
    }
  }
})

// 删除导航
router.delete('/:id', checkAuth, new Log('导航模块', '删除导航').setLog, async (ctx) => {
  const res = await navigationModel.destroy({
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

// 修改导航信息
router.put('/:id', checkAuth, new Log('导航模块', '修改导航信息').setLog, async (ctx) => {
  const navigation = ctx.request.body
  const res = await navigationModel.update(navigation, {
    where: {
      id: ctx.request.params.id
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
