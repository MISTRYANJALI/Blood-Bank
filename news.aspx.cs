using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_news : System.Web.UI.Page
{
    Class1 dc = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            repeatdata();
        }
    }

    private void repeatdata()
    {
        rptnews.DataSource = dc.getTable("select * from news");
        rptnews.DataBind();
    }

    protected void rptnews_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "delete")
        {
            string query = "delete from news where newsid='" + id + "'";
            if (dc.saverecord(query))
            {
                repeatdata();
            }
        }

        if (e.CommandName == "update")
        {
            Session["newsid"] = id;
            Session["trans"] = "update";
            lbltitle.Text = "Record Update";
            string query = "select * from news where newsid='" + id + "'";
            DataRow rw = dc.getrow(query);
            showdata(rw);
            pnlshow.Visible = false;
            pnlform.Visible = true;
        }

    }


    private void showdata(DataRow rw)
    {
       
       
        txtnewshdn.Text = rw["newshdn"].ToString();
        txtnews.Text = rw["news"].ToString();
        txtnewsby.Text = rw["newsby"].ToString();
        txtnewsfor.Text = rw["newsfor"].ToString();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string newsdate = DateTime.Today.ToString("MM/dd/yyyy");
        string query = "";
        if (Session["trans"] == "update")
        {
            int id = Convert.ToInt32(Session["newsid"]);
            query = "update news set newsdate='" + newsdate + "',newshdn='" + txtnewshdn.Text + "',news='" + txtnews.Text + "',newsby='" + txtnewsby.Text + "',newsfor='" + txtnewsfor.Text + "' where newsid='" + id + "'";
        }

        if (Session["trans"] == "new")
        {
            query = "insert into news(newsdate,newshdn,news,newsby,newsfor) values('" + newsdate + "','" + txtnewshdn.Text + "','" + txtnews.Text + "','" + txtnewsby.Text + "','" + txtnewsfor.Text + "' )";
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
        txtnewshdn.Focus();
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Session["trans"] = "";
        Session["newsid"] = "";
        lbltitle.Text = "";
        pnlform.Visible = false;
        pnlshow.Visible = true;
        clearall();
    }

    private void clearall()
    {
        
       
        txtnewshdn.Text = "";
        txtnews.Text = "";
        txtnewsby.Text = "";
        txtnewsfor.Text = "";
    }

}