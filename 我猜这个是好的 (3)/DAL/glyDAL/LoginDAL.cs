using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Security.Policy;

namespace DAL
{
    public class LoginDAL
    {
        /// <summary>
        /// 管理员登录
        /// </summary>
        /// <param name="phone">登录电话</param>
        /// <param name="password">登录密码</param>
        /// <returns></returns>
        public static DataTable Login(string phone,string password)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("select * from Usere where  Permissions = 'admin' and Phone='{0}' and Password = '{1}'", phone, password);
            return DBHELPER.getDataTable(sb.ToString());
        }
    }
}
