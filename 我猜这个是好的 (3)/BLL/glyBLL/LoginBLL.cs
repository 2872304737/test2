using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace BLL
{
    public class LoginBLL
    {
        //登录
        public static DataTable Login(string phone, string password) { 
            return DAL.LoginDAL.Login(phone, password);
        }
    }
}
