const Sequelize = require('sequelize')
const MySequelize = require('../config/mysqlConfig')

const permissionModel = MySequelize.define('permission', {
  id: {
    type: Sequelize.INTEGER,
    field:  'id',
    primaryKey: true,
  },
  name: {
    type: Sequelize.STRING(50),
    field:  'name',
    allowNull: false
  },
  description: {
    type: Sequelize.STRING(50),
    field:  'description',
    allowNull: false
  },
}
)

module.exports = permissionModel