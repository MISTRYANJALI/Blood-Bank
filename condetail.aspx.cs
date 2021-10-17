using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_condetail : System.Web.UI.Page
{

    
    Class1 dc = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    repeatdata();


                }

            }
        }

        private void repeatdata()
        {
            rptcondetail.DataSource = dc.getTable("select * from contactus");
            rptcondetail.DataBind();
        }

        protected void rptbloodbank_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "delete")
            {
                string query = "delete from contactus where contactid='" + id + "'";
                if (dc.saverecord(query))
                {
                    repeatdata();
                }
            }
        }

       
}