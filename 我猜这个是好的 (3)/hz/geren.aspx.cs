using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using DAL.hzDAL;
using System.Xml.Linq;
using System.Runtime.CompilerServices;
using System.Data;

namespace hz
{
	public partial class geren : System.Web.UI.Page
	{
        public string xyz;

        [WebMethod]
        public static string ClearSession()
        {
            try
            {
                HttpContext.Current.Session["id"] = null;
                return "success";
            }
            catch (Exception)
            {
                return "error";
            }
        }


        [WebMethod]
        public static string CancelOrder(string orderId)
        {
            // 处理逻辑，例如将订单状态更新为已取消
            // ...

            personalBLL.quxiaodingdan(int.Parse( orderId));
            // 返回结果
            return "订单已取消: 订单号 - " + orderId;
        }

        [WebMethod]
        public static string DeletePatient(int patientId)
        {
            // 调用数据访问层方法删除就诊人
            bool result = personalBLL.deljiuzhenren(patientId);

            if (result)
            {
                return "就诊人已删除: 就诊人ID - " + patientId;
            }
            else
            {
                return "删除失败: 就诊人ID - " + patientId;
            }
        }

        [WebMethod]
        public static string AddPatient(string patientName, string patientId)
        {
            // 处理逻辑，例如将数据保存到数据库
            // ...
            string name= patientName;
            string sfz = patientId;
            if (personalBLL.panduanaddjiuzhenren(patientId,patientName, int.Parse(HttpContext.Current.Session["id"].ToString())))
            {
                return "就诊人已存在: 姓名 - " + patientName + "，身份证 - " + patientId;
            }
            else
            {
                GetAgeAndGender(sfz, out int zcage, out string zcxb);
                personalBLL.addjiuzhenren(name, zcxb, zcage, sfz, int.Parse(HttpContext.Current.Session["id"].ToString()));
                // 返回结果
                return "就诊人添加成功: 姓名 - " + patientName + "，身份证 - " + patientId;
            }
               
        }

        protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                if (Session["id"] == null)
                {
                    zhdlli.Visible = true;
                    jzrglli.Visible = false;
                    ddjlli.Visible = false;
                    tcdlli.Visible = false;
                    login.Style["display"] = "block";
                    info.Style["display"] = "none";
                }
                else
                {
                    zhdlli.Visible = false;
                    jzrglli.Visible = true;
                    ddjlli.Visible = true;
                    tcdlli.Visible = true;
                    login.Style["display"] = "none";
                    info.Style["display"] = "block";
                    // 将 Session["id"] 的值赋给 xyz
                    xyz = Session["id"].ToString();
                }
            }
        }

        //首先先定义一个全局变量给登录用
        public static string loginstr;
        //登录用的发邮件
        [WebMethod]
        public static string loginyanzhengmaClick(string regemail)
        {
            DataTable dtdt = personalBLL.emaillogin(regemail);
            if (dtdt.Rows.Count >= 1)
            {
                //随机验证码
                Random rm = new Random();
                int i;
                loginstr = string.Empty;
                for (int p = 0; p < 6; p++)
                {
                    i = Convert.ToInt32(rm.NextDouble() * 10);
                    loginstr += i;
                }
                string content = "似了一半的共于⺄提醒您：您正在使用邮箱登录，您本次登录的验证码是：" + loginstr;
                SendEmail1(regemail, "绝命毒师登录账号提示", content);//收件人邮箱，邮箱标题，邮箱内容
                return loginstr;
            }
            else
            {
                return "error";
            }
            
        }
        protected void loginValidateCode_Server(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value == loginstr);
        }


        //首先先定义一个全局变量
        public static string str;
        [WebMethod]
        public static string yanzhengmaClick(string regemail)
        {
            //随机验证码
            Random rm = new Random();
            int i;
            str = string.Empty;
            for (int p = 0; p < 6; p++)
            {
                i = Convert.ToInt32(rm.NextDouble() * 10);
                str += i;
            }
            string content = "似了一半的共于⺄提醒您：您正在使用邮箱安全验证服务，您本次操作注册的验证码是：" + str;
            SendEmail1(regemail, "绝命毒师注册账号提示", content);//收件人邮箱，邮箱标题，邮箱内容
            return str;
        }

        protected void ValidateCode_Server(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value == str);
        }

        #region
        public static void SendEmail1(string mailTo, string mailSubject, string mailContent)
        {
            //("邮箱服务器类型", 端口号);
            SmtpClient mailClient = new SmtpClient("smtp.qq.com");
            mailClient.EnableSsl = true;
            mailClient.UseDefaultCredentials = false;
            //Credentials登陆SMTP服务器的身份验证.

            mailClient.Credentials = new NetworkCredential("2872304737@qq.com", "ujaawxqjvyipdeje");//邮箱，
            MailMessage message = new MailMessage(new MailAddress("2872304737@qq.com", "玩原神玩的"), new MailAddress(mailTo));//发件人，收件人
            message.IsBodyHtml = true;
            message.Body = mailContent;//邮件内容
            message.Subject = mailSubject;
            mailClient.Send(message); // 发送邮件
        }
        #endregion

        protected void zhuceButton_Click(object sender, EventArgs e)
        {
            string zcemail =this.regemail.Value;
            string zcphone=this.regphone.Value;
            string zcpwd=this.regpwd2.Value;
            string zcname=this.regname.Value;
            string zcsfz=this.regsfz.Value;
            // 获取年龄和性别
            GetAgeAndGender(zcsfz, out int zcage, out string zcxb);
            

            personalBLL.tianjiayonghu(zcemail, zcphone, zcpwd, zcname, zcage, zcsfz, zcxb);
        }
        [WebMethod]
        public static string zhuceButton_Click(string regname, string regsfz, string regphone, string regemail, string regpwd, string regpwd2, string regcode)
        {
            // 获取年龄和性别
            GetAgeAndGender(regsfz, out int zcage, out string zcxb);

            // 调用业务逻辑层方法添加用户
            personalBLL.tianjiayonghu(regemail, regphone, regpwd2, regname, zcage, regsfz, zcxb);

            return "注册成功";
        }
        public static void GetAgeAndGender(string idNumber, out int age, out string gender)
        {
            // 获取出生日期
            string birthDateString = idNumber.Substring(6, 8);
            if (!DateTime.TryParseExact(birthDateString, "yyyyMMdd", null, System.Globalization.DateTimeStyles.None, out DateTime birthDate))
            {
                // 页面弹框提示
                HttpContext.Current.Response.Write("<script>alert('身份证格式不对');</script>");
                age = 0;
                gender = string.Empty;
                return;
            }
            // 计算年龄
            age = DateTime.Now.Year - birthDate.Year;
            if (DateTime.Now.DayOfYear < birthDate.DayOfYear)
            {
                age--;
            }

            // 获取性别
            int genderNumber = int.Parse(idNumber.Substring(16, 1));
            gender = (genderNumber % 2 == 0) ? "女" : "男";
        }


        [WebMethod]
        public static string Login(string email, string code, string zh, string mm, string loginMethod)
        {
            if (loginMethod == "qq-email")
            {

                // QQ邮箱验证码登录逻辑
                if (personalBLL.emaillogin(email).Rows.Count >= 1)
                {
                    // 验证码正确，执行登录逻辑
                    HttpContext.Current.Session["id"] = personalBLL.emaillogin(email).Rows[0][0].ToString();
                    // personalBLL.emaillogin(email).Rows[0][0].ToString()
                    return "success";
                }
                else
                {
                    // 验证码错误，返回错误消息
                    return "error";
                }
            }
            else if (personalBLL.zhlogin(zh, mm).Rows.Count >= 1)
            {
                // 手机号和密码登录逻辑
                HttpContext.Current.Session["id"] = personalBLL.zhlogin(zh, mm).Rows[0][0].ToString();
                //personalBLL.zhlogin(zh, mm).Rows[0][0].ToString()
                return "success";
            }
            else
            {
                return "error";
            }
        }


    }
}