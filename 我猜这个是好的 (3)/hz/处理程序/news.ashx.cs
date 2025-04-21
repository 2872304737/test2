using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using DAL.hzDAL;

namespace hz.处理程序
{
    /// <summary>
    /// 左导航栏的东西 的摘要说明
    /// </summary>
    public class news : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //客户端自动解析json数据，用对象的形式返回给你{ Name = "Alice", Age = 30 };
            context.Response.ContentType = "application/json";

            if (context.Request["TypeID"] == "0")
            {
                one(context);
                return;
            }
            else
            {
                two(context);
                return;
            }
        }

        public void one(HttpContext context)
        {
            DataTable onetype = newsBLL.onetype();
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = true,
                onetype
            }));
        }

        public void two(HttpContext context)
        {
            DataTable onetype = newsBLL.onetype(context.Request["TypeID"]);
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = true,
                onetype
            }));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}