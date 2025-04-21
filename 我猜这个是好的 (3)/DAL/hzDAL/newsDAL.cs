using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.hzDAL
{
    public class newsDAL
    {
        /// <summary>
        /// 一级科室展示
        /// </summary>
        /// <returns></returns>
        public static DataTable ontype()
        {
            return DBHELPER.getDataTable("select * from Type where p_id is null");
        }

        /// <summary>
        /// 二级科室展示
        /// </summary>
        /// <param name="typeid">一级科室id</param>
        /// <returns></returns>
        public static DataTable lasttype(string typeid)
        {
            return DBHELPER.getDataTable("select * from Type where P_ID="+typeid);
        }

        /// <summary>
        /// 星期和日期
        /// </summary>
        /// <returns></returns>
        public static DataTable weekdate()
        {
            return DBHELPER.getDataTable("select FORMAT(Data,'yyyy-MM-dd') Data,DATENAME(WEEKDAY,Data) week from Roster\r\nwhere FORMAT(Data,'yyyy-MM-dd') between FORMAT(GETDATE(),'yyyy-MM-dd') and FORMAT(GETDATE()+7,'yyyy-MM-dd')\r\ngroup by Data");
        }

        /// <summary>
        /// 对应日期的医生
        /// </summary>
        /// <param name="day">时间</param>
        /// <param name="tyid">科室ID</param>
        /// <returns></returns>
        public static DataTable weekdocter(string day,string tyid)
        {
            return DBHELPER.getDataTable(string.Format("CREATE TABLE #list (DocID INT,num nvarchar(50));\r\nINSERT INTO #list (DocID,num)\r\nexec nowtime @time='{0}',@type='{1}'\r\nselect distinct b.DocID,Name,Position,Avatar,case when num=0 then '今日约满' else '剩余号源：'+num end sl,Resume,Money from  Roster a\r\njoin Number b on a.RosterID=b.RosterID\r\njoin Doctor c on b.DocID=c.DocID\r\njoin #list d on d.DocID=b.DocID\r\nwhere a.Data='{0}' and c.TypeID='{1}'\r\n", day,tyid));
        }

        /// <summary>
        /// 当天对应科室的医生
        /// </summary>
        /// <param name="tyid">科室ID</param>
        /// <returns></returns>
        public static DataTable weekdocter(string tyid)
        {
            return DBHELPER.getDataTable(string.Format("DECLARE @date nvarchar(255);\r\nSET @date = FORMAT(GETDATE(), 'yyyy-MM-dd');CREATE TABLE #list (DocID INT,num nvarchar(50));\r\nINSERT INTO #list (DocID,num)\r\nexec nowtime @time=@date,@type='{0}'\r\nselect distinct b.DocID,Name,Position,Avatar,case when num=0 then '今日约满' else '剩余号源：'+num end sl,c.Resume from  Roster a\r\njoin Number b on a.RosterID=b.RosterID\r\njoin Doctor c on b.DocID=c.DocID\r\njoin #list d on d.DocID=b.DocID\r\nwhere a.Data=FORMAT(Data,'yyyy-MM-dd') and c.TypeID='{0}'\r\n", tyid));
        }

        /// <summary>
        /// 医生详细号源
        /// </summary>
        /// <param name="date">时间</param>
        /// <param name="id">医生id</param>
        /// <returns></returns>
        public static DataTable roster(string date, string id)
        {
            return DBHELPER.getDataTable(string.Format("EXEC everyday\r\n    @DocID = '{0}', \r\n    @Data = '{1}';", id,date));
        }
        /// <summary>
        /// 加订单
        /// </summary>
        /// <param name="jzr">就诊人ID</param>
        /// <param name="numid">排班ID</param>
        /// <returns></returns>
        public static bool appadd(string jzr,string numid)
        {
            return DBHELPER.ExecuteNonQuery(string.Format("insert AppointmentOrder(NumID,PatientID,Status,CreateTime)values ('{0}','{1}',0,GETDATE())", numid, jzr));
        }
        /// <summary>
        /// 就诊人下拉绑定
        /// </summary>
        /// <param name="id">用户ID</param>
        /// <returns></returns>
        public static DataTable jzr(string id)
        {
            return DBHELPER.getDataTable(string.Format("select PatientID,Name from Patient where UserID='{0}'",id));
        }



        //根据登录人的id查邮箱和手机号
        public static DataTable idselectemail(int id)
        {
            return DBHELPER.getDataTable(string.Format("select Email,Phone from Usere where ID='{0}'", id));
        }
    }
}
