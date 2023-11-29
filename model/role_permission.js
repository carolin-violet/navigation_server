const Sequelize = require('sequelize')
const MySequelize = require('../config/mysqlConfig')

const userPermissionModel = MySequelize.define('role_permission', {
  id: {
    type: Sequelize.INTEGER,
    field:  'id',
    primaryKey: true
  },
  role: {
    type: Sequelize.STRING(20),
    field:  'role',
    allowNull: false
  },
  permission_id: {
    type: Sequelize.INTEGER,
    field:  'permission_id',
    allowNull: false
  },
}
)

module.exports = userPermissionModel