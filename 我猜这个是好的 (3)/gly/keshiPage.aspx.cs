using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;
using System.Web.UI.HtmlControls;
using System.Web.Services.Description;
using System.Web.Services;
using BLL.glyBLL;


namespace gly
{
    public partial class keshiPage : System.Web.UI.Page
    {
        [WebMethod]
        public static bool UpdateSubDepartment(string jiukeshi,string xinkeshi)
        {
            if (xinkeshi.Trim()!="")
            {
                BLL.glyBLL.KeShiBLL.ksShiXiu(xinkeshi, jiukeshi);
                return true;
            }
            else
            {
                return false;
            }
            
            // 在这里处理更新二级科室的逻辑
        }
        [WebMethod]
        public static bool DeleteSubDepartment(string jiukeshi)
        {

            if (BLL.glyBLL.KeShiBLL.ksShiShan(jiukeshi))
            {
                return true;
            }
            else
            {
                return false;
            }
            // 在这里处理更新二级科室的逻辑
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                if (scriptManager == null)
                {
                    scriptManager = new ScriptManager();
                    this.Page.Form.Controls.AddAt(0, scriptManager);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ks = this.ks.Value;
            if (string.IsNullOrWhiteSpace(ks))
            {
                string script = "<script>alert('值不能为空');</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                return;
            }

            if (BLL.glyBLL.KeShiBLL.kemz(ks).Rows.Count <= 0)
            {
                BLL.glyBLL.KeShiBLL.ksShiTian(ks);
            }
            else
            {
                string script = "<script>alert('重复');</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }

        [WebMethod]
        protected void kes_Click(object sender, EventArgs e)
        {
            string departmentName = hiddenDepartmentName.Value; // 读取隐藏字段的值
            if (string.IsNullOrWhiteSpace(departmentName))
            {
                Response.Write("<script>alert('不能删除空白');</script>");
                return;
            }
            else
            {
                if (BLL.glyBLL.KeShiBLL.ksShiShan(departmentName))
                {
                    Response.Write("<script>alert('删除成功');</script>");
                }
                else
                {
                    Response.Write("<script>alert('删除失败');</script>");
                }


            }
        }

        protected void fukeis_Click(object sender, EventArgs e)
        {
            if (this.subame.Value != null&& BLL.glyBLL.KeShiBLL.kemz(this.subame.Value).Rows.Count <= 0)
            {
                bool result = KeShiBLL.fksAdd(this.subame.Value, this.currename.Value);
                if (result)
                {
                    Response.Write("<script>alert('添加成功');</script>");
                }
                else
                {
                    Response.Write("<script>alert('添加失败');</script>");
                }
            }
           
        }

        protected void savekeshiname_Click(object sender, EventArgs e)
        {
            if (this.ediname.Value != null)
            {
                if (KeShiBLL.ksShiXiu(this.ediname.Value,this.hiddenbianjiName.Value))
                {
                    Response.Write("<script>alert('修改成功');</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败');</script>");
                }

            }
        }
    }
}
