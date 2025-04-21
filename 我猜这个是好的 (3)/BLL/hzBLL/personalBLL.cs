using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.hzDAL
{
    public class personalBLL
    {
        public static bool tianjiayonghu(string zcemail, string zcphone, string zcpwd, string zcname, int zcage, string zcsfz, string zcxb)
        {
            return personalDAL.tianjiayonghu(zcemail, zcphone, zcpwd, zcname, zcage, zcsfz, zcxb);
        }
        public static DataTable jiuzhenren(int uid) { return personalDAL.jiuzhenren(uid); }

        public static DataTable dingdan(int uid)
        {
            return DAL.hzDAL.personalDAL.dingdan(uid);
        }
        public static DataTable zhlogin(string zh, string mm) { return DAL.hzDAL.personalDAL.zhlogin(zh, mm); }
        public static DataTable emaillogin(string email) { return DAL.hzDAL.personalDAL.emaillogin(email); }


        public static bool addjiuzhenren(string jzrname, string jzrsex, int jzrage, string jzrsfz, int yhid)
        { return DAL.hzDAL.personalDAL.addjiuzhenren(jzrname, jzrsex, jzrage, jzrsfz, yhid); }

        public static bool quxiaodingdan(int ddid) { return DAL.hzDAL.personalDAL.quxiaodingdan(ddid); }

        public static bool deljiuzhenren(int jzrid) { return DAL.hzDAL.personalDAL.deljiuzhenren(jzrid); }

        public static bool panduanaddjiuzhenren(string jzrsfz, string jzrname, int yhid) { return DAL.hzDAL.personalDAL.panduanaddjiuzhenren(jzrsfz, jzrname, yhid); }
    }
}
