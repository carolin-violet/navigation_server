const Sequelize = require('sequelize')
const MySequelize = require('../config/mysqlConfig')

const categoryModel = MySequelize.define('category', {
  id: {  // 根据此id去对应导航表里每一个用户不同模块的导航
    type: Sequelize.STRING(19),
    field:  'id',
    primaryKey: true
  },
  site_id: {
    type: Sequelize.STRING(19),
    field:  'site_id',
    allowNull: false
  },
  category_id: {  // 类别id
    type: Sequelize.STRING(19),
    field:  'category_id',
    allowNull: false
  },
  category_name: {  // 类别名称
    type: Sequelize.STRING(15),
    field:  'category_name',
    allowNull: false
  },
  parent_id: {  // 父类别id
    type: Sequelize.STRING(19),
    field:  'parent_id',
    allowNull: false
  },
  create_time: {
    type: Sequelize.DATE,
    field:  'create_time',
    allowNull: false
  }
},
// {
//   tableName: 'category'   // 主要解决查询时将表名变复数的问题
// }
)

module.exports = categoryModel