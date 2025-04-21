using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.glyDAL
{
    public class PaiPanBLL
    {
        public static DataTable xianshiquanbu(int page, int size)
        {
            return DAL.glyDAL.PaiPanDAL.xianshiquanbu(page, size);
        }
    
        public static DataTable riqichaxun()
        {
            return DAL.glyDAL.PaiPanDAL.riqichaxun();
        }
        public static DataTable riqichashijian(string shijian)
        {
            return DAL.glyDAL.PaiPanDAL.riqichashijian(shijian);
        }
        public static string shijianchahaoyuan(int rid)
        {
            return DAL.glyDAL.PaiPanDAL.shijianchahaoyuan(rid);
        }
        public static bool idgaihaoyuan(int rid, int haoyuan)
        {
            return DAL.glyDAL.PaiPanDAL.idgaihaoyuan(rid, haoyuan);
        }

        public static DataTable yijikeshiquanbu()
        {
            return DAL.glyDAL.PaiPanDAL.yijikeshiquanbu();
        }
        public static DataTable erjikeshiquanbu(int pid)
        {
            return DAL.glyDAL.PaiPanDAL.erjikeshiquanbu(pid);
        }

        public static DataTable yishengzhiwei()
        {
            return DAL.glyDAL.PaiPanDAL.yishengzhiwei();
        }

        public static DataTable yishengmingzi(string zhiwei, int keshi)
        {
            return DAL.glyDAL.PaiPanDAL.yishengmingzi(zhiwei, keshi);
        }


        public static bool tianjiapaiban(string newdata, string newkaishi, string newjieshu, int newhaoyuan, int newysid)
        {
            return DAL.glyDAL.PaiPanDAL.tianjiapaiban(newdata, newkaishi, newjieshu, newhaoyuan, newysid);
        }


        public static DataTable tianjiabuzou1(string newdata, string newkaishi, string newjieshu)
        {
            return DAL.glyDAL.PaiPanDAL.tianjiabuzou1(newdata, newkaishi, newjieshu);
        }
        public static DataTable tianjiabuzou2(string newdata, string newkaishi, string newjieshu, int newhaoyuan)
        {
            return DAL.glyDAL.PaiPanDAL.tianjia2(newdata, newkaishi, newjieshu, newhaoyuan);
        }

        public static DataTable tianjiabuzou3(int rid, int ysid)
        {
            return DAL.glyDAL.PaiPanDAL.tianjiabuzou3(rid, ysid);

        }
        public static bool tianjiabuzou4(int rid, int ysid)
        {
            return DAL.glyDAL.PaiPanDAL.tianjiabuzou4(rid, ysid);
        }
        public static DataTable keshiyisheng(int keshi) { return DAL.glyDAL.PaiPanDAL.keshiyisheng(keshi); }

        public static bool gaiyishengpaiban(int ysid, int pbid) { return DAL.glyDAL.PaiPanDAL.gaiyishengpaiban(ysid, pbid); }
    }
}
