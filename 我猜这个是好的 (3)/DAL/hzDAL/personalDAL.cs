using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace DAL.hzDAL
{
    public class personalDAL
    {
        public static bool tianjiayonghu(string zcemail, string zcphone, string zcpwd, string zcname, int zcage, string zcsfz, string zcxb)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("  BEGIN TRANSACTION; ");
            sb.AppendFormat("\r\n IF NOT EXISTS(SELECT 1 FROM Usere WHERE Email = '{0}') ", zcemail);
            sb.AppendFormat("\r\n AND NOT EXISTS(SELECT 1 FROM Usere WHERE Phone = '{0}')", zcphone);
            sb.AppendFormat("\r\n BEGIN");
            sb.AppendFormat("\r\n INSERT INTO Usere(Phone, Email, Password,Permissions)");
            sb.AppendFormat("\r\n VALUES('{0}', '{1}', '{2}','user');", zcphone, zcemail, zcpwd);
            sb.AppendFormat("\r\n DECLARE @NewUserID INT;");
            sb.AppendFormat("\r\n SET @NewUserID = SCOPE_IDENTITY();");
            sb.AppendFormat("\r\n INSERT INTO Patient (Name, Sex, Age, IDCard, UserID)");
            sb.AppendFormat("\r\n VALUES('{0}', '{1}', '{2}','{3}', @NewUserID);", zcname, zcxb, zcage, zcsfz);
            sb.AppendFormat("\r\n COMMIT TRANSACTION;");
            sb.AppendFormat("\r\n END");
            sb.AppendFormat("\r\n ELSE");
            sb.AppendFormat("\r\n BEGIN");
            sb.AppendFormat("\r\n ROLLBACK TRANSACTION;");
            sb.AppendFormat("\r\n END");

            return DBHELPER.ExecuteNonQuery(sb.ToString());
        }

        public static DataTable jiuzhenren(int uid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("  select ROW_NUMBER() OVER (ORDER BY b.Name) AS 序号," +
                " b.Name as 姓名,b.Sex as 性别,b.Age as 年龄,b.IDcard as " +
                " 身份证  ,b.PatientID as 就诊人id  from Usere as u join Patient as b on u.ID=b.UserID where b.State=0 and b.UserID='{0}'", uid);
            return DBHELPER.getDataTable(sb.ToString());

        }

        public static DataTable dingdan(int uid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("  select f.Name as 订单科室,e.Name as 订单医生,c.CreateTime as 订单预约时间,a.Name as 订单就诊人,");
            sb.AppendFormat("\r\nCASE ");
            sb.AppendFormat("\r\nWHEN c.Status = 0 THEN '未处理'");
            sb.AppendFormat("\r\nWHEN c.Status = 1 THEN '已处理'");
            sb.AppendFormat("\r\nWHEN c.Status = 2 THEN '已取消'");
            sb.AppendFormat("\r\nELSE '未知状态'");
            sb.AppendFormat("\r\nEND AS 订单状态 ,c.OrderID as 订单号 from");
            sb.AppendFormat(" Patient as a join Usere as b on a.UserID = b.ID join AppointmentOrder as c on c.PatientID = a.PatientID join Number as d");
            sb.AppendFormat("   on d.ID = c.NumID join Doctor as e on e.DocID = d.DocID join Type as f on f.TypeID = e.TypeID where  b.ID = '{0}'", uid);
            return DBHELPER.getDataTable(sb.ToString());

        }

        public static DataTable zhlogin(string zh, string mm)
        {

            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("select ID from Usere where Phone = '{0}' and Password = '{1}' and Permissions ='user'", zh, mm);
            return DBHELPER.getDataTable(sb.ToString());


        }

        public static DataTable emaillogin(string email)
        {

            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(" select ID from Usere where Email = '{0}' and Permissions ='user'", email);
            return DBHELPER.getDataTable(sb.ToString());
        }


        public static bool panduanaddjiuzhenren (string jzrsfz,string jzrname,int yhid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("select 1 from Patient where IDcard='{0}' and Name='{1}' and UserID='{2}'", jzrsfz, jzrname, yhid);
            return DBHELPER.getDataTable(sb.ToString()).Rows.Count > 0;
        }

        public static bool addjiuzhenren(string jzrname, string jzrsex, int jzrage, string jzrsfz, int yhid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("insert into Patient(Name,Sex,Age,IDcard,UserID) values('{0}','{1}','{2}','{3}','{4}')", jzrname, jzrsex, jzrage, jzrsfz, yhid);
            return DBHELPER.ExecuteNonQuery(sb.ToString());


        }

        public static bool quxiaodingdan(int ddid)
        {
            StringBuilder sb= new StringBuilder();
            sb.AppendFormat("update AppointmentOrder set Status=2 where OrderID='{0}'", ddid);
            return DBHELPER.ExecuteNonQuery(sb.ToString());
        }

       
        public static bool deljiuzhenren(int jzrid)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("update Patient set State=1 where PatientID='{0}'", jzrid);
            return DBHELPER.ExecuteNonQuery(sb.ToString());
        }


    }
}
