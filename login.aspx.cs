using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        user_name.Focus();
    }

    protected void login_submit_Click(object sender, EventArgs e)
    {

            string mc = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection mycon = new SqlConnection(mc);
            mycon.Open();
            SqlCommand cmd = new SqlCommand("select * from RegData where user_name=@username and pass=@password", mycon);
            cmd.Parameters.AddWithValue("@username", user_name.Text);
            cmd.Parameters.AddWithValue("@password", pass.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["name"] = user_name.Text;
                Response.Redirect("chat.aspx");
            }
            else
            {
                // Label1.Text = "Invalid username or password";
                this.user_name.BackColor = System.Drawing.Color.Red;
                this.pass.BackColor = System.Drawing.Color.Red;
            }

    }
}