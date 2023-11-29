const GenId = require('../utils/GenId')
const logModel = require('../model/log')
const userModel = require('../model/user')

class Log{
  constructor(model, description){
    this.model = model
    this.description = description
  }
  get setLog() {
    return async(ctx, next) => {
      const user_id = ctx.user_id
      const user = await userModel.findOne({
        where: {
          id: user_id
        }
      })
      await next()
      const genid = new GenId({ WorkerId: 1 });
      await logModel.create({
        id: genid.NextId().toString(),
        user_id,
        user_name: user.name,
        model: this.model,
        description: this.description,
        params: JSON.stringify({ method: ctx.request.method, params: ctx.request.params, query: ctx.request.query, body: ctx.request.body}),
        ip: ctx.request.ip,
        time: new Date(),
        success: ctx.response.body.success ? 1 : 0,
        result: JSON.stringify(ctx.response.body)
      })
    }
  }
}

module.exports = Log