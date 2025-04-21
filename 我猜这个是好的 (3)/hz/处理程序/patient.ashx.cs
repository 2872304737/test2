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
    /// patient 的摘要说明
    /// </summary>
    public class patient : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            DataTable yue = newsBLL.jzr(context.Request["id"]);
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