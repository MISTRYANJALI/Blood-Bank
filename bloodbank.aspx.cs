using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_bloodbank : System.Web.UI.Page
{

    Class1 dc = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repeatdata();
                ddcityname.DataSource=dc.getTable("select cityid,cityname from city");
                ddcityname.DataMember = "city";
                ddcityname.DataTextField = "cityname";
                ddcityname.DataValueField = "cityid";
                ddcityname.DataBind();

            }
        }

        private void repeatdata()
        {
            rptbloodbank.DataSource = dc.getTable("select * from vwbldbank");
            rptbloodbank.DataBind();
        }

        protected void rptbloodbank_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "delete")
            {
                string query = "delete from bloodbank where bankid='" + id + "'";
                if (dc.saverecord(query))
                {
                    repeatdata();
                }
            }

            if (e.CommandName == "update")
            {
                Session["bankid"] = id;
                Session["trans"] = "update";
                lbltitle.Text = "Record Update";
                string query = "select * from bloodbank where bankid='" + id + "'";
                DataRow rw = dc.getrow(query);
                showdata(rw);
                pnlshow.Visible = false;
                pnlform.Visible = true;
            }

        }


        private void showdata(DataRow rw)
        {
           
            txtbnkname.Text = rw["bankname"].ToString();
            txtbnkadd.Text = rw["address"].ToString();
            ddcityname.SelectedValue = rw["cityid"].ToString();
            txtconno.Text = rw["contactno"].ToString();
            txtemail.Text = rw["email"].ToString();
            txthead.Text = rw["head"].ToString();
            txtbnktype.Text = rw["banktype"].ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string query = "";
            if (Session["trans"] == "update")
            {
                int id = Convert.ToInt32(Session["bankid"]);
                query = "update bloodbank set bankname='" + txtbnkname.Text + "',address='" + txtbnkadd.Text + "',cityname='" + ddcityname.SelectedValue + "',contactno='" + txtconno.Text + "',email='" + txtemail.Text + "',head='" + txthead.Text + "',banktype='" + txtbnktype.Text + "'  where bankid='" + id + "'";
            }

            if (Session["trans"] == "new")
            {
                query = "insert into bloodbank(bankname,address,cityid,contactno,email,head,banktype) values('" + txtbnkname.Text + "','" + txtbnkadd.Text + "','" + ddcityname.SelectedValue + "','" + txtconno.Text + "','" + txtemail.Text + "','" + txthead.Text + "','" + txtbnktype.Text + "' )";
            }

            if (dc.saverecord(query))
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
            txtbnkname.Focus();
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            Session["trans"] = "";
            Session["bankid"] = "";
            lbltitle.Text = "";
            pnlform.Visible = false;
            pnlshow.Visible = true;
            clearall();
        }

        private void clearall()
        {
         
            txtbnkname.Text = "";
            txtbnkadd.Text = "";
            ddcityname.ClearSelection();
            txtconno.Text = "";
            txtemail.Text = "";
            txthead.Text = "";
            txtbnktype.Text = "";
        }
 }
