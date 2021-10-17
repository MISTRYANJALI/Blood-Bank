using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_bloodgroup : System.Web.UI.Page
{
   
        Class1 c1 = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repeatdata();
            }
        }

        private void repeatdata()
        {
            rptbloodgrp.DataSource = c1.getTable("select * from bloodgroup");
            rptbloodgrp.DataBind();
        }

        protected void rptbloodgrp_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "delete")
            {
                string query = "delete from bloodgroup where bloodgrpid='" + id + "'";
                if (c1.saverecord(query))
                {
                    repeatdata();
                }
            }

            if (e.CommandName == "update")
            {
                Session["bloodgrpid"] = id;
                Session["trans"] = "update";
                lbltitle.Text = "Record Update";
                string query = "select * from bloodgroup where bloodgrpid='" + id + "'";
                DataRow rw = c1.getrow(query);
                showdata(rw);
                pnlshow.Visible = false;
                pnlform.Visible = true;
            }

        }


        private void showdata(DataRow rw)
        {
           
            txtbldgrpname.Text = rw["bloodgrpname"].ToString();
            txtshortname.Text = rw["shortname"].ToString();
            txtusegroup.Text = rw["usegroup"].ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string msgdate = DateTime.Today.ToString("MM/dd/yyyy");

            string query = "";
            if (Session["trans"] == "update")
            {
                int id = Convert.ToInt32(Session["bloodgrpid"]);
                query = "update bloodgroup set bloodgrpname='" + txtbldgrpname.Text + "',shortname='" + txtshortname.Text + "',usegroup='" + txtusegroup.Text + "'  where bloodgrpid='" + id + "'";
            }

            if (Session["trans"] == "new")
            {
                query = "insert into bloodgroup(bloodgrpname,shortname,usegroup) values('" + txtbldgrpname.Text + "','" + txtshortname.Text + "','" + txtusegroup.Text + "')";
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
            txtbldgrpname.Focus();
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            Session["trans"] = "";
            Session["bloodgrpid"] = "";
            lbltitle.Text = "";
            pnlform.Visible = false;
            pnlshow.Visible = true;
            clearall();
        }

        private void clearall()
        {
          
            txtbldgrpname.Text = "";
            txtshortname.Text = "";
            txtusegroup.Text = "";
        }



    }
