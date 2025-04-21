using DAL.glyDAL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Management;

namespace gly.处理程序
{
    /// <summary>
    /// gonggaoPage 的摘要说明
    /// </summary>
    public class gonggaoPage : IHttpHandler {

        public void ProcessRequest (HttpContext context) {
            //客户端自动解析json数据，用对象的形式返回给你{ Name = "Alice", Age = 30 };
            context.Response.ContentType = "application/json";

            DataTable notice = goongGaoBLL.gongGaoCha();
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = true,
                notice
            }));
        }
     
        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}