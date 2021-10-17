using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_donoruser : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    public string query = "";
    public string campname = "";
    public string date = "";
    public string time = "";
    public string location = "";


    public string campname1 = "";
    public string date1 = "";
    public string time1 = "";
    public string location1 = "";

    public string campname2 = "";
    public string date2 = "";
    public string time2 = "";
    public string location2 = "";

    public string campname3 = "";
    public string date3 = "";
    public string time3 = "";
    public string location3 = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rptdata();
            show();
        }

    }
    private void rptdata()
    {
        Repimg.DataSource = c1.getTable("select img from img");
        Repimg.DataBind();
    }

    DataRow rw;

    public void show()
    {
        DataTable dt = c1.getTable("select top(3) campname,convert(varchar(10),campdate,103) as campdate,time,location from camp order by campid desc ");


        ltrlcampname1.Text = dt.Rows[0]["campname"].ToString();
        ltrldate1.Text = dt.Rows[0]["campdate"].ToString();
        ltrltime1.Text = dt.Rows[0]["time"].ToString();
        ltrllocation1.Text = dt.Rows[0]["location"].ToString();

        ltrcampname2.Text = dt.Rows[1]["campname"].ToString();
        ltrdate2.Text = dt.Rows[1]["campdate"].ToString();
        ltrtime2.Text = dt.Rows[1]["time"].ToString();
        ltrlocation2.Text = dt.Rows[1]["location"].ToString();

        ltrcampname3.Text = dt.Rows[2]["campname"].ToString();
        ltrdate3.Text = dt.Rows[2]["campdate"].ToString();
        ltrtime3.Text = dt.Rows[2]["time"].ToString();
        ltrlocation3.Text = dt.Rows[2]["location"].ToString();


    }

    protected void Btnfood_Click(object sender, EventArgs e)
    {
        Response.Redirect("food.aspx");
    }
}