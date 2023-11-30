const userModel = require('../model/user')
class Permission{
  constructor(needPermissionList) {
    this.needPermissionList = needPermissionList
  }

  get hasPermission() {
    return async (ctx, next) => {
      const user_id = ctx.user_id

      const user = await userModel.findOne({
        where: {
          id: user_id
        },
        raw: true
      })

      // 此处需要判断用户角色是否在权限列表中
      if (user.role in this.needPermissionList) {
        await next()
      } else {
        ctx.throw(403, '权限不够')
      }
    }
  }
}

module.exports =  Permission