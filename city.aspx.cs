using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_city : System.Web.UI.Page
{

        Class1 c1 = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repeatdata();
                ddstatename.DataSource = c1.getTable("select stateid,statename from state ");
                ddstatename.DataMember = "state";
                ddstatename.DataTextField = "statename";
                ddstatename.DataValueField = "stateid";
                ddstatename.DataBind();

            }
        }

        private void repeatdata()
        {
            rptcity.DataSource = c1.getTable("select * from vwcity");
            rptcity.DataBind();
        }

        protected void rptcity_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "delete")
            {
                string query = "delete from city where cityid='" + id + "'";
                if (c1.saverecord(query))
                {
                    repeatdata();
                }
            }

            if (e.CommandName == "update")
            {
                Session["cityid"] = id;
                Session["trans"] = "update";
                lbltitle.Text = "Record Update";
                string query = "select * from city where cityid='" + id + "'";
                DataRow rw = c1.getrow(query);
                showdata(rw);
                pnlshow.Visible = false;
                pnlform.Visible = true;
            }

        }


        private void showdata(DataRow rw)
        {
            txtcityname.Text = rw["cityname"].ToString();
            txtshortname.Text = rw["shortname"].ToString();
            txtpincode.Text = rw["pincode"].ToString();
            ddstatename.SelectedValue = rw["stateid"].ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string msgdate = DateTime.Today.ToString("MM/dd/yyyy");

            string query = "";
            if (Session["trans"] == "update")
            {
                int id = Convert.ToInt32(Session["cityid"]);
                query = "update city set cityname='" + txtcityname.Text + "',shortname='" + txtshortname.Text + "',pincode='" + txtpincode.Text + "',stateid='"+ ddstatename.SelectedValue+"' where cityid='" + id + "'";
            }

            if (Session["trans"] == "new")
            {
                query = "insert into city(cityname,shortname,pincode,stateid) values('" + txtcityname.Text + "','" + txtshortname.Text + "','" + txtpincode.Text + "','" +ddstatename.SelectedValue +"')";
            }

            if (c1.saverecord(query))
            {
                repeatdata();
                pnlform.Visible = false;
                pnlshow.Visible = true;
                clearall();
            }
        }
        protected void btnnew_Click(object sender, EventArgs e)
        {
            Session["trans"] = "new";
            pnlshow.Visible = false;
            pnlform.Visible = true;
            lbltitle.Text = "Record Insert";
            txtcityname.Focus();
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            Session["trans"] = "";
            Session["cityid"] = "";
            lbltitle.Text = "";
            pnlform.Visible = false;
            pnlshow.Visible = true;
            clearall();
        }

        private void clearall()
        {
            txtcityname.Text = "";
            txtshortname.Text = "";
            txtpincode.Text = "";
            ddstatename.SelectedValue = "";
        }



    
}