using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace TP1_Movies.admin.users
{
    public partial class add : Page
    {
        protected int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            ltrTitle.Text = Request.QueryString["ID"] != null ? "Edit User" : "Add User";
            if (Request.QueryString["ID"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["ID"]);
                if (!IsPostBack)
                {
                    BindUser();
                } else {
                    rfvPassword.Enabled = txtPassword.Text != string.Empty;
                    rfvPasswordConfirm.Enabled = txtPassword.Text != string.Empty;
                    cvPassword.Enabled = txtPassword.Text != string.Empty;
                }
            } else
            {
                rfvPassword.Enabled = true;
                rfvPasswordConfirm.Enabled = true;
                cvPassword.Enabled = true;
            }
        }

        protected void BindUser()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE ID = @id", DB.con);
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            txtUsername.Text = reader["Username"].ToString();
            cbActive.Checked = reader.GetBoolean(reader.GetOrdinal("IsActive"));
            reader.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Username = txtUsername.Text;
                string Password = txtPassword.Text;
                bool Active = cbActive.Checked;

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = DB.con;
                cmd.Parameters.AddWithValue("@Username", Username);
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@IsActive", Active);

                string query = string.Empty;

                if (id == 0)
                {
                    query = "INSERT INTO Users VALUES (@Username, @Password, @IsActive)";
                    cmd.CommandText = query;
                }
                else
                {
                    query = "UPDATE Users SET Username=@Username, IsActive=@IsActive";
                    if(Password != string.Empty)
                    {
                        query += ", Password=@Password";
                    }
                    query += " WHERE ID = " + id;
                    cmd.CommandText = query;
                }

                cmd.ExecuteNonQuery();
                Response.Redirect("/admin/users/list.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/admin/users/list.aspx");
        }
    }
}