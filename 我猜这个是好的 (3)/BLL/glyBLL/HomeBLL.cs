using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    /// <summary>
    /// 管理员首页业务逻辑类
    /// </summary>
    public class HomeBLL
    {
        /// <summary>
        /// 获取总用户数
        /// </summary>
        /// <returns></returns>
        public static DataTable GetTotalUsers() { 
            return DAL.HomeDAL.GetTotalUsers();
        }
        /// <summary>
        /// 获取总医生数
        /// </summary>
        /// <returns></returns>
        public static DataTable GetTotalDoctors() { 
            return DAL.HomeDAL.GetTotalDoctors();
        }
        //获取订单总数
        public static DataTable GetTotalOrders()
        {
            return DAL.HomeDAL.GetTotalOrders();
        }
        //获取今日收入
        public static DataTable GetTodayRevenue()
        {
            return DAL.HomeDAL.GetTodayRevenue();
        }
    }
}
