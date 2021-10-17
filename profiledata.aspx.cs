using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class receiver_profiledata : System.Web.UI.Page
{
    Class1 dc = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int regid = Convert.ToInt32(Session["regid"]);
            DataRow rw = dc.getrow("select recname,address,cityid,pincode,contactno,gender,emailid,convert(varchar(10),birthdate,103) as birthdate,bloodgrpid,height,weight,photo from profile where regid='" + regid + "'");
            showdata(rw);
        }
    }

    private void showdata(DataRow rw)
    {
       
        lblname.Text = rw["recname"].ToString();
        lbladd.Text = rw["address"].ToString();
        lblcity.Text = rw["cityid"].ToString();
        lblpin.Text = rw["pincode"].ToString();
        lblcon.Text = rw["contactno"].ToString();
        lblgender.Text = rw["gender"].ToString();
        lblemail.Text = rw["emailid"].ToString();
        lblbir.Text = rw["birthdate"].ToString();
        lblbldgrp.Text = rw["bloodgrpid"].ToString();
        lblheight.Text = rw["height"].ToString();
        lblweight.Text = rw["weight"].ToString();
        imguser.ImageUrl = "../photos/" + rw["photo"].ToString();
    }
    protected void update_Click(object sender, EventArgs e)
    {
        Response.Redirect("receiverprofile.aspx");

    }
}