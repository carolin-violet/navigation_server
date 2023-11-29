const Sequelize = require('sequelize')
const MySequelize = require('../config/mysqlConfig')

const userModel = MySequelize.define('user', {
  id: {
    type: Sequelize.STRING(19),
    field:  'id',
    primaryKey: true
  },
  number: {
    type: Sequelize.STRING(19),
    field:  'number',
    allowNull: false
  },
  name: {
    type: Sequelize.STRING(30),
    field:  'name',
    allowNull: false
  },
  phone: {
    type: Sequelize.STRING(11),
    field:  'phone',
    allowNull: false
  },
  password: {
    type: Sequelize.STRING(255),
    field:  'password',
    allowNull: false
  },
  role: {
    type: Sequelize.STRING(20),
    field:  'role',
    allowNull: false
  },
  gender: {
    type: Sequelize.TINYINT,
    field:  'gender',
    allowNull: true
  },
  birthday: {
    type: Sequelize.DATE,
    field:  'birthday',
    allowNull: true
  },
  email: {
    type: Sequelize.STRING(50),
    field:  'email',
    allowNull: true
  },
  avatar: {
    type: Sequelize.STRING(19),
    field:  'avatar',
    allowNull: true
  },
  create_time: {
    type: Sequelize.DATE,
    field:  'create_time',
    allowNull: false
  }
},
// {
//   tableName: 'user'   // 主要解决查询时将表名变复数的问题
// }
)

module.exports = userModel