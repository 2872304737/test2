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
    /// 医生预约的具体时间 的摘要说明
    /// </summary>
    public class yuyue1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";

            DataTable yue = newsBLL.losttabl(context.Request["date"], context.Request["ID"]);
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = true,
                yue
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