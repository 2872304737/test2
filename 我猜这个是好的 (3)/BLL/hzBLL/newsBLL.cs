using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Microsoft.SqlServer.Server;

namespace DAL.hzDAL
{
    public class newsBLL
    {
        public static DataTable onetype()
        {
            return newsDAL.ontype();
        }
        public static DataTable onetype(string id)
        {
            return newsDAL.lasttype(id);
        }
        public static DataTable dateday()
        {
            return newsDAL.weekdate();
        }
        public static DataTable dateday(string day,string typeid)
        {
            return newsDAL.weekdocter(day,typeid);
        }

        public static DataTable losttabl(string data,string id)
        {
            return newsDAL.roster(data,id);
        }
        public static bool appadd(string data, string id)
        {
            return newsDAL.appadd(data,id);
        }
        public static DataTable jzr(string id)
        {
            return newsDAL.jzr(id);
        }

        public static DataTable idselectemail(int id) { return newsDAL.idselectemail(id); }
    }
}
