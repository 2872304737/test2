using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.glyDAL
{
    public class PaiPanDAL
    {
        public static DataTable xianshiquanbu(int page, int size)
        {
            int offset = (page - 1) * size;
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT d.TypeID as 科室id, N.DocID AS 医生ID , N.ID AS 排班ID, " +
                            "R.Data AS 排班日期, D.Name AS 医生姓名, " +
                            "CASE WHEN N.IsAvailable = 1 THEN '接诊' WHEN N.IsAvailable = 0 THEN '不接诊' END AS 是否接诊, " +
                            "CASE WHEN MIN(CONVERT(TIME, R.StartTime)) >= '08:00:00' AND MAX(CONVERT(TIME, R.EndTime)) <= '12:00:00' THEN '上午' " +
                            "WHEN MIN(CONVERT(TIME, R.StartTime)) >= '13:00:00' AND MAX(CONVERT(TIME, R.EndTime)) <= '17:00:00' THEN '下午' END AS 上班时间, " +
                            "R.Maxnumber AS 号源上限 " +
                            "FROM Roster R " +
                            "JOIN Number N ON R.RosterID = N.RosterID " +
                            "JOIN Doctor D ON N.DocID = D.DocID " +
                            "GROUP BY d.TypeID, N.DocID, N.ID, R.Data, D.Name, D.Position, N.IsAvailable, R.Maxnumber " +
                            "ORDER BY R.Data desc " +
                            "OFFSET {0} ROWS FETCH NEXT {1} ROWS ONLY", offset, size);
            return DBHELPER.getDataTable(sb.ToString());
        }



        public static DataTable riqichaxun()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("select Data from Roster group by Data");
            return DBHELPER.getDataTable(sb.ToString());
        }

        public static DataTable riqichashijian(string shijian)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT RosterID, Data,");
            sb.AppendFormat(" CONCAT(    FORMAT(StartTime, 'HH'), '-', FORMAT(EndTime, 'HH')  ) AS 时间段 ");
            sb.AppendFormat(" FROM Roster ");
            sb.AppendFormat(" WHERE Data = '{0}';",shijian);
            return DBHELPER.getDataTable(sb.ToString());
        }

        public static string shijianchahaoyuan(int rid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("select Maxnumber from Roster where RosterID = '{0}'",rid);

            return DBHELPER.getDataTable(sb.ToString()).Rows[0][0].ToString();
        }

        public static bool idgaihaoyuan(int rid, int haoyuan)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("update Roster set Maxnumber = '{0}' where RosterID = '{1}'", haoyuan, rid);
            return DBHELPER.ExecuteNonQuery(sb.ToString());
        }

        public static DataTable yijikeshiquanbu() {
         StringBuilder sb= new StringBuilder();
            sb.AppendFormat("SELECT * FROM Type WHERE P_ID IS NULL;\r\n");
            return DBHELPER.getDataTable(sb.ToString());
        }

        public static DataTable erjikeshiquanbu(int pid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT * FROM Type WHERE P_ID = '{0}';\r\n", pid);
            return DBHELPER.getDataTable(sb.ToString());
        }

        public static DataTable yishengzhiwei()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("select Position from Doctor group by Position\r\n;\r\n");
            return DBHELPER.getDataTable(sb.ToString());
        }

        //根据职位和所属科室查询医生名字
        public static DataTable yishengmingzi(string zhiwei,int keshi)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("select * from Doctor where Position='{0}' and TypeID='{1}'", zhiwei,keshi);
            return DBHELPER.getDataTable(sb.ToString());
        }
        //根据所属科室查询医生名字
        public static DataTable keshiyisheng(int keshi)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("select * from Doctor where TypeID='{0}'", keshi);
            return DBHELPER.getDataTable(sb.ToString());
        }

        public static bool gaiyishengpaiban(int ysid,int pbid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("update Number set DocID='{0}' where ID='{1}'",ysid,pbid);
            return DBHELPER.ExecuteNonQuery(sb.ToString());
        }

        //太长的添加
        public static bool tianjiapaiban(string newdata,string newkaishi,string newjieshu,int newhaoyuan,int newysid)
        {
           StringBuilder sb=new StringBuilder();
            sb.AppendFormat("BEGIN TRANSACTION;\r\n");
            sb.AppendFormat("DECLARE @RosterID INT;\r\n");
            sb.AppendFormat("SELECT @RosterID = RosterID FROM Roster WHERE Data = '{0}' " +
                "AND StartTime = '{1}' " +
                "AND EndTime = '{2}'\r\n",newdata,newkaishi,newjieshu);
            sb.AppendFormat("IF @RosterID IS NULL\r\n");
            sb.AppendFormat("BEGIN\r\n");
            sb.AppendFormat("INSERT INTO Roster(Data, StartTime, EndTime, Maxnumber)" +
                " VALUES('{0}', '{1}', '{2}', '{3}');\r\n", newdata, newkaishi, newjieshu,newhaoyuan);
            sb.AppendFormat("SET @RosterID = SCOPE_IDENTITY();\r\n");
            sb.AppendFormat("END\r\n");
            sb.AppendFormat("IF NOT EXISTS(SELECT 1 FROM Number WHERE RosterID = @RosterID " +
                "AND DocID = '{0}' AND IsAvailable = 1)\r\n",newysid);
            sb.AppendFormat("BEGIN\r\n");
            sb.AppendFormat("INSERT INTO Number(RosterID, DocID, IsAvailable) VALUES(@RosterID, {0}, 1);\r\n",newysid);
            sb.AppendFormat("END\r\n");
            sb.AppendFormat("COMMIT TRANSACTION;\r\n");
            return DBHELPER.ExecuteNonQuery(sb.ToString());


        }

        public static DataTable tianjiabuzou1(string newdata, string newkaishi, string newjieshu)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT RosterID,Maxnumber FROM Roster WHERE Data = '{0}'" +
                " AND StartTime = '{1}' AND EndTime = '{2}'",newdata,newkaishi,newjieshu);
            
            return DBHELPER.getDataTable(sb.ToString());
        }

        public static DataTable tianjia2(string newdata, string newkaishi, string newjieshu,int newhaoyuan) {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("INSERT INTO Roster(Data, StartTime, EndTime, Maxnumber) " +
                " values('{0}', '{1}', '{2}','{3}')", newdata,newkaishi,newjieshu,newhaoyuan);
            DBHELPER.ExecuteNonQuery(sb.ToString());
            sb.Clear();
            sb.AppendFormat("SELECT RosterID FROM Roster WHERE Data = '{0}' " +
                "AND StartTime = '{1}' AND EndTime = '{2}'", newdata, newkaishi, newjieshu);
            return DBHELPER.getDataTable(sb.ToString());



        }

        public static DataTable tianjiabuzou3(int rid,int ysid) {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT 1 FROM Number WHERE RosterID = '{0}' AND DocID = '{1}' AND IsAvailable = 1",rid,ysid);
            return DBHELPER.getDataTable(sb.ToString());


        }

        public static bool tianjiabuzou4(int rid, int ysid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("INSERT INTO Number(RosterID, DocID, IsAvailable) VALUES('{0}', '{1}', 1)", rid, ysid);
            return DBHELPER.ExecuteNonQuery(sb.ToString());
        }
    }
}
