const Sequelize = require("sequelize");
const MySequelize = require("../config/mysqlConfig");

const categoryModel = MySequelize.define(
  "category",
  {
    id: {
      type: Sequelize.STRING(19),
      field: "id",
      primaryKey: true,
    },
    user_id: {
      type: Sequelize.STRING(19),
      field: "user_id",
      allowNull: false,
    },
    name: {
      // 类别名称
      type: Sequelize.STRING(15),
      field: "name",
      allowNull: false,
    },
    parent_id: {
      // 父类别id
      type: Sequelize.STRING(19),
      field: "parent_id",
      allowNull: false,
    },
    create_time: {
      type: Sequelize.DATE,
      field: "create_time",
      allowNull: false,
    },
  }
  // {
  //   tableName: 'category'   // 主要解决查询时将表名变复数的问题
  // }
);

module.exports = categoryModel;
