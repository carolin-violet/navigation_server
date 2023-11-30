const Sequelize = require('sequelize')
const MySequelize = require('../config/mysqlConfig')

const userModel = MySequelize.define('user', {
  id: {
    type: Sequelize.STRING(19),
    field:  'id',
    primaryKey: true
  },
  name: {
    type: Sequelize.STRING(30),
    field:  'name',
    allowNull: false
  },
  password: {
    type: Sequelize.STRING(30),
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
  email: {
    type: Sequelize.STRING(50),
    field:  'email',
    allowNull: true
  },
  site_id: {
    type: Sequelize.STRING(19),
    field:  'site_id',
    allowNull: false
  },
  open: {
    type: Sequelize.TINYINT,
    field:  'open',
    allowNull: false
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