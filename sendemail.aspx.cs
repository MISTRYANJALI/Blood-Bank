using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class admin_sendemail : System.Web.UI.Page
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
        rptemail.DataSource = dc.getTable("select * from register");
        rptemail.DataBind();
    }

    protected void rptemail_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);


        if (e.CommandName == "sendemail")
        {
            Session["regid"] = id;

            lbltitle.Text = "SEND EMAIL";
            string query = "select * from register where regid='" + id + "'";
            DataRow rw = dc.getrow(query);
            txtemailto.Text = rw["email"].ToString();
            pnlshow.Visible = false;
            pnlform.Visible = true;
        }

    }






    protected void btnsend_Click(object sender, EventArgs e)
    {
        string emaildate = DateTime.Today.ToString("MM/dd/yyyy");
        string emailto = txtemailto.Text;
        string subject = txtsubject.Text;
        string description = txtdescription.Text;
        string query = "insert into email(emaildate,emailfrom,emailto,subject,description) values('" + emaildate + "','onlinebloodbank5495@gmail.com','" + emailto + "','" + subject + "','" + description + "')";

        bool result = sendemail(emailto, subject, description);
        if (result)
        {
            if (dc.saverecord(query))
            {
                lblmsg.Text = "your Email send successfully..";
            }
            else
            {
                lblmsg.Text = "Email not submit...";
            }
        }

        else
        {
            lblmsg.Text = "Email not send ..";
        }
    }

    private bool sendemail(string emailto, string subject, string description)
    {
        bool result = false;
        string emailfrom = "onlinebloodbank5495@gmail.com"; //your email address
        string pass = "Bloodbank123";  //your email password

        SmtpClient client = new SmtpClient("smtp.gmail.com");
        MailMessage msg = new MailMessage();

        msg.From = new MailAddress(emailfrom);
        msg.To.Add(new MailAddress(emailto));
        msg.Subject = subject;
        msg.IsBodyHtml = true; //to make message body as html  
        msg.Body = description;//string.Format("hi " + txtusername.Text + "<br/><br/>your password is " + lblmsg.Text);
        try
        {
            client.Port = 587;
            client.Host = "smtp.gmail.com"; //for gmail host  
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential(emailfrom, pass);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(msg);
            result = true;
        }
        catch (Exception ex)
        {
            result = false;
        }
        return result;
    }


    protected void btncancel_Click(object sender, EventArgs e)
    {
        Session["trans"] = "";
        Session["regid"] = "";
        lbltitle.Text = "";
        pnlform.Visible = false;
        pnlshow.Visible = true;
        clearall();
    }

    private void clearall()
    {

        txtemailto.Text = "";
        txtsubject.Text = "";
        txtdescription.Text = "";

    }

}