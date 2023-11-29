/**
 * 用户id与站点id的对应
 * 一个用户对应一个站点，一个站点对应多个导航地址
 */
const Sequelize = require('sequelize')
const MySequelize = require('../config/mysqlConfig')

const userModel = MySequelize.define('user', {
  id: {
    type: Sequelize.STRING(19),
    field:  'id',
    primaryKey: true
  },
  user_id: {
    type: Sequelize.STRING(19),
    field:  'user_id',
    allowNull: false
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
})

module.exports = userModel