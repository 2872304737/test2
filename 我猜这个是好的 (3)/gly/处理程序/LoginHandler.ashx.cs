using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;

namespace gly
{
    /// <summary>
    /// LoginHandler 的摘要说明
    /// </summary>
    public class LoginHandler : IHttpHandler {

        public void ProcessRequest (HttpContext context) {
            //客户端自动解析json数据，用对象的形式返回给你{ Name = "Alice", Age = 30 };
            context.Response.ContentType = "application/json";

            string username = context.Request["username"];
            string password = context.Request["password"];

            try
            {
                DataTable isValid = BLL.LoginBLL.Login(username, password);
                //固定格式
                context.Response.Write(JsonConvert.SerializeObject(new
                {
                    success = isValid.Rows.Count > 0,
                    message = isValid.Rows.Count > 0 ? "登录成功" : "账号或密码错误"
                }));
            }
            catch (Exception ex)
            {
                context.Response.Write("{ \"success\": false, \"message\": \"系统错误\" }");
            }
        }
     
        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}