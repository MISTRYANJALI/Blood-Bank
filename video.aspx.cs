using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_video : System.Web.UI.Page
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
            rptvideo.DataSource = c1.getTable("select * from video");
            rptvideo.DataBind();
        }

        protected void rptvideo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "delete")
            {
                string query = "delete from video where videoid='" + id + "'";
                if (c1.saverecord(query))
                {
                    repeatdata();
                }
            }

            if (e.CommandName == "update")
            {
                Session["videoid"] = id;
                Session["trans"] = "update";
                lbltitle.Text = "Record Update";
                string query = "select * from video where videoid='" + id + "'";
                DataRow rw = c1.getrow(query);
                showdata(rw);
                pnlshow.Visible = false;
                pnlform.Visible = true;
            }

        }


        private void showdata(DataRow rw)
        {
            
            txtvideoname.Text = rw["videoname"].ToString();
            txtfilename.Text = rw["filename"].ToString();
            txtvideotype.Text = rw["videotype"].ToString();
            txtvideosize.Text = rw["videosize"].ToString();
            txtpurpose.Text = rw["purpose"].ToString();
             }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            
            string query = "";
            if (Session["trans"] == "update")
            {
                int id = Convert.ToInt32(Session["videoid"]);
                query = "update video set videoname='" + txtvideoname.Text + "',filename='" + txtfilename.Text + "',videotype='" + txtvideotype.Text + "',videosize='" + txtvideosize.Text + "',purpose='" + txtpurpose.Text + "' where videoid='" + id + "'";
            }

            if (Session["trans"] == "new")
            {
                query = "insert into video(videoname,filename,videotype,videosize,purpose) values('" + txtvideoname.Text + "','" + txtfilename.Text + "','" + txtvideotype.Text + "','" + txtvideosize.Text + "','" + txtpurpose.Text + "')";
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
            txtvideoname.Focus();
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            Session["trans"] = "";
            Session["videoid"] = "";
            lbltitle.Text = "";
            pnlform.Visible = false;
            pnlshow.Visible = true;
            clearall();
        }

        private void clearall()
        {
           
            txtvideoname.Text = "";
            txtfilename.Text = "";
            txtvideotype.Text = "";
            txtvideosize.Text = "";
            txtpurpose.Text = "";
           
        }

    


}