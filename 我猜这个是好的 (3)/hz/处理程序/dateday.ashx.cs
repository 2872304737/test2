using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using DAL.hzDAL;
using Newtonsoft.Json;

namespace hz.处理程序
{
    /// <summary>
    /// 右边导航日期及医生 的摘要说明
    /// </summary>
    public class dateday : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string datetime = context.Request["date"];
            string typeid= context.Request["type"];
            if (datetime == "0" && typeid == "0")
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
            DataTable da = newsBLL.dateday();
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = true,
                da
            }));
        }

        public void two(HttpContext context)
        {
            DataTable da = newsBLL.dateday(context.Request["date"], context.Request["type"]);
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = true,
                da
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