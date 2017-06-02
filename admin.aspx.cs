using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void admin_login_submit_Click(object sender, EventArgs e)
    {
        if (user_name.Text.Equals("admin") && pass.Text.Equals("P@ssworD"))
        {
            Session["name"] = user_name.Text;
            Response.Redirect("admindashboard.aspx");
        }   
        else
        {
            user_name.BackColor = System.Drawing.Color.Red; ;
            pass.BackColor = System.Drawing.Color.Red; ;
        }
    }
}