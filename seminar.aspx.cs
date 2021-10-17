using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_seminar : System.Web.UI.Page
{
        Class1 c1 = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repeatdata();
            }
        }

        private void repeatdata()
        {
            rptseminar.DataSource = c1.getTable("select * from seminar");
            rptseminar.DataBind();
        }

        protected void rptseminar_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "delete")
            {
                string query = "delete from seminar where semid='" + id + "'";
                if (c1.saverecord(query))
                {
                    repeatdata();
                }
            }

            if (e.CommandName == "update")
            {
                Session["semid"] = id;
                Session["trans"] = "update";
                lbltitle.Text = "Record Update";
                string query = "select * from seminar where semid='" + id + "'";
                DataRow rw = c1.getrow(query);
                showdata(rw);
                pnlshow.Visible = false;
                pnlform.Visible = true;
            }

        }


        private void showdata(DataRow rw)
        {
            txtsemdate.Text = rw["semdate"].ToString();
            txtsemtitle.Text = rw["semtitle"].ToString();
            txtdetail.Text = rw["detail"].ToString();
            txtvenue.Text = rw["venue"].ToString();
            txtcordnt.Text = rw["coordinateby"].ToString();
            txtpurpose.Text = rw["purpose"].ToString();
            txtstarttime.Text = rw["starttime"].ToString();
            txtendtime.Text = rw["endtime"].ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
           
       
            string query = "";
            if (Session["trans"] == "update")
            {
                int id = Convert.ToInt32(Session["semid"]);
                query = "update seminar set semdate='" + txtsemdate.Text + "',semtitle='" + txtsemtitle.Text + "',detail='" + txtdetail.Text + "',venue='" + txtvenue.Text + "',coordinateby='" + txtcordnt.Text + "',purpose='" + txtpurpose.Text + "',starttime='" + txtstarttime.Text + "',endtime='" + txtendtime.Text + "'  where semid='" + id + "'";
            }

            if (Session["trans"] == "new")
            {
                query = "insert into seminar(semdate,semtitle,detail,venue,coordinateby,purpose,starttime,endtime) values('" +txtsemdate.Text+"','" + txtsemtitle.Text + "','" + txtdetail.Text + "','" + txtvenue.Text + "','" + txtcordnt.Text + "','" + txtpurpose.Text + "','" + txtstarttime.Text + "','" + txtendtime.Text + "' )";
            }

            if (c1.saverecord(query))
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
            txtsemtitle.Focus();
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            Session["trans"] = "";
            Session["semid"] = "";
            lbltitle.Text = "";
            pnlform.Visible = false;
            pnlshow.Visible = true;
            clearall();
        }

        private void clearall()
        {
            txtsemdate.Text = "";
            txtsemtitle.Text = "";
            txtdetail.Text = "";
            txtvenue.Text = "";
            txtcordnt.Text = "";
            txtpurpose.Text = "";
            txtstarttime.Text = "";
            txtendtime.Text = "";
        }

    }

