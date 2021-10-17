using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_img : System.Web.UI.Page
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
        rptimg.DataSource = dc.getTable("select * from img");
        rptimg.DataBind();
    }

    protected void rptimg_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "delete")
        {
            string query = "delete from img where id='" + id + "'";
            if (dc.saverecord(query))
            {
                repeatdata();
            }
        }

    }


   

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string query = "";
       

        if (Session["trans"] == "new")
        {
            query = "insert into img(img) values('" + Fupimg.PostedFile.FileName + "')";
        }

        if (dc.saverecord(query))
        {
            string path = Server.MapPath("../photos/");
            if (Fupimg.PostedFile.FileName != "")
            {
                Fupimg.SaveAs(path + Fupimg.PostedFile.FileName);
            }
            pnlform.Visible = false;
            pnlshow.Visible = true;
        }
    }
    protected void btnnew_Click(object sender, EventArgs e)
    {
        Session["trans"] = "new";
        pnlshow.Visible = false;
        pnlform.Visible = true;
        lbltitle.Text = "Record Insert";
       
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Session["trans"] = "";
        Session["bankid"] = "";
        lbltitle.Text = "";
        pnlform.Visible = false;
        pnlshow.Visible = true;
       
    }

    
}