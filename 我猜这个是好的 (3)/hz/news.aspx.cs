using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.hzDAL;

namespace hz
{
	public partial class news : System.Web.UI.Page
	{
      
        [WebMethod]
        public static string AfterAppointmentSuccess(string shijian,string keshi,string yisheng)
        {
            DataTable dt = newsBLL.idselectemail(int.Parse(HttpContext.Current.Session["id"].ToString()));
           string email = dt.Rows[0]["Email"].ToString();
            string phone = dt.Rows[0]["Phone"].ToString();

            string content = "似了一半的共于⺄提醒您：手机号:"+phone+"的用户。<br>您好，您已成功预约挂号，请于"+shijian+"，前往"+keshi+"寻找"+yisheng+"医生进行就诊。" ;
            SendEmail1(email, "绝命毒师预约提示", content);//收件人邮箱，邮箱标题，邮箱内容
           

            return "后端事件处理成功";
        }
        protected void Page_Load(object sender, EventArgs e)
		{

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


    }
}