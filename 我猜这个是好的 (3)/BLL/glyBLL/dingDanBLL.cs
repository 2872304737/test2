using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.glyDAL
{
    public class dingDanBLL
    {
        public static DataTable GetOrders(int page, int size, string status)
        {
            return dingDanDAL.GetOrders(page, size, status);
        }

        // 其他方法...
    }
}
