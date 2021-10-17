using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;

public partial class admin_adminhome : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    public int tdonor;
    DataTable tb;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            show();
            PopulateChart();
            
        }
    }

    public void show()
    {
        tb = c1.getTable("select count(*) as count from register");
      
        lbluser.Text = tb.Rows[0]["count"].ToString();

        tb = c1.getTable("select count(*) as count from donor");

        lbldonor.Text = tb.Rows[0]["count"].ToString();

        tb = c1.getTable("select count(*) as count from profile");

        lblrec.Text = tb.Rows[0]["count"].ToString();

        tb = c1.getTable("select count(*) as count from bloodbank ");

        lblbank.Text = tb.Rows[0]["count"].ToString();

       // DataTable tb1= c1.getTable("select bloodgroup,qty from blood");

       
    }

    protected void PopulateChart()
    {

        DataTable dt = c1.getTable("select bloodgroup,qty from blood");
        Chart1.DataSource = dt;
        //Chart1.Series[0].ChartType = (SeriesChartType)int.Parse(rblChartType.SelectedItem.Value);
    
        Chart1.Series[0].XValueMember = "bloodgroup";
        Chart1.Series[0].YValueMembers = "qty";
        Chart1.ChartAreas[0].AxisX.Title = "Blood Group";
        Chart1.DataBind();

        
        
    }
}