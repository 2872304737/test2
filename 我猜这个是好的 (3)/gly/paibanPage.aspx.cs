using DAL.glyDAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gly
{
    public class Doctor
    {
        public int DocID { get; set; }
        public string Name { get; set; }
    }
    public partial class paibanPage : System.Web.UI.Page
    {
        [WebMethod]
        public static List<Doctor> GetDoctorsByDepartment(int ksid )
        {
            DataTable dt = PaiPanBLL.keshiyisheng(ksid);
            List<Doctor> doctors = new List<Doctor>();
            foreach (DataRow row in dt.Rows)
            {
                doctors.Add(new Doctor
                {
                    DocID = Convert.ToInt32(row["DocID"]),
                    Name = row["Name"].ToString()
                });
            }
            return doctors;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //给号源管理模态框的日期下拉框绑定数据
                DataTable dates = PaiPanBLL.riqichaxun();
                var formattedDates = dates.AsEnumerable().Select(date => new
                {
                    Data = Convert.ToDateTime(date["Data"]).ToString("yyyy-MM-dd")
                }).ToList();

                this.DropDownList1.DataSource = formattedDates;

                this.DropDownList1.DataTextField = "Data";
                this.DropDownList1.DataValueField = "Data";
                this.DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("请选择", "0"));
                DropDownList2.Items.Insert(0, new ListItem("请选择", "0"));
                this.DropDownList1.SelectedIndex = 0;
                this.DropDownList2.SelectedIndex = 0;

                //给添加排班模态框的日期下拉框绑定数据
                DataTable yijikeshi = PaiPanBLL.yijikeshiquanbu();
                this.xinzengDropDownList1.DataSource = yijikeshi;
                this.xinzengDropDownList1.DataTextField = "Name";
                this.xinzengDropDownList1.DataValueField = "TypeID";
                this.xinzengDropDownList1.DataBind();
                xinzengDropDownList1.Items.Insert(0, new ListItem("请选择", "0"));
                xinzengDropDownList2.Items.Insert(0, new ListItem("请选择", "0"));
                xinzengDropDownList3.Items.Insert(0, new ListItem("请选择", "0"));
                xinzengDropDownList4.Items.Insert(0, new ListItem("请选择", "0"));

                this.xinzengDropDownList1.SelectedIndex = 0;
                this.xinzengDropDownList2.SelectedIndex = 0;
                this.xinzengDropDownList3.SelectedIndex = 0;
                this.xinzengDropDownList4.SelectedIndex = 0;
            }

        }






        protected void DropDownList1_TextChanged1(object sender, EventArgs e)
        {

            if (this.DropDownList1.SelectedIndex != 0)
            {
                this.DropDownList2.Enabled = true;
                DataTable times = PaiPanBLL.riqichashijian(this.DropDownList1.SelectedValue);
                //var formattedTimes = times.AsEnumerable().Select(time => new
                //{
                //    时间段 = time["时间段"]
                //}).ToList();
                this.DropDownList2.DataSource = times;
                this.DropDownList2.DataTextField = "时间段";
                this.DropDownList2.DataValueField = "RosterID";
                this.DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("请选择", "0"));

            }
            else
            {
                this.DropDownList2.Enabled = false;
                this.DropDownList2.SelectedIndex = 0;

            }
            this.haoyuantextbox.Enabled = false;
            this.haoyuantextbox.Text = null;
        }

        protected void DropDownList2_TextChanged(object sender, EventArgs e)
        {
            if (this.DropDownList2.SelectedIndex != 0)
            {
                this.haoyuantextbox.Enabled = true;
                this.haoyuantextbox.Text = PaiPanBLL.shijianchahaoyuan(Convert.ToInt32(this.DropDownList2.SelectedValue));


            }
            else
            {
                this.haoyuantextbox.Enabled = false;
                this.haoyuantextbox.Text = null;
            }
        }

        protected void haoyuanquerenButton_Click(object sender, EventArgs e)
        {
            int rid = Convert.ToInt32(this.DropDownList2.SelectedValue);



            string input = this.haoyuantextbox.Text;


            if (string.IsNullOrEmpty(input))
            {
                Response.Write("<script>alert('号源数不能为空！')</script>");
            }
            else if (!int.TryParse(input, out int haoyuan) || haoyuan <= 0)
            {
                Response.Write("<script>alert('号源数必须是大于0的整数！')</script>");
            }
            else
            {
                haoyuan = Convert.ToInt32(this.haoyuantextbox.Text);
                if (PaiPanBLL.idgaihaoyuan(rid, haoyuan))
                {
                    Response.Write("<script>alert('修改成功！')</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败！')</script>");
                }
            }


        }

        //新增按钮提交
        protected void xinzengpaibanButton_Click(object sender, EventArgs e)
        {
            int ysid = Convert.ToInt32(this.xinzengDropDownList4.SelectedValue);
            string data = this.selectedDate.Value;
            string shijian = this.time.Value;
            string input = this.limit.Text;

            int pd1 = 0;
            int pd2 = 0;
            int pd3 = 0;

            string shijian1 = null;
            string shijian2 = null;

            if (shijian == "08-10")
            {
                 shijian1 = data + " 08:00:00";
                 shijian2 = data + " 10:00:00";
                pd1 = 1;
            }
            else if (shijian == "10-12")
            {
                 shijian1 = data + " 10:00:00";
                 shijian2 = data + " 12:00:00";
                pd1 = 1;
            }
            else if (shijian == "13-15")
            {
                 shijian1 = data + " 13:00:00";
                 shijian2 = data + " 15:00:00";
                pd1 = 1;
            }
            else if (shijian == "15-17")
            {
                 shijian1 = data + " 15:00:00";
                 shijian2 = data + " 17:00:00";
                pd1 = 1;
            }
            else
            {

                Response.Write("<script>alert('信息不完整！')</script>");
                pd1 = 0;
            }

            if (ysid < 1)
            {
                Response.Write("<script>alert('信息不完整！')</script>");
                pd2 = 0;

            }
            else
            {
                pd2 = 1;
            }
            int haoyuan=0;
            if (string.IsNullOrEmpty(input))
            {
                Response.Write("<script>alert('号源数不能为空！')</script>");
                pd3=0;
            }
            else if (!int.TryParse(input, out  haoyuan) || haoyuan <= 0)
            {
                Response.Write("<script>alert('号源数必须是大于0的整数！')</script>");
                pd3 = 0;
            }
            else
            {
                haoyuan = Convert.ToInt32(this.limit.Text);
                pd3 =1;
            }



            if (pd1 == 1 && pd2 == 1 && pd3 == 1)
            {
                //太长的添加
                //if (PaiPanBLL.tianjiapaiban(data, shijian1, shijian2, haoyuan, ysid))
                // {
                //     Response.Write("<script>alert('添加成功！')</script>");
                // }
                // else
                // {
                //     Response.Write("<script>alert('添加失败！')</script>");
                // }

                int rid = 0;
                //尝试简化
                DataTable dt1 = PaiPanBLL.tianjiabuzou1(data, shijian1, shijian2);
                if (dt1.Rows.Count == 1) { 
                     rid = Convert.ToInt32(dt1.Rows[0]["RosterID"]);
                    haoyuan= Convert.ToInt32(dt1.Rows[0]["Maxnumber"]);
                }
                else
                {
                    DataTable dt2 = PaiPanBLL.tianjiabuzou2(data, shijian1, shijian2,haoyuan);
                     rid = Convert.ToInt32(dt2.Rows[0]["RosterID"]);
                }
                if (rid>0)
                {
                    DataTable dt3 = PaiPanBLL.tianjiabuzou3(rid,ysid);
                    if (dt3.Rows.Count !=1)
                    {
                        if (PaiPanBLL.tianjiabuzou4(rid, ysid))
                        {
                            Response.Write("<script>alert('添加成功！')</script>");
                        }
                        else
                        {

                            Response.Write("<script>alert('添加失败！')</script>");
                        }
                        
                       
                    }
                   
                }
            }
        }
        protected void xinzengDropDownList1_TextChanged(object sender, EventArgs e)
        {
            if (this.xinzengDropDownList1.SelectedIndex != 0)
            {
                this.xinzengDropDownList2.Enabled = true;
                DataTable erjikeshi = PaiPanBLL.erjikeshiquanbu(Convert.ToInt32(this.xinzengDropDownList1.SelectedValue));
                this.xinzengDropDownList2.DataSource = erjikeshi;
                this.xinzengDropDownList2.DataTextField = "Name";
                this.xinzengDropDownList2.DataValueField = "TypeID";
                this.xinzengDropDownList2.DataBind();
                xinzengDropDownList2.Items.Insert(0, new ListItem("请选择", "0"));
                this.xinzengDropDownList2.SelectedIndex = 0;

            }
            else
            {
                this.xinzengDropDownList2.Enabled = false;
                this.xinzengDropDownList2.Text = null;
            }
            this.xinzengDropDownList3.Enabled = false;
            this.xinzengDropDownList4.Enabled = false;
            this.xinzengDropDownList3.Text = null;
            this.xinzengDropDownList4.Text = null;
        }

        protected void xinzengDropDownList2_TextChanged(object sender, EventArgs e)
        {
            if (this.xinzengDropDownList2.SelectedIndex != 0)
            {
                this.xinzengDropDownList3.Enabled = true;
                DataTable yishengzhiwei = PaiPanBLL.yishengzhiwei();
                this.xinzengDropDownList3.DataSource = yishengzhiwei;
                this.xinzengDropDownList3.DataTextField = "Position";
                this.xinzengDropDownList3.DataValueField = "Position";
                this.xinzengDropDownList3.DataBind();
                xinzengDropDownList3.Items.Insert(0, new ListItem("请选择", "0"));
                this.xinzengDropDownList3.SelectedIndex = 0;
            }
            else
            {
                this.xinzengDropDownList3.Enabled = false;
                this.xinzengDropDownList3.Text = null;
            }
            this.xinzengDropDownList4.Enabled = false;
            this.xinzengDropDownList4.Text = null;
        }

        protected void xinzengDropDownList3_TextChanged(object sender, EventArgs e)
        {
            if (this.xinzengDropDownList3.SelectedIndex != 0)
            {
                this.xinzengDropDownList4.Enabled = true;
                DataTable yisheng = PaiPanBLL.yishengmingzi(this.xinzengDropDownList3.SelectedValue,
                    int.Parse(this.xinzengDropDownList2.SelectedValue));
                this.xinzengDropDownList4.DataSource = yisheng;
                this.xinzengDropDownList4.DataTextField = "Name";
                this.xinzengDropDownList4.DataValueField = "DocID";
                this.xinzengDropDownList4.DataBind();
                xinzengDropDownList4.Items.Insert(0, new ListItem("请选择", "0"));
                this.xinzengDropDownList4.SelectedIndex = 0;
            }
            else
            {
                this.xinzengDropDownList4.Enabled = false;
                this.xinzengDropDownList4.Text = null;
            }
        }

        protected void confirmEdit_Click(object sender, EventArgs e)
        {
            if (this.cangksid.Value!=null&&this.cangpbid.Value!=null&&this.cangnewysid.Value!=null)
            {
                if (PaiPanBLL.gaiyishengpaiban(int.Parse(this.cangnewysid.Value), int.Parse(this.cangpbid.Value)))
                {
                    Response.Write("<script>alert('修改成功！')</script>");
                }else
                {
                    Response.Write("<script>alert('修改失败！')</script>");
                }
               
            }
        }
    }
}