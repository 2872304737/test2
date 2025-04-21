using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;  

namespace hz.处理程序
{
    /// <summary>
    /// CheckSession 的摘要说明
    /// </summary>
    public class CheckSession : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";

            // 检查Session中是否存在某个用户标识
            if (context.Session != null && context.Session["id"] != null && !string.IsNullOrEmpty(context.Session["id"].ToString()))
            {
                // Session存在
                string jsonResponse = "{\"sessionExists\": true, \"id\": \"" + context.Session["id"].ToString() + "\"}";
                context.Response.Write(jsonResponse);
            }
            else
            {
                // Session不存在
                string jsonResponse = "{\"sessionExists\": false}";
                context.Response.Write(jsonResponse);
            }
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