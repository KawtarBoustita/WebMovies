using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace TP1_Movies.admin.movies
{
    public partial class add : Page
    {
        protected int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            ltrTitle.Text = Request.QueryString["ID"] != null ? "Edit Movie" : "Add Movie";
            if(Request.QueryString["ID"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["ID"]);
                if (!IsPostBack)
                {
                    BindMovie();
                }
                rfvImage.Enabled = false;
            }
        }

        protected void BindMovie()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Movie WHERE ID = @id", DB.con);
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            txtTitle.Text = reader["Title"].ToString();
            txtDescription.Text = reader["Description"].ToString();
            txtDuration.Text = reader.GetInt32(reader.GetOrdinal("Duration")).ToString();
            txtRating.Text = reader.GetDouble(reader.GetOrdinal("Rating")).ToString();
            txtCountry.Text = reader.GetString(reader.GetOrdinal("Country"));
            txtReleaseDate.Text = reader.GetDateTime(reader.GetOrdinal("ReleaseDate")).ToString("yyyy-MM-dd");
            imgImage.ImageUrl = "/images/" + reader.GetString(reader.GetOrdinal("Image"));
            reader.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Title = txtTitle.Text;
                string Description = txtDescription.Text;
                int Duration = Convert.ToInt32(txtDuration.Text);
                string Rating = txtRating.Text;
                string Country = txtCountry.Text;
                string ReleaseDate = txtReleaseDate.Text;
                string Image = string.Empty;

                string saveDir = @"\images\";
                string appPath = Request.PhysicalApplicationPath;
                if (fuImage.HasFile)
                {
                    Image = Server.HtmlEncode(fuImage.FileName);
                    fuImage.SaveAs(appPath + saveDir + Server.HtmlEncode(fuImage.FileName));
                }
                else
                {
                    Image = imgImage.ImageUrl.Replace("/images/","");
                }

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = DB.con;
                cmd.Parameters.AddWithValue("@Title", Title);
                cmd.Parameters.AddWithValue("@Description", Description);
                cmd.Parameters.AddWithValue("@Duration", Duration);
                cmd.Parameters.AddWithValue("@Image", Image);
                cmd.Parameters.AddWithValue("@ReleaseDate", ReleaseDate);
                cmd.Parameters.AddWithValue("@Rating", Rating);
                cmd.Parameters.AddWithValue("@Country", Country);

                string query = string.Empty;

                if (id == 0)
                {
                    query = "INSERT INTO Movie VALUES (@Title, @Description, @Duration, @Image, @ReleaseDate, @Rating, @Country)";
                    cmd.CommandText = query;
                } else
                {
                    query = "UPDATE Movie SET Title=@Title, Description=@Description, Duration=@Duration, Image=@Image, ReleaseDate=@ReleaseDate, Rating=@Rating, Country=@Country WHERE ID = " + id;
                    cmd.CommandText = query;
                }

                cmd.ExecuteNonQuery();
                Response.Redirect("/admin/movies/list.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/admin/movies/list.aspx");
        }
    } 
}