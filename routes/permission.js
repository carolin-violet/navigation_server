const Router = require('koa-router')
const router = new Router()

const permissionModel = require('../model/permission')
const rolePermissionModel = require('../model/role_permission')
const { checkAuth } = require("../middleware/auth")
const Permission = require("../middleware/permission")
const Log = require("../middleware/log")
const { QueryTypes } = require('sequelize')
const MySequelize = require('../config/mysqlConfig')

// 查询权限列表
router.get('/', checkAuth, new Permission(['ROLE_QUERY_PERMISSION']).hasPermission, new Log('权限模块', '查询权限列表').setLog, async (ctx) => {
  const rows = await permissionModel.findAll({
    raw: true
  })
  ctx.response.body = {
    code: 20000,
    success: true,
    message: '查询成功',
    data: {
      rows
    }
  }
})

// 查询manager、teacher、student角色对应的权限
router.get('/role', checkAuth, new Permission(['ROLE_QUERY_ROLE_PERMISSION']).hasPermission, new Log('权限模块', '查询manager、teacher、student角色对应的权限').setLog, async (ctx) => {
  const sql = `SELECT
	* 
FROM
	(
	SELECT
		role_permission.id,
		role_permission.role,
		role_permission.permission_id,
		permission.name,
		permission.description 
	FROM
		role_permission
		LEFT JOIN permission ON ( role_permission.permission_id = permission.id ) 
	) AS a 
WHERE
	role != 'admin'
    `
  const rows = await MySequelize.query(sql, {
    type: QueryTypes.SELECT
  })
  ctx.response.body = {
    code: 20000,
    success: true,
    message: '查询成功',
    data: {
      teacherManagerPermissionList: rows.filter(item => item.role === 'teacher_manager'),
      studentManagerPermissionList: rows.filter(item => item.role === 'student_manager'),
      teacherPermissionList: rows.filter(item => item.role === 'teacher'),
      studentPermissionList: rows.filter(item => item.role === 'student')
    }
  }
})

// 给角色添加权限
router.post('/', checkAuth, new Permission(['ROLE_ADD_ROLE_PERMISSION']).hasPermission, new Log('权限模块', '添加权限').setLog,  async (ctx) => {
  const { role, permission_id } = ctx.request.body
  const res = await rolePermissionModel.create({
    id: 0,
    role,
    permission_id
  })
  if (res) {
    ctx.response.body = {
      code: 20000,
      success: true,
      message: '添加成功',
    }
  } else {
    ctx.response.body = {
      code: 20001,
      success: false,
      message: '添加失败',
    }
  }
})

// 给角色删除权限
router.delete('/:id', checkAuth, new Permission(['ROLE_DELETE_ROLE_PERMISSION']).hasPermission, new Log('权限模块', '删除权限').setLog, async (ctx) => {
  const res = await rolePermissionModel.destroy({
    where: {
      id: ctx.request.params.id
    }
  })
  if (res) {
    ctx.response.body = {
      code: 20000,
      success: true,
      message: '删除成功',
    }
  } else {
    ctx.response.body = {
      code: 20001,
      success: false,
      message: '删除失败',
    }
  }
})




module.exports = router
