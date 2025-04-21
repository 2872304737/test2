
using DAL.hzDAL;
using hz;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;


namespace hz.处理程序
{
    /// <summary>
    /// personal 的摘要说明
    /// </summary>
    public class personal : IHttpHandler,IRequiresSessionState {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string action = context.Request["action"];

            if (context.Session != null && context.Session["id"] != null)
            {
                int userId = Convert.ToInt32(context.Session["id"]);
                // 添加调试信息
                //context.Response.Write($"<script>console.log('Session id: {context.Session["id"]}');</script>");

                if (action == "getperson")
                {
                    DataTable ds = personalBLL.jiuzhenren(userId);
                    context.Response.Write(JsonConvert.SerializeObject(ds));
                }
                else if (action == "dindang")
                {
                    DataTable dind = personalBLL.dingdan(userId);
                    context.Response.Write(JsonConvert.SerializeObject(dind));
                }
            }
            else
            {
                context.Response.Write("Session is not available.");
            }
        }

        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}