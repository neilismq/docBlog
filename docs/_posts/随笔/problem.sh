upstream tomcat_test.jd.zzq.jd.com {
                server 127.0.0.1:8001  weight=10 max_fails=2 fail_timeout=30s;
                # server 127.0.0.1:8002  weight=10 max_fails=2 fail_timeout=30s;
                # server 127.0.0.1:8003  weight=10 max_fails=2 fail_timeout=30s;
                # server 127.0.0.1:8004  weight=10 max_fails=2 fail_timeout=30s;
                # server 127.0.0.1:8005  weight=10 max_fails=2 fail_timeout=30s;
}
server
{
      listen 80;

      
      # server_name              *.jd.com *.jd.local *.jd.jd test.jd.zzq.jd.com;
      access_log               /export/Logs/servers/nginx/logs/test.jd.zzq.jd.com/test.jd.zzq.jd.com_access.log main;
      error_log                /export/Logs/servers/nginx/logs/test.jd.zzq.jd.com/test.jd.zzq.jd.com_error.log warn;
      error_page 411 = @my_error;
      root /export/App/test.jd.zzq.jd.com/;

      
      location / {
        proxy_next_upstream     http_500 http_502 http_503 http_504 error timeout invalid_header;
        proxy_set_header        Host  $host;
        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass              http://tomcat_test.jd.zzq.jd.com;
        expires                 0;

        # for jdos2.0 nginx monitor
        log_by_lua '
            jdn = require("stat");
            jdn.log()
        ';
        }

        # for jdos2.0 nginx monitor
        location = /stat/service {
            access_by_lua_file lua/token.lua;
            content_by_lua '
                cjson = require("cjson")
                local res = {}
                res["data"] = "nginx-1.9.7"
                res["success"] = true
                ngx.say(cjson.encode(res))
            ';
        }

        # for jdos2.0 nginx monitor
        location = /stat/status {
            access_by_lua_file lua/token.lua;
            content_by_lua '
                cjson = require("cjson")
                jdn = require("stat");
                local res = {}
                res["data"] = jdn.stat()
                res["success"] = true
                ngx.say(cjson.encode(res))
            ';
        }
}