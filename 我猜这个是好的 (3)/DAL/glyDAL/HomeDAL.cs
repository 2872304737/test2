using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    /// <summary>
    /// 管理员首页数据访问类
    /// </summary>
    public class HomeDAL
    {
        /// <summary>
        /// 获取总用户数
        /// </summary>
        /// <returns></returns>
        public static DataTable GetTotalUsers()
        {
            string sql = "select COUNT(*) from Usere";
            DataTable table = DBHELPER.getDataTable(sql);
            return table;
        }
        /// <summary>
        /// 获取总医生数
        /// </summary>
        /// <returns></returns>
        public static DataTable GetTotalDoctors()
        {
            string sql = "select COUNT(*) from Doctor";
            DataTable table = DBHELPER.getDataTable(sql);
            return table;
        }
        /// <summary>
        /// 获取总订单数
        /// </summary>
        /// <returns></returns>
        public static DataTable GetTotalOrders()
        {
            string sql = "select count(*),format(GETDATE(),'yyyy-MM-dd') from AppointmentOrder\r\nwhere format(CreateTime,'yyyy-MM-dd')=format(GETDATE(),'yyyy-MM-dd')";
            DataTable table = DBHELPER.getDataTable(sql);
            return table;
        }
        /// <summary>
        /// 获取今日收入
        /// </summary>
        /// <returns></returns>
        public static DataTable GetTodayRevenue() {
            string sql = @"
                SELECT SUM(Money) 
                FROM AppointmentOrder a
                JOIN Number b ON a.NumID = b.ID
                JOIN Doctor c ON b.DocID = c.DocID
                WHERE FORMAT(CreateTime, 'yyyy-MM-dd') = FORMAT(GETDATE(), 'yyyy-MM-dd')";
            DataTable table = DBHELPER.getDataTable(sql);
            return table;
        }
    }
}
