const Router = require('koa-router')
const router = new Router()

const bcrypt = require('bcryptjs')
const GenId = require('../utils/GenId')
const jwtUtils = require('../utils/JwtUtil')
const userModel = require('../model/user')
const photoModel = require('../model/photo')
const Sequelize = require('sequelize')
const Op = Sequelize.Op
const { QueryTypes } = require('sequelize')
const MySequelize = require('../config/mysqlConfig')
const { generateKeys, decrypt } = require('../utils/rsaUtil')
const { writeToRedis, readFromRedis } = require('../config/redisConfig')
const { checkAuth } = require("../middleware/auth")
const Permission = require("../middleware/permission")
const Log = require("../middleware/log")

// 分页查询用户
router.get('/list/:current/:limit', checkAuth, new Permission(['ROLE_QUERY_USER_LIST']).hasPermission, new Log('用户模块', '分页查询用户列表信息').setLog, async (ctx) => {
  const { rows, count } = await userModel.findAndCountAll({
    attributes: {exclude: ['password']},
    where: {
      role: {
        [Op.like]: `%${ctx.request.query.role}%`
      },
      [Op.or]: {
        number: {
          [Op.like]: `%${ctx.request.query.key}%`
        },
        name: {
          [Op.like]: `%${ctx.request.query.key}%`
        }
      },
      [Op.not]: {
        role: 'admin'
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
    const avatar = await photoModel.findOne({
      where: {
        id: row.avatar
      },
      raw: true
    })
    row.avatar = avatar
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

// 根据用户id查看用户详情信息
router.get('/info/:id',  checkAuth, new Permission(['ROLE_QUERY_USER_DETAIL']).hasPermission, new Log('用户模块', '查询用户详情信息').setLog, async (ctx) => {
  const user = await userModel.findOne({
    attributes: { exclude: ['password'] },
    where: {
      id: ctx.request.params.id
    },
    raw: true
  })
  const avatar = await photoModel.findOne({
    where: {
      id: user.avatar
    },
    raw: true
  })
  user.avatar = avatar
  ctx.response.body = {
    code: 20000,
    message: '查询成功',
    success: true,
    data: {
      user
    }
  }
})

// 添加用户
router.post('/', checkAuth, new Permission(['ROLE_CREATE_USER']).hasPermission, new Log('用户模块', '添加用户').setLog, async (ctx) => {
  const user = ctx.request.body
  const res = await userModel.findOne({
    where: {
      number: user.number
    }
  })
  if (res) {
    ctx.response.body = {
      code: 20001,
      message: '该工号已被注册',
      success: false
    }
  } else {
    const genid = new GenId({ WorkerId: 1 })

    const res = await userModel.create({
      id: genid.NextId().toString(),
      name: user.name,
      number: user.number,
      phone: user.phone,
      role: user.role,
      gender: user.gender,
      birthday: user.birthday,
      email: user.email,
      password: bcrypt.hashSync(user.password),
      create_time: new Date(),
    })
    if (res) {
      ctx.response.body = {
        code: 20000,
        message: '注册成功,请前往登录',
        success: true
      }
    } else {
      ctx.response.body = {
        code: 20001,
        message: '注册失败',
        success: false
      }
    }
  }
})

// 删除用户
router.delete('/:id', checkAuth, new Permission(['ROLE_DELETE_USER']).hasPermission, new Log('用户模块', '删除用户').setLog, async (ctx) => {
  const res = await userModel.destroy({
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

// 修改用户信息
router.put('/info/:id', checkAuth, new Permission(['ROLE_UPDATE_USER']).hasPermission, new Log('用户模块', '修改用户信息').setLog, async (ctx) => {
  const user = ctx.request.body
  const res = await userModel.update(user, {
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

// 用户修改个人信息
router.put('/info', checkAuth, new Log('用户模块', '修改个人信息').setLog, async (ctx) => {
  const user = ctx.request.body
  const res = await userModel.update(user, {
    where: {
      id: ctx.user_id
    }
  })
  console.log('xxx', user, res);
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

// 登录
router.post('/login', async (ctx) => {
  const { number, password } = ctx.request.body
  const user = await userModel.findOne({
    where: { number },
    raw: true
  })
  if (user) {
    const ip = ctx.ip
    privateKey = await readFromRedis(`${ip}-privateKey:`)
    // 先对密码rsa解密
    const cPassword = decrypt(password, privateKey)
    // 校验密码
    const res = bcrypt.compareSync(cPassword, user.password)
    // const res = bcrypt.compareSync(password, user.password)

    if (res) {
      const token = jwtUtils.generateToken({ id: user.id }, '1 days')
      const avatar = await photoModel.findOne({
        where: {
          id: user.avatar
        },
        raw: true
      })
      user.avatar = avatar?.url || ''
      ctx.response.body = {
        code: 20000,
        message: '登录成功',
        success: true,
        data: {
          info: user,
          token,
          failure_time: new Date().getTime() + 1000*60*60*24,
        }
      }
    } else {
      ctx.response.body = {
        code: 20001,
        message: '密码错误',
        success: false
      }
    }
  } else {
    ctx.response.body = {
      code: 20001,
      message: '用户不存在',
      success: false
    }
  }
})

// 获取公钥并存入redis
router.get('/publicKey', async (ctx) => {
  // 获取客户端ip
  const ip = ctx.ip

  // 生成密钥对并存入redis
  const { publicKey, privateKey } = generateKeys()
  writeToRedis(`${ip}-publicKey:`, publicKey, 60)
  writeToRedis(`${ip}-privateKey:`, privateKey, 60)

  ctx.response.body = {
    code: 20000,
    message: '获取成功',
    success: true,
    data: {
      publicKey
    }
  }
})

// 查询用户权限菜单用于前端动态生成页面
router.get('/permission', checkAuth, new Log('用户模块', '获取权限菜单').setLog, async (ctx) => {
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

  const userPermission = await MySequelize.query(sql, {
    replacements: { user_id: ctx.user_id },
    type: QueryTypes.SELECT
  })
  const permissions = userPermission.reduce((pre, next) => {
    pre.push(next.name)
    return pre;
  }, [])
  ctx.response.body = {
    code: 20000,
    message: '获取成功',
    success: true,
    data: {
      permissions
    }
  }
})

// 管理员重置密码
router.patch('/reset-password', checkAuth, new Permission(['ROLE_RESET_PASSWORD']).hasPermission, new Log('用户模块', '管理员重置密码').setLog, async (ctx) => {

  const ip = ctx.ip
  privateKey = await readFromRedis(`${ip}-privateKey:`)
  // 先对密码rsa解密
  const cPassword = decrypt(ctx.request.body.password, privateKey)

  const updated = await userModel.update({
    password: bcrypt.hashSync(cPassword)
  }, {
    where: {
      id: ctx.request.body.id
    }
  })
  if (updated) {
    ctx.response.body = {
      code: 20000,
      message: '密码重置成功',
      success: true
    }
  } else {
    ctx.response.body = {
      code: 20001,
      message: '密码重置失败',
      success: false
    }
  }
})

// 用户修改密码
router.patch('/change-password', checkAuth, new Log('用户模块', '用户修改密码').setLog, async (ctx) => {

  const ip = ctx.ip
  privateKey = await readFromRedis(`${ip}-privateKey:`)
  // 先对密码rsa解密
  const cPassword = decrypt(ctx.request.body.password, privateKey)

  const updated = await userModel.update({
    password: bcrypt.hashSync(cPassword)
  }, {
    where: {
      id: ctx.user_id
    }
  })
  if (updated) {
    ctx.response.body = {
      code: 20000,
      message: '密码修改成功',
      success: true
    }
  } else {
    ctx.response.body = {
      code: 20001,
      message: '密码修改失败',
      success: false
    }
  }
})

module.exports = router
