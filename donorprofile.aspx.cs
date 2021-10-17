
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_donorprofile : System.Web.UI.Page
{

    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddcity.DataSource = c1.getTable("select cityid,cityname from city ");
            ddcity.DataMember = "city";
            ddcity.DataTextField = "cityname";
            ddcity.DataValueField = "cityid";
            ddcity.DataBind();

            ddbldgrpid.DataSource = c1.getTable("select bloodgrpid,bloodgrpname from city,bloodgroup ");
            ddbldgrpid.DataMember = "bloodgroup";
            ddbldgrpid.DataTextField = "bloodgrpname";
            ddbldgrpid.DataValueField = "bloodgrpid";
            ddbldgrpid.DataBind();

            int regid = Convert.ToInt32(Session["regid"]);
            string query = "select * from donor where regid='" + regid + "'";
            DataRow rw = c1.getrow(query);
            if (rw != null)
            {
                showdata(rw);
            }
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string query = "";

        int id = Convert.ToInt32(Session["regid"]);
       

            if (fupphoto.PostedFile.FileName != "")
            {
                query = "update donor set donorname='" + txtdnrname.Text + "',address='" + txtdnradd.Text + "',cityid='" + ddcity.SelectedValue + "',contactno='" + txtconno.Text + "',gender='"+radiobtn.SelectedValue +"',emailid='" + txtemailid.Text + "',birthdate='" + txtbrtdate.Text + "',bloodgrpid='" + ddbldgrpid.SelectedValue + "',diseas='" + txtdiseas.Text + "',history='" + txthistory.Text + "',health='" + txthealth.Text + "',height='" + txtheight.Text + "',weight='" + txtweight.Text + "',photo='" + fupphoto.PostedFile.FileName + "' where regid='" + id + "'";
            }
            else
            {
                query = "update donor set donorname='" + txtdnrname.Text + "',address='" + txtdnradd.Text + "',cityid='" + ddcity.SelectedValue + "',contactno='" + txtconno.Text + "',gender='" + radiobtn.SelectedValue + "',emailid='" + txtemailid.Text + "',birthdate='" + txtbrtdate.Text + "',bloodgrpid='" + ddbldgrpid.SelectedValue + "',diseas='" + txtdiseas.Text + "',history='" + txthistory.Text + "',health='" + txthealth.Text + "',height='" + txtheight.Text + "',weight='" + txtweight.Text + "' where regid='" + id + "'";


            }

        
        if (c1.saverecord(query))
        {
            string path = Server.MapPath("../photos/");
           

            if (fupphoto.PostedFile.FileName != "")
            {
                fupphoto.SaveAs(path + fupphoto.PostedFile.FileName);
            }
          
        }
        Response.Redirect("donoruser.aspx");
    }


     private void showdata(DataRow rw)
     {
         txtdnrname.Text = rw["donorname"].ToString();
         txtdnradd.Text = rw["address"].ToString();
         ddcity.SelectedValue = rw["cityid"].ToString();
         txtpincode.Text = rw["pincode"].ToString();
         txtconno.Text = rw["contactno"].ToString();
         radiobtn.SelectedValue = rw["gender"].ToString();
         txtemailid.Text = rw["emailid"].ToString();
         txtbrtdate.Text = rw["birthdate"].ToString();
         ddbldgrpid.SelectedValue = rw["bloodgrpid"].ToString();
         txtdiseas.Text = rw["diseas"].ToString();
         txthistory.Text = rw["history"].ToString();
         txthealth.Text = rw["health"].ToString();
         txtheight.Text = rw["height"].ToString();
         txtweight.Text = rw["weight"].ToString();
        
     }
     protected void btncancel_Click(object sender, EventArgs e)
     {
         Session["trans"] = "";
         Session["donorid"] = "";
         lbltitle.Text = "";
           clearall();
     }
     private void clearall()
     {

         txtdnrname.Text = "";
         txtdnradd.Text = "";
         ddcity.ClearSelection();
         txtpincode.Text = "";
         txtconno.Text = "";
         radiobtn.ClearSelection();
         txtemailid.Text = "";
         txtbrtdate.Text = "";
         ddbldgrpid.ClearSelection();
         txtdiseas.Text = "";
         txthistory.Text = "";
         txthealth.Text = "";
         txtheight.Text = "";
         txtweight.Text = "";


     }
    
}