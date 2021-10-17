using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_blooddonor : System.Web.UI.Page
{
    

        Class1 c1 = new Class1();
        DataRow rw ;

        public int qty;
        public int tqty;
        public string unit = "";
        public string bloodgrp = ""; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repeatdata();
                ddbldgrpid.DataSource = c1.getTable("select bloodgrpid,bloodgrpname from city,bloodgroup ");
                ddbldgrpid.DataMember = "bloodgroup";
                ddbldgrpid.DataTextField = "bloodgrpname";
                ddbldgrpid.DataValueField = "bloodgrpid";
                ddbldgrpid.DataBind();


            }
        }

        private void repeatdata()
        {
            rptblooddonor.DataSource = c1.getTable("select * from vwbdonor");
            rptblooddonor.DataBind();
        }

        protected void rptblooddonor_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "delete")
            {
                string query = "delete from blooddonor where bdonorid='" + id + "'";
                if (c1.saverecord(query))
                {
                    repeatdata();
                }
            }

            if (e.CommandName == "update")
            {
                Session["bdonorid"] = id;
                Session["trans"] = "update";
                lbltitle.Text = "Record Update";
                string query = "select * from blooddonor where bdonorid='" + id + "'";
                DataRow rw = c1.getrow(query);
                showdata(rw);
                pnlshow.Visible = false;
                pnlform.Visible = true;
            }

        }


        private void showdata(DataRow rw)
        {

            ddbldgrpid.SelectedValue = rw["bloodgrpid"].ToString();
            txtqty.Text = rw["qty"].ToString();
            txtunit.Text = rw["unit"].ToString();
            txthim.Text = rw["himoglobin"].ToString();
            txtprs.Text = rw["pressure"].ToString();
            txtweight.Text = rw["weight"].ToString();
            txtcolor.Text = rw["color"].ToString();
            txtlastdonate.Text = rw["lastdonate"].ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string query = "";
            string donatedate = DateTime.Today.ToString("MM/dd/yyyy");
            if (Session["trans"] == "update")
            {
                int id = Convert.ToInt32(Session["bdonorid"]);
                query = "update blooddonor set bloodgrpid='" + ddbldgrpid.SelectedValue + "',qty='" + txtqty.Text + "',unit='" + txtunit.Text + "',himoglobin='" + txthim.Text + "',pressure='" + txtprs.Text + "',weight='" + txtweight.Text + "',color='" + txtcolor.Text + "',lastdonate='" + txtlastdonate.Text + "'  where bdonorid='" + id + "'";
            
                
            }

            if (Session["trans"] == "new")
            {
                query = "insert into blooddonor(bdonordate,bloodgrpid,qty,unit,himoglobin,pressure,weight,color,lastdonate) values('" +donatedate+"','" + ddbldgrpid.SelectedValue + "','" + txtqty.Text + "','" + txtunit.Text + "','" + txthim.Text + "','" + txtprs.Text + "','" + txtweight.Text + "','" + txtcolor.Text + "','" + txtlastdonate.Text + "' )";
                
            }

            if (c1.saverecord(query))
            {
                repeatdata();
                pnlform.Visible = false;
                pnlshow.Visible = true;
                blood();
                clearall();
            }
        }
        protected void btnnew_Click(object sender, EventArgs e)
        {
            Session["trans"] = "new";
            pnlshow.Visible = false;
            pnlform.Visible = true;
            lbltitle.Text = "Record Insert";
            ddbldgrpid.Focus();
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            Session["trans"] = "";
            Session["bdonorid"] = "";
            lbltitle.Text = "";
            pnlform.Visible = false;
            pnlshow.Visible = true;
            clearall();
        }

        private void clearall()
        {
            ddbldgrpid.ClearSelection();
            txtqty.Text = "";
            txtunit.Text = "";
            txthim.Text = "";
            txtprs.Text = "";
            txtweight.Text = "";
            txtcolor.Text = "";
            txtlastdonate.Text = "";
        }

        protected void blood()
        {
            qty = Convert.ToInt32(txtqty.Text);
            unit = txtunit.Text;
            bloodgrp=ddbldgrpid.SelectedItem.Text;
            rw = c1.getrow("select qty,unit from blood where bloodgroup='" +bloodgrp + "'");
            tqty =Convert.ToInt32(rw["qty"]);

            qty = qty + tqty;
            string query="update blood set qty='" + qty + "',unit='" + unit + "' where bloodgroup='" + bloodgrp + "'";
            c1.saverecord(query);     
            
        }
}