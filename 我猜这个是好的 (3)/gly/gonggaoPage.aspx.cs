using DAL.glyDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gly
{
	public partial class gonggaoPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            string dateString = now.ToString("yyyy-MM-dd");
            string title = this.anmentTit.Value;
			string txt = this.anmentCon.Value;
            goongGaoBLL.gongGaoAdd(title,txt, dateString);

            Response.Write("<script>alert('添加成功');</script>");
        }

        protected void repeaterNotices_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        //protected void EditButton_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    string noticeId = btn.CommandArgument;
        //    // 在这里处理编辑逻辑
        //    // 例如，跳转到编辑页面或显示编辑模态框
        //}

        //protected void DeleteButton_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    string noticeId = btn.CommandArgument;
        //    // 在这里处理删除逻辑
        //}
    }
}