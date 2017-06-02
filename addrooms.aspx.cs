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

public partial class addrooms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string myconnection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection mycon = new SqlConnection(myconnection);
        {
            mycon.Open();

            SqlCommand cmd = new SqlCommand("insert into Rooms values(@a)", mycon);
            cmd.Parameters.AddWithValue("a", TextBox1.Text);
            cmd.ExecuteNonQuery();
            mycon.Close();
            Response.Redirect("admindashboard.aspx");
        }
    }
}