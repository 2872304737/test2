using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace gly
{
    /// <summary>
    /// HomePage 的摘要说明
    /// </summary>
    public class HomePage : IHttpHandler {

        public void ProcessRequest (HttpContext context) {
            context.Response.ContentType = "application/json";
            //获取总用户数
            DataTable totalUsers = BLL.HomeBLL.GetTotalUsers();
            //获取总医生数
            DataTable totalDoctors = BLL.HomeBLL.GetTotalDoctors();
            //获取总订单数
            DataTable todayRegistrations = BLL.HomeBLL.GetTotalOrders();
            //获取今日收入
            DataTable todayRevenue = BLL.HomeBLL.GetTodayRevenue();

            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = true,
                totalUsers,
                totalDoctors,
                todayRegistrations,
                todayRevenue
            }));
        }
     
        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}