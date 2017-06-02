using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Text;
using System.Configuration;

public partial class admindashboard : System.Web.UI.Page
{
    string mc = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

    StringBuilder htmlTable = new StringBuilder();

    protected void Page_Load(object sender, EventArgs e)
    {
        //message.Focus();
        //stat.Text = "";
        if (!Session["name"].Equals("admin"))
        {
            Response.Redirect("admin.aspx");

        }
        else
        {


        }
    }


    protected void submit_Click(object sender, EventArgs e)
    {


        if (!message.Text.Equals(""))
        {
            try
            {
                {
                    SqlConnection mycon = new SqlConnection(mc);
                    mycon.Open();
                    SqlCommand cmd = new SqlCommand("insert into Chat values(@a,@b,@c)", mycon);
                    cmd.Parameters.AddWithValue("a", Session["name"]);
                    cmd.Parameters.AddWithValue("b", message.Text);
                    cmd.Parameters.AddWithValue("c", DropDownList1.SelectedValue);
                    cmd.ExecuteNonQuery();
                    mycon.Close();

                }
            }

            catch
            { this.message.BackColor = Color.Red; }

            message.Text = null;
        }

        if (FileUpload1.HasFiles)
        {
            if (FileUpload1.PostedFile.ContentLength <= 1e+7)
            {
                string filename = Path.GetFileName(FileUpload1.FileName);//file name 
                string path = Server.MapPath("/files/");//path

                this.FileUpload1.SaveAs(path + this.FileUpload1.FileName);

                SqlConnection mycon = new SqlConnection(mc);
                mycon.Open();
                SqlCommand cmd = new SqlCommand("insert into Chat values(@a,@b,@c)", mycon);
                cmd.Parameters.AddWithValue("a", Session["name"]);
                cmd.Parameters.AddWithValue("b", filename);
                cmd.Parameters.AddWithValue("c", DropDownList1.SelectedValue);
                cmd.ExecuteNonQuery();
                mycon.Close();
                //stat.Text = "✓";
            }
            else
            {
                //stat.BackColor = Color.Red;
                //stat.Text = "error uploading.";
            }
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        using (SqlCommand scmd = new SqlCommand())
        {
            SqlConnection mycon = new SqlConnection(mc);
            try
            {
                mycon.Open();
                scmd.Connection = mycon;
                scmd.CommandType = CommandType.Text;
                scmd.CommandText = "SELECT * FROM Chat";
                SqlDataReader articleReader = scmd.ExecuteReader();
                if (articleReader.HasRows)
                {
                    while (articleReader.Read())
                    {
                        htmlTable.Append("<div class=\"chat-container\" id=\"messagecontent\"><a>" + articleReader["name"] + "</a>");
                        htmlTable.Append("<p onclick=\"window.open('/files/" + articleReader["message"] + "')\">" + articleReader["message"] + "</p></div>");
                    }
                    PlaceHolder1.Controls.Add(new Literal { Text = htmlTable.ToString() });
                    articleReader.Close();
                    articleReader.Dispose();

                }
                else
                {
                    htmlTable.Append("<div class=\"chat-container\"><a>SERVER OWNER</a>");
                    htmlTable.Append("<p > WELCOME TO THE NEW CHAT ROOM</p></div>");
                }
            }
            finally
            {
                mycon.Close();
            }
        }
    }

    protected void admin_logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
    }

    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {
        PlaceHolder1.Visible = false;
        SqlConnection mycon = new SqlConnection(mc);
        using (SqlCommand scmd = new SqlCommand())
            try
        {
            
           
            mycon.Open();
            scmd.Connection = mycon;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * FROM Chat where room ='" + DropDownList1.SelectedValue + "'";
            SqlDataReader articleReader = scmd.ExecuteReader();
            if (articleReader.HasRows)
            {
                while (articleReader.Read())
                {
                    htmlTable.Append("<div class=\"chat-container\" id=\"messagecontent\"><a>" + articleReader["name"] + "</a>");
                    htmlTable.Append("<p onclick=\"window.open('/files/" + articleReader["message"] + "')\">" + articleReader["message"] + "</p></div>");
                }
                PlaceHolder2.Controls.Add(new Literal { Text = htmlTable.ToString() });
                articleReader.Close();
                articleReader.Dispose();

            }
            else
            {
                htmlTable.Append("<div class=\"chat-container\"><a>SERVER OWNER</a>");
                htmlTable.Append("<p > WELCOME TO THE NEW CHAT ROOM</p></div>");
            }
        }
        finally
        {
            mycon.Close();
        }
    }
}