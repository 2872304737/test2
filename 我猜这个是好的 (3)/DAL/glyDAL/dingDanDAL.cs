using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.glyDAL
{
    public class dingDanDAL
    {
        public static DataTable GetOrders(int page, int size, string status)
        {
            int offset = (page - 1) * size;
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT b.Name AS 就诊人, e.Name AS 医生, d.Data AS 预约时间, FORMAT(a.CreateTime, 'yyyy-MM-dd') AS 下单时间, ");
            sb.Append("CASE a.Status WHEN 0 THEN '已预约' WHEN 1 THEN '已就诊' WHEN 2 THEN '已取消' END AS Column1 ");
            sb.Append("FROM AppointmentOrder a ");
            sb.Append("JOIN Patient b ON a.PatientID = b.PatientID ");
            sb.Append("JOIN Number c ON a.NumID = c.ID ");
            sb.Append("JOIN Roster d ON c.RosterID = d.RosterID ");
            sb.Append("JOIN Doctor e ON c.DocID = e.DocID ");
            sb.Append("WHERE 1=1 ");

            if (status != "全部订单")
            {
                sb.AppendFormat("AND a.Status = '{0}' ", status);
            }

            sb.AppendFormat("ORDER BY a.OrderID OFFSET {0} ROWS FETCH NEXT {1} ROWS ONLY", offset, size);
            return DBHELPER.getDataTable(sb.ToString());
        }

        // 其他方法...
    }
}
