using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace TP1_Movies
{
    public partial class details : Page
    {
        protected int id = 0;
        protected string colorClass = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["ID"]);
                SqlCommand cmd = new SqlCommand("SELECT * FROM Movie WHERE ID = @id", DB.con);
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                ltrTitle.Text = reader["Title"].ToString();
                ltrTitle.Text += $" - ({reader.GetDateTime(reader.GetOrdinal("ReleaseDate")).ToString("yyyy")})";
                ltrDescription.Text = reader["Description"].ToString();
                ltrDate.Text = reader.GetDateTime(reader.GetOrdinal("ReleaseDate")).ToString("MM/dd/yyyy");
                ltrDate.Text += $" - ({reader["Country"].ToString()}) - ";
                int duration = reader.GetInt32(reader.GetOrdinal("Duration"));
                int durationHours = duration / 60;
                int durationMinutes = duration % 60;
                ltrDate.Text += $" {durationHours}h{durationMinutes}";
                imgMovie.ImageUrl = "/images/" + reader.GetString(reader.GetOrdinal("Image"));

                double rating = Convert.ToDouble(reader["Rating"]);
                if (rating < 5)
                {
                    colorClass = "red";
                } else if (rating < 7)
                {
                    colorClass = "yellow";
                } else
                {
                    colorClass = "green";
                }

                ltrRating.Text = rating.ToString("0.0");

                reader.Close();
            }
        }
    }
}