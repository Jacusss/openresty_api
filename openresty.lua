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
        ngx.say(res.body,"\n")
    local t = cjson.decode(res.body)
        ngx.say("type: ",type(t))
        a=(t.main.temp)
        b=(t.main.pressure)
        c=(t.main.humidity)
        delta = (math.pow(b, 2) - ((4 * a) * c))
        ngx.say("delta: ",delta)

        ngx.say("type: ",type(a, b, c))
        ngx.say("temp: ", a ," pressure: ", b ," humidity: ", c)

    if delta>0 then
     local  res, err = httpc:request_uri("192.168.2.2/win&A=200&FX=9", 
        {method = "POST"})
    end
    }
    }
