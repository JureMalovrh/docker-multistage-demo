import * as Koa from 'koa';

const app = new Koa();

app.use(async ctx => {
    ctx.body = 'World';
});

const servingPort = process.env.PORT || 3001;
console.log(`Serving on ${servingPort}`)
app.listen(servingPort);