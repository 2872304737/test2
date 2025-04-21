using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class YiShengDAL
    {
        //查询渲染
        public static DataTable yscha(int page, int size) {
            int offset = (page - 1) * size;
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT d.DocID AS 医生ID, d.Name AS 医生姓名, d.Avatar AS 头像地址, t2.Name AS 所属科室, t1.Name AS 二级科室, d.Resume AS 简历, d.Position AS 职位, d.Money AS 就诊费用 " +
                            "FROM Doctor d " +
                            "LEFT JOIN Type t1 ON d.TypeID = t1.TypeID " +
                            "LEFT JOIN Type t2 ON t1.P_ID = t2.TypeID " +
                            "WHERE State = 'false' " +
                            "ORDER BY d.DocID " +
                            "OFFSET {0} ROWS FETCH NEXT {1} ROWS ONLY", offset, size);
            return DBHELPER.getDataTable(sb.ToString());
        }

        //修改医生
        public static bool ysUpdate(string n,string av,string posi,string res,int docid) {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("update Doctor set Name='{0}',Avatar='{1}',Position='{2}',Resume='{3}' where DocID = '{4}'",n,av,posi,res,docid);
            if (DBHELPER.ExecuteNonQuery(sb.ToString()))
            {
                return true;
            }
            else {
                return false;
            }
        }
        //删除医生
        public static bool ysDel(int docid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("update Doctor set State = 'true' where DocID = '{0}'", docid);
            if (DBHELPER.ExecuteNonQuery(sb.ToString()))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //添加医生
        public static bool ysAdd(string name,string avater,string TypeId, string TyId,string fksID,string jiejian,string zhiwei)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("INSERT INTO Doctor (Name, Avatar, TypeID, Resume, Position, state) VALUES ('{0}','{1}',{2}," +
    
                "CONCAT('主科室ID:','{3}', '; 副科室ID:', '{4}', '; 简介:', '{5}'),'6','0');"
                , name, avater, TypeId, TyId, fksID, jiejian, zhiwei);
            if (DBHELPER.ExecuteNonQuery(sb.ToString()))
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public static DataTable yijikeshiquanbu()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT * FROM Type WHERE P_ID IS NULL;\r\n");
            return DBHELPER.getDataTable(sb.ToString());
        }

        public static DataTable erjikeshiquanbu(int pid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT * FROM Type WHERE P_ID = '{0}';\r\n", pid);
            return DBHELPER.getDataTable(sb.ToString());
        }
    }
}
