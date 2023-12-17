const fs = require('fs')
let path = require('path')
const Router = require('koa-router')
const router = new Router()

const GenId = require('../utils/GenId')
const categoryModel = require('../model/category')
const navigationModel = require('../model/navigation')
const { checkAuth } = require("../middleware/auth")
const Log = require("../middleware/log")

// 查询每一级的分类
router.get('/list/:category_id',  checkAuth, new Log('分类模块', '查询每一级分类').setLog, async (ctx) => {
  const { rows, count } = await categoryModel.findAndCountAll({
    attributes: { exclude: ['user_id'] },
    where: {
      user_id: ctx.user_id,
      category_id: ctx.params.category_id
    },
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

// 添加分类
router.post('/:parent_id', checkAuth, new Log('分类模块', '添加分类').setLog, async (ctx) => {
  console.log('xxx')
  const category = ctx.request.body
  const res = await categoryModel.findOne({
    where: {
      category_name: category.category_name,
      user_id: ctx.user_id
    }
  })
  if (res) {
    ctx.response.body = {
      code: 20001,
      message: '该分类名称已存在',
      success: false
    }
  } else {
    const genid = new GenId({ WorkerId: 1 })

    const res = await categoryModel.create({
      id: genid.NextId().toString(),
      user_id: ctx.user_id,
      category_name: category.category_name,
      parent_id: category.parent_id,
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

// 删除分类及其子分类及对应的导航
router.delete('/:id', checkAuth, new Log('分类模块', '删除分类').setLog, async (ctx) => {
  const children = await categoryModel.findAll({
    where: {
      parent_id: ctx.params.id
    }
  })
  // 先删除所有子分类及对应的导航
  for (const child of children) {
    await navigationModel.destroy({
      where: {
        cat_id: child.id
      }
    })
  }
  const res = await categoryModel.destroy({
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

// 修改分类信息
router.put('/:id', checkAuth, new Log('分类模块', '修改分类信息').setLog, async (ctx) => {
  const category = ctx.request.body
  const res = await categoryModel.update(category, {
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

// 导入（分类及对应导航）（未完成）
router.post('/import/all',  checkAuth, new Log('分类模块', '导出分类').setLog, async (ctx) => {
  const { file } = ctx.request.files
  try {
    const data = fs.readFileSync(file.filepath,'utf-8')
    const obj = JSON.parse(data)
    // 接下来需要将解析出来的数据导入到数据库中
    ctx.response.body = {
      code: 20000,
      message: '导入成功',
      success: true,
    }
  }catch(err) {
    ctx.response.body = {
      code: 20001,
      message: '导入失败',
      success: false,
    }
  }
})

// 导出所有数据（未作）
router.get('/export',  checkAuth, new Log('分类模块', '导出分类').setLog, async (ctx) => {
  const { rows, count } = await categoryModel.findAndCountAll({
    attributes: { exclude: ['user_id'] },
    where: {
      user_id: ctx.user_id,
      category_id: ctx.params.category_id
    },
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
module.exports = router
