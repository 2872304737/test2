using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.glyDAL
{
    public class goongGaoBLL
    {
        //查询公共
        public static DataTable gongGaoCha() {
            return DAL.glyDAL.goongGaoDAL.gongGaoCha();
        }

        //添加公告
        public static bool gongGaoAdd(string tit, string not, string now) {
            return DAL.glyDAL.goongGaoDAL.gongGaoAdd(tit,not,now);
        }

        //删除公告
        public static bool gongGaoDel(int n) {
            return DAL.glyDAL.goongGaoDAL.gongGaoDel(n);
        }
    }
}
