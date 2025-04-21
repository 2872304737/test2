using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.glyDAL
{
    public class goongGaoDAL
    {
        //查询
        public static DataTable gongGaoCha() {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("select NoticeID,Title,Content from Notice");
            return DBHELPER.getDataTable(sb.ToString());
        }

        //添加
        public static bool gongGaoAdd(string tit,string not,string now) {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("insert into Notice(Title,Content,data) values('{0}','{1}','{2}')",tit,not,now);
            if (DBHELPER.ExecuteNonQuery(sb.ToString()))
            {
                return true;
            }
            else {
                return false;
            }
        }

        //删除公告
        public static bool gongGaoDel(int n)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("delete from Notice where NoticeID = '{0}'",n);
            if (DBHELPER.ExecuteNonQuery(sb.ToString()))
            {
                return true;
            }
            else { 
                return false;
            }
        }
    }
}
