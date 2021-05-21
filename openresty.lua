location = /lua_api_request {
        content_by_lua_block{
        local cjson = require("cjson")
      local httpc = require("resty.http").new()
      local res, err = httpc:request_uri("http://api.openweathermap.org/data/2.5/weather?q=<>&appid=<>&units=metric&lang=<>", 
      {method = "GET"})
      
      
    if not res then
      ngx.log(ngx.ERR, "request failed: ", err)
      return
    end
    local t = cjson.decode(res.body)
    ngx.say(type(t))
    for k, v in pairs(t) do
      print(k, v)
    end
    }
    }