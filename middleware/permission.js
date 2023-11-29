const userModel = require('../model/user')
const { QueryTypes } = require('sequelize')
const MySequelize = require('../config/mysqlConfig')


class Permission{
  constructor(needPermissionList) {
    this.needPermissionList = needPermissionList
  }

  get hasPermission() {
    return async (ctx, next) => {

      const sql = `SELECT
      role_permission.id,
      role_permission.permission_id,
      permission.name,
      permission.description 
    FROM
      role_permission
      LEFT JOIN permission ON ( role_permission.permission_id = permission.id ) 
    WHERE
      role_permission.role = (
      SELECT
        role 
      FROM
      USER 
    WHERE
      id = :user_id)`

      const user_id = ctx.user_id

      const userPermission = await MySequelize.query(sql, {
        replacements: { user_id: user_id },
        type: QueryTypes.SELECT
      })
      const permissionList = userPermission.reduce((pre, next) => {
        pre.push(next.name)
        return pre
      }, [])

      // 此处需要判断needPermissionList(需要的权限)是否包含permissionList(拥有的所有权限)中
      const list =this.needPermissionList.reduce((pre, next) => {
        permissionList.includes(next) ? pre.push(next) : ''
        return pre
      }, [])

      if (list.length === this.needPermissionList.length) {
        await next()
      } else {
        ctx.throw(403, '权限不够')
      }
    }
  }
}

module.exports =  Permission