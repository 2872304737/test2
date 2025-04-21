using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace BLL.glyBLL
{
    public class KeShiBLL
    {
        //查询
        public static DataTable ksShiCha() {
            return DAL.glyDAL.KeShiDAL.ksShiCha();
        }

        //名字查询
        public static DataTable kemz(string ksName) {
            return DAL.glyDAL.KeShiDAL.kemz(ksName);
        }

        //添加科目代码
        public static bool ksShiTian(string name) {
            return DAL.glyDAL.KeShiDAL.ksShiTian(name);
        }

        //添加副科室
        public static bool fksAdd(string fksName, string fname) {
            return DAL.glyDAL.KeShiDAL.fksAdd(fksName,fname);
        }

        //修改副科室
        public static bool ksShiXiu(string ksName, string ordks) {
            return DAL.glyDAL.KeShiDAL.ksShiXiu(ksName, ordks);
        }

        //删除科室
        public static bool ksShiShan(string ksName)
        {
            return DAL.glyDAL.KeShiDAL.ksShiShan(ksName);
        }
    }
}
