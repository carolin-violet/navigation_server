const Sequelize = require('sequelize')
const MySequelize = require('../config/mysqlConfig')

const noticeModel = MySequelize.define('notice', {
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
  content: {
    type: Sequelize.STRING(255),
    field:  'content',
    allowNull: false
  },
  create_time: {
    type: Sequelize.DATE,
    field:  'create_time',
    allowNull: false
  },
}
)

module.exports = noticeModel