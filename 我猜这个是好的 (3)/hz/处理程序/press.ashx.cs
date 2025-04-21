using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace hz.处理程序
{
    /// <summary>
    /// press 的摘要说明
    /// </summary>
    public class press : IHttpHandler {

        public void ProcessRequest (HttpContext context) {
            //客户端自动解析json数据，用对象的形式返回给你{ Name = "Alice", Age = 30 };
            context.Response.ContentType = "application/json";

            context.Response.Write(JsonConvert.SerializeObject(new
            {

            }));
        }
     
        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}