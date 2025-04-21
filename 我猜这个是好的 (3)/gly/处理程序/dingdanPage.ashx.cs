using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using BLL;
using DAL;
using DAL.glyDAL;
using Newtonsoft.Json;

namespace gly.处理程序
{
    /// <summary>
    /// dingdanPage 的摘要说明
    /// </summary>
    public class dingdanPage : IHttpHandler {

        public void ProcessRequest (HttpContext context) {
            context.Response.ContentType = "application/json";

            int page = int.Parse(context.Request["page"] ?? "1");
            int size = int.Parse(context.Request["size"] ?? "10");
            string status = context.Request["status"] ?? "全部订单";

            DataTable dinDan = dingDanBLL.GetOrders(page, size, status);
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = true,
                dinDan
            }));
        }

        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}