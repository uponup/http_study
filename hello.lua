#! /usr/local/bin/lua
-- #! /usr/local/openresty/luajit/bin/luajit

ngx.log(ngx.INFO, "hello world");
ngx.say("hello lua based on nginx");