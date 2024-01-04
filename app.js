const Koa = require("koa");
const koaBody = require("koa-body");
const cors = require("koa2-cors");
const Router = require("koa-router");
const error = require("koa-json-error");
const fs = require("fs");
const consola = require("consola");
const path = require("path");

const app = new Koa();
const router = new Router();

const spendTimeMiddleWare = require("./middleware/spendTime");

function useMiddleware() {
  app.use(
    error({
      postFormat: (e, { stack, ...rest }) =>
        process.env.NODE_ENV === "production" ? rest : { stack, ...rest },
    })
  );
  app.use(spendTimeMiddleWare);
  app.use(
    koaBody({
      multipart: true,
      // formidable: {
      //   //上传文件存储目录
      //   uploadDir:  path.join(__dirname, `/public/uploads/`),
      //   //允许保留后缀名
      //   keepExtensions: true,
      //   multipart: true
      // }
    })
  );
  app.use(require("koa-static")(__dirname + "/public"));
  app.use(
    cors({
      origin: function (ctx) {
        return "*";
      },
      exposeHeaders: ["WWW-Authenticate", "Server-Authorization"],
      maxAge: 86400,
      credentials: true, // 允许携带头部验证信息
      allowMethods: [
        "GET",
        "POST",
        "PUT",
        "PATCH",
        "DELETE",
        "HEAD",
        "OPTIONS",
      ],
      allowHeaders: [
        "Content-Type",
        "Authorization",
        "Accept",
        "X-Token",
        "X-Device-Id",
        "X-Uid",
      ],
    })
  );
}

function useRouter(path) {
  path = path || __dirname + "/routes";
  //注册路由
  let urls = fs.readdirSync(path);
  urls.forEach((element) => {
    const elementPath = path + "/" + element;
    const stat = fs.lstatSync(elementPath);
    const isDir = stat.isDirectory();
    if (isDir) {
      // 文件夹递归注册路由
      useRouter(elementPath);
    } else {
      let module = require(elementPath);
      //routes里的文件名作为 路由名
      router.use(
        "/violet-navigation/" + element.replace(".js", ""),
        module.routes()
      );
    }
  });
  //使用路由
  app.use(router.routes()).use(router.allowedMethods());
}

async function start() {
  useMiddleware();
  useRouter();
  const host = "127.0.0.1";
  const port = 9990;
  app.listen(port, host);
  consola.ready({
    message: `Server listening on http://${host}:${port}`,
    badge: true,
  });
}

start();
