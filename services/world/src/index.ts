import * as Koa from 'koa';

const app = new Koa();

app.use(async ctx => {
    ctx.body = 'World';
});

app.listen(process.env.PORT || 3001);