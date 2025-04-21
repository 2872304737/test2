using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.glyDAL
{
    public class KeShiDAL
    {
        //查科室
        public static DataTable ksShiCha() {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT \r\n  main.Name AS 主科室名称,\r\n    COALESCE(\r\n        STUFF(\r\n            (SELECT ', ' + sub.Name\r\n             FROM Type sub\r\n             WHERE sub.P_ID = main.TypeID   and    sub.status='false' \r\n             FOR XML PATH('')\r\n            ), 1, 2, ''\r\n        ), \r\n        '暂无副科室'\r\n    ) AS 副科室列表\r\nFROM \r\n    Type main\r\nWHERE \r\n   main.status='false' and   main.P_ID IS NULL\r\nGROUP BY \r\n    main.TypeID, main.Name;");
            return DBHELPER.getDataTable(sb.ToString());
        }

        //名称查科室
        public static DataTable kemz(string ksName)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("select * from Type where Name = '{0}'",ksName);
            return DBHELPER.getDataTable(sb.ToString());
        }

        //添加主科室
        public static bool ksShiTian(string ksName)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("INSERT INTO Type (Name, P_ID) VALUES ('{0}', NULL) ", ksName);
            if (DBHELPER.ExecuteNonQuery(sb.ToString()))
            {
                return true;
            }
            else {
                return false;
            }
        }

        //添加副科室
        public static bool fksAdd(string fksName, string fname) {
            fksName = fksName.TrimEnd(',');
            fname = fname.TrimEnd(',');
            
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("insert into Type(Name,P_ID) values('{0}',(select TypeID from Type where Name='{1}'))", fksName,fname);
            if (DBHELPER.ExecuteNonQuery(sb.ToString()))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //修改副科室
        public static bool ksShiXiu(string ksName, string ordks)
        {
            ksName = ksName.TrimEnd(',');
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("update Type set Name='{0}' where TypeID=(select TypeID from Type where Name='{1}')", ksName, ordks);
            if (DBHELPER.ExecuteNonQuery(sb.ToString()))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //删除科室
        public static bool ksShiShan(string ksName)
        {
            ksName = ksName.TrimEnd(',');
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("update Type set status='1'  where Name='{0}'", ksName);
            if (DBHELPER.ExecuteNonQuery(sb.ToString()))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
