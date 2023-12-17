const Sequelize = require('sequelize')
const MySequelize = require('../config/mysqlConfig')

const navigationModel = MySequelize.define('navigation', {
  id: {
    type: Sequelize.STRING(19),
    field:  'id',
    primaryKey: true
  },
  cat_id: {
    type: Sequelize.STRING(19),
    field:  'cat_id',
    allowNull: false
  },
  name: {
    type: Sequelize.STRING(30),
    field:  'name',
    allowNull: false
  },
  description: {
    type: Sequelize.STRING(100),
    field:  'description',
    allowNull: true
  },
  url: {
    type: Sequelize.STRING(255),
    field:  'url',
    allowNull: false
  },
  ladder: {
    type: Sequelize.TINYINT,
    field:  'ladder',
    allowNull: false
  },
  create_time: {
    type: Sequelize.DATE,
    field:  'create_time',
    allowNull: false
  }
},
// {
//   tableName: 'navigation'   // 主要解决查询时将表名变复数的问题
// }
)

module.exports = navigationModel