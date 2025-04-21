using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class YiShengBLL
    {
        //查询渲染
        public static DataTable yscha(int page, int size)
        {
            return DAL.YiShengDAL.yscha(page, size);
        }

        //添加
        //public static bool keshi(string ks)
        //{
        //    return DAL.YiShengDAL.keshi(ks);
        //}

        //修改
        public static bool ysUpdate(string n, string av, string posi, string res, int docid)
        {
            return DAL.YiShengDAL.ysUpdate(n, av, posi, res, docid);
        }

        //删除
        public static bool ysDel(int docid)
        {
            return DAL.YiShengDAL.ysDel(docid);
        }

        //添加
        public static bool ysAdd(string name, string avater, string TypeId, string TyId, string fksID, string jiejian, string zhiwei) 
        {
            return YiShengDAL.ysAdd(name, avater, TypeId, TyId, fksID, jiejian, zhiwei);
        }


        public static DataTable yijikeshiquanbu()
        {
            return DAL.YiShengDAL.yijikeshiquanbu();
        }

        public static DataTable erjikeshiquanbu(int pid)
        {
            return DAL.YiShengDAL.erjikeshiquanbu(pid);
        }
    }
}
