using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_doctor : System.Web.UI.Page
{

    Class1 dc = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            repeatdata();
            ddhospt.DataSource = dc.getTable("select cityid,cityname from city");
            ddhospt.DataMember = "city";
            ddhospt.DataTextField = "cityname";
            ddhospt.DataValueField = "cityid";
            ddhospt.DataBind();
        }
    }

    private void repeatdata()
    {
        rptdoctor.DataSource = dc.getTable("select * from vwhospt");
        rptdoctor.DataBind();
    }

    protected void rptdoctor_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "delete")
        {
            string query = "delete from doctor where docid='" + id + "'";
            if (dc.saverecord(query))
            {
                repeatdata();
            }
        }

        if (e.CommandName == "update")
        {
            Session["docid"] = id;
            Session["trans"] = "update";
            lbltitle.Text = "Record Update";
            string query = "select * from doctor where docid='" + id + "'";
            DataRow rw = dc.getrow(query);
            showdata(rw);
            pnlshow.Visible = false;
            pnlform.Visible = true;
        }

    }


    private void showdata(DataRow rw)
    {
        
        txtdocname.Text = rw["docname"].ToString();
        txtconno.Text = rw["contactno"].ToString();
        txtemailid.Text = rw["emailid"].ToString();
        ddhospt.SelectedValue = rw["hospitalname"].ToString();
        txtposi.Text = rw["position"].ToString();
        fupphoto.PostedFile.FileName.ToString();
        txtqua.Text = rw["qualification"].ToString();
        txtexp.Text = rw["exp"].ToString();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string query = "";
        if (Session["trans"] == "update")
        {
            int id = Convert.ToInt32(Session["docid"]);
            if (fupphoto.PostedFile.FileName != "")
            {
                query = "update doctor set docname='" + txtdocname.Text + "',contactno='" + txtconno.Text + "',emailid='" + txtemailid.Text + "',hospitalid='" + ddhospt.SelectedValue + "',position='" + txtposi.Text + "',photo='" + fupphoto.PostedFile.FileName + "',qualification='" + txtqua.Text + "',exp='" + txtexp.Text + "' where docid='" + id + "'";
            }
            else
            {
                query = "update doctor set docname='" + txtdocname.Text + "',contactno='" + txtconno.Text + "',emailid='" + txtemailid.Text + "',hospitalid='" + ddhospt.SelectedValue + "',position='" + txtposi.Text + "',qualification='" + txtqua.Text + "',exp='" + txtexp.Text + "' where docid='" + id + "'";
           
                    
            }

        }
        if (Session["trans"] == "new")
        {
            query = "insert into doctor(docname,contactno,emailid,hospitalid,position,photo,qualification,exp) values('" + txtdocname.Text + "','" + txtconno.Text + "','" + txtemailid.Text + "','" + ddhospt.SelectedValue + "','" + txtposi.Text + "','" + fupphoto.PostedFile.FileName + "','" + txtqua.Text + "','" + txtexp.Text + "'  )";
        }

        if (dc.saverecord(query))
        {
                string path=Server.MapPath("../photos/");

                if (fupphoto.PostedFile.FileName != "")
                {
                    fupphoto.SaveAs(path + fupphoto.PostedFile.FileName);
                }


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
        txtdocname.Focus();
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Session["trans"] = "";
        Session["docid"] = "";
        lbltitle.Text = "";
        pnlform.Visible = false;
        pnlshow.Visible = true;
        clearall();
    }

    private void clearall()
    {
        
        txtdocname.Text = "";
        txtconno.Text = "";
        txtemailid.Text = "";
        ddhospt.ClearSelection();
        txtposi.Text = "";
        txtqua.Text = "";
        txtexp.Text = "";
        
    }

}