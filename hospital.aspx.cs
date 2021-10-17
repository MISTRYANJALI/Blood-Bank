using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_hospital : System.Web.UI.Page
{

    Class1 dc = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            repeatdata();
            ddcityname.DataSource = dc.getTable("select cityid,cityname from city");
            ddcityname.DataMember = "city";
            ddcityname.DataTextField = "cityname";
            ddcityname.DataValueField = "cityid";
            ddcityname.DataBind();
        }
    }

    private void repeatdata()
    {
        rpthospital.DataSource = dc.getTable("select * from vwhosptcity");
        rpthospital.DataBind();
    }

    protected void rpthospital_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "delete")
        {
            string query = "delete from hospital where hospitalid='" + id + "'";
            if (dc.saverecord(query))
            {
                repeatdata();
            }
        }

        if (e.CommandName == "update")
        {
            Session["hospitalid"] = id;
            Session["trans"] = "update";
            lbltitle.Text = "Record Update";
            string query = "select * from hospital where hospitalid='" + id + "'";
            DataRow rw = dc.getrow(query);
            showdata(rw);
            pnlshow.Visible = false;
            pnlform.Visible = true;
        }

    }


    private void showdata(DataRow rw)
    {
       
        txthosname.Text = rw["hospitalname"].ToString();
        txthosadd.Text = rw["address"].ToString();
        ddcityname.SelectedValue = rw["cityname"].ToString();
        txtconno.Text = rw["contactno"].ToString();
        txtemail.Text = rw["email"].ToString();
        txthostype.Text = rw["hospitaltype"].ToString();
        txthostru.Text = rw["trust"].ToString();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string query = "";
        if (Session["trans"] == "update")
        {
            int id = Convert.ToInt32(Session["hospitalid"]);
            query = "update hospital set hospitalname='" + txthosname.Text + "',address='" + txthosadd.Text + "',cityid='" +ddcityname.SelectedValue + "',contactno='" + txtconno.Text + "',email='" + txtemail.Text + "',hospitaltype='" + txthostype.Text + "',trust='" + txthostru.Text + "'  where hospitalid='" + id + "'";
        }

        if (Session["trans"] == "new")
        {
            query = "insert into hospital(hospitalname,address,cityid,contactno,email,hospitaltype,trust) values('" + txthosname.Text + "','" + txthosadd.Text + "','" + ddcityname.SelectedValue + "','" + txtconno.Text + "','" + txtemail.Text + "','" + txthostype.Text + "','" + txthostru.Text + "' )";
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
        txthosname.Focus();
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Session["trans"] = "";
        Session["hospitalid"] = "";
        lbltitle.Text = "";
        pnlform.Visible = false;
        pnlshow.Visible = true;
        clearall();
    }

    private void clearall()
    {
       
        txthosname.Text = "";
        txthosadd.Text = "";
        ddcityname.ClearSelection();
        txtconno.Text = "";
        txtemail.Text = "";
        txthostype.Text = "";
        txthostru.Text = "";
    }
}