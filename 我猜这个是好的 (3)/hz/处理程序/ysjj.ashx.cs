using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Newtonsoft.Json;
using DAL.hzDAL;

namespace hz.处理程序
{
    /// <summary>
    /// 订单添加的摘要说明
    /// </summary>
    public class ysjj : IHttpHandler {

        public void ProcessRequest (HttpContext context) {
            //客户端自动解析json数据，用对象的形式返回给你{ Name = "Alice", Age = 30 };
            context.Response.ContentType = "application/json";
            bool yue = newsBLL.appadd(context.Request["partin"], context.Request["numid"]);
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = yue
            }));
        }
     
        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}