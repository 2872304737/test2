using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using BLL;
using DAL;
using Newtonsoft.Json;

namespace gly.处理程序
{
    /// <summary>
    /// yishengPage 的摘要说明
    /// </summary>
    public class yishengPage : IHttpHandler {

        public void ProcessRequest (HttpContext context) {
            context.Response.ContentType = "application/json";

            int page = int.Parse(context.Request["page"] ?? "1");
            int size = int.Parse(context.Request["size"] ?? "10");

            DataTable yscha = YiShengBLL.yscha(page, size);
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = true,
                yscha
            }));
        }

        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}