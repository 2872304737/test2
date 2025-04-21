using DAL;
using DAL.glyDAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace gly
{
	public partial class yishengPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                DataTable dt1 = YiShengBLL.yijikeshiquanbu();
                this.addmentkeshi.DataSource = dt1;
                this.addmentkeshi.DataTextField = "Name";
                this.addmentkeshi.DataValueField = "TypeID";
                this.addmentkeshi.DataBind();
                this.addmentkeshi.Items.Insert(0, new ListItem("请选择科室", "0"));
                this.addmentkeshi.SelectedIndex = 0;
                this.submitkeshi.Items.Insert(0, new ListItem("请选择二级科室", "0"));
                this.submitkeshi.SelectedIndex = 0;
            }
        }

        
        //添加
        protected void ysjjclic(object sender, EventArgs e)
        {
            //姓名
            string doctorName = this.adddoctorname.Value;
            //科室
            string department = this.addmentkeshi.SelectedValue ;
            //子科室
            string subDepartment = this.submitkeshi.SelectedValue;
            //医生头像
            string tx =this.adddoctorimage.Value;
            //医生简介
            string jiejian = this.adddoctorjianjie.Value;
            //医生职位
            string position = this.addposition.Value;


            if (department == "0" || subDepartment == "0")
            {
                Response.Write("<script>alert('请选择科室')</script>");
                return;
            }
            else if (doctorName == "" || tx == "" || jiejian == "" || position == "") {
                Response.Write("<script>alert('布准空着')</script>");
                return;
            }
            else
            {
                YiShengBLL.ysAdd(doctorName, tx, department, department, subDepartment, jiejian, position);
            }
               

        }
        //删除
        [WebMethod]
        public static string DeleteAn(int noticeId) {
            int x = noticeId;
            if (YiShengBLL.ysDel(x))
            {
                return "删除成功";
            }
            else
            {
                return "删除失败";
            }
        }

        //编辑
        protected void bjys(object sender, EventArgs e)
        {
            
            //姓名
            string name = this.editdoctorname.Value;
            string selectedPosition = DropDownList1.SelectedValue;
            int x = Convert.ToInt32(this.cangysid.Value);
            //头像
            string tx = this.editimage.Value;
            //简介
            string jj = this.eie.Value;
            YiShengBLL.ysUpdate(name, tx, selectedPosition, jj, x);
        }

        protected void addmentkeshi_TextChanged(object sender, EventArgs e)
        {
            if (this.addmentkeshi.SelectedIndex!=0)
            {
                DataTable dt = YiShengBLL.erjikeshiquanbu(int.Parse(this.addmentkeshi.SelectedValue));
                this.submitkeshi.DataSource = dt;
                this.submitkeshi.DataTextField = "Name";
                this.submitkeshi.DataValueField = "TypeID";
                this.submitkeshi.DataBind();
                this.submitkeshi.Items.Insert(0, new ListItem("请选择二级科室", "0"));
                this.submitkeshi.SelectedIndex = 0;

            }
        }
    }
}