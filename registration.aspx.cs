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
using System.Drawing;

public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void reg_submit_Click(object sender, EventArgs e)
    {
        {
            string myconnection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection mycon = new SqlConnection(myconnection);
            //mycon.Open();
            //SqlCommand cmdd = new SqlCommand("select*from RegData where user_name='" + user_name.Text + "'", mycon);

            //SqlDataReader dr = cmdd.ExecuteReader();

            //if (dr.Read())
            //{

            //    user_name.Text = "User Name is Already Exist";

            //    this.user_name.BackColor = Color.Red;

            //    mycon.Close();
            //}

            //else
            {
                mycon.Open();

                    SqlCommand cmd = new SqlCommand("insert into RegData values(@a,@b,@c,@d)", mycon);
                    cmd.Parameters.AddWithValue("a", name.Text);
                    cmd.Parameters.AddWithValue("b", user_name.Text);
                    cmd.Parameters.AddWithValue("c", email.Text);
                    cmd.Parameters.AddWithValue("d", pass.Text);
                    cmd.ExecuteNonQuery();
                    Session["name"] = user_name.Text;
                    Response.Redirect("login.aspx");

                mycon.Close();
            }
        }
    }
}