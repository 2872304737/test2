using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace hz.处理程序
{
    /// <summary>
    /// index 的摘要说明
    /// </summary>
    public class index : IHttpHandler {

        public void ProcessRequest (HttpContext context) {
            //客户端自动解析json数据，用对象的形式返回给你{ Name = "Alice", Age = 30 };
            context.Response.ContentType = "application/json";

            //使用Newtonsoft.Json序列化对象，使用ajax调用BLL的时候。直接调用goongGaoBLL.GetList()即可
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