const Sequelize = require('sequelize')
const MySequelize = require('../config/mysqlConfig')

const logModel = MySequelize.define('log', {
  id: {
    type: Sequelize.STRING(19),
    field:  'id',
    primaryKey: true
  },
  user_name: {
    type: Sequelize.STRING(30),
    field:  'user_name',
    allowNull: false
  },
  user_id: {
    type: Sequelize.STRING(19),
    field:  'user_id',
    allowNull: false
  },
  model: {
    type: Sequelize.STRING(10),
    field:  'model',
    allowNull: false
  },
  description: {
    type: Sequelize.STRING(50),
    field:  'description',
    allowNull: false
  },
  params: {
    type: Sequelize.TEXT,
    field:  'params',
    allowNull: false
  },
  ip: {
    type: Sequelize.STRING(50),
    field:  'ip',
    allowNull: false
  },
  time: {
    type: Sequelize.DATE,
    field:  'time',
    allowNull: false
  },
  success: {
    type: Sequelize.TINYINT,
    field:  'success',
    allowNull: false
  },
  result: {
    type: Sequelize.TEXT,
    field:  'result',
    allowNull: false
  }
}
)

module.exports = logModel