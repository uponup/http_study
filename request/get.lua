#! /usr/local/openresty/luajit/bin/luajit

local headers = ngx.req.get_headers()
local raw_headers = ngx.req.raw_headers()

local str = {}
for k,v in pairs(headers) do
    local s = string.format('%-10s=>', k)
    if type(v) == 'string' then
        key_value = s .. v
    else
        key_value = s .. table.concat(v, ',')
    end

    str[#str+1] = key_value
end

str[#str + 1] = "\nraw header is :\n"
str = table.concat(str, '\n')

ngx.header['Content-Length'] = #str + #raw_headers
ngx.print(str)
ngx.print(raw_headers)