using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data;
using System.Data.SqlClient;

public partial class user_donormaster : System.Web.UI.MasterPage
{
    Class1 c1 = new Class1();
    DataTable dt;
    DataRow rw;
    string query = "";
    public string Date="";
    public string bldgrp = "";
    public string qty = "";
    public string ldate = "";


    public string lbldonate = "";
    public string lblbldgrp = "";
    public string lblqut = "";
    public string lblldonate = "";


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int regid = Convert.ToInt32(Session["regid"]);
            rw = c1.getrow("select * from donor where regid='" + regid + "'");
            Imguser.ImageUrl = "~/photos/userlogo.png";
            string img = rw["photo"].ToString();
            if (img == "")
            {
                Imguser.ImageUrl = "~/photos/userlogo.png";
            }
            else
            {
                Imguser.ImageUrl = "../photos/" + rw["photo"].ToString();
            }
            show();
            
        }
  
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session["regid"] = "";
        Session["username"] = "";
        Response.Redirect("../main/mainhome.aspx");
    }
    protected void lnkbtndonate_Click(object sender, EventArgs e)
    {
        Response.Redirect("donaterequest.aspx");
    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string hr = hfstar.Value;

        int regid = Convert.ToInt32(Session["regid"]);
        string regdate = DateTime.Today.ToString("MM/dd/yyyy");
        string query = "insert into feedback(fdbackdate,feedback,star,regid,emailid)values('" + regdate + "','" + txtmsg.Text + "','" + hr + "','" + regid + "','" + txtemail.Text + "')";

        if (c1.saverecord(query))
        {
            clearall();
        }

    }

    private void clearall()
    {

        txtmsg.Text = "";
        txtemail.Text = "";
    }

    public void show()
    {
        int id = Convert.ToInt32(Session["regid"]);
        dt=c1.getTable("select bloodgrpname,qty,unit,convert(varchar(10),bdonordate,103) as bdonordate from vwbdonor where regid='" + id + "' order by bdonorid desc");
        if (dt.Rows.Count != 0)
        {

            lblgrp.Text = dt.Rows[0]["bloodgrpname"].ToString();
            lblqty.Text = dt.Rows[0]["qty"].ToString();
            lblunit.Text = dt.Rows[0]["unit"].ToString();
            lbllast.Text = dt.Rows[1]["bdonordate"].ToString();
        }
      

    }

    protected void btnmore_Click(object sender, EventArgs e)
    {
        Response.Redirect("history.aspx");
    }

}