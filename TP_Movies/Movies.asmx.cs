using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace TP1_Movies
{
    /// <summary>
    /// Summary description for Movies
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [ScriptService]
    public class Movies : WebService
    {
        //Exemple GET XML
        [WebMethod]
        public List<string> GetMovies()
        {
            string strCon = "Data Source=IN;Initial Catalog=Movies;Integrated Security=True";
            SqlConnection con = new SqlConnection(strCon);

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT * FROM Movie", con);

            DataTable dt = new DataTable();

            sqlDataAdapter.Fill(dt);

            List<string> movies = new List<string>();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                movies.Add(dt.Rows[i]["Title"].ToString());
            }

            return movies;
        }

        //Exemple GET JSON
        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void GetMoviesJSON()
        {
            string strCon = "Data Source=IN;Initial Catalog=Movies;Integrated Security=True";
            SqlConnection con = new SqlConnection(strCon);

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT * FROM Movie", con);

            DataTable dt = new DataTable();

            sqlDataAdapter.Fill(dt);

            string json = JsonConvert.SerializeObject(dt, Formatting.Indented);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.Write(json);
            Context.Response.End();
        }
        
        //Exemple POST JSON
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetMovieByIdJSON(int Id)
        {
            string strCon = "Data Source=IN;Initial Catalog=Movies;Integrated Security=True";
            SqlConnection con = new SqlConnection(strCon);

            SqlCommand cmd = new SqlCommand("SELECT * FROM Movie WHERE ID = @id", DB.con);
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = Id;
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();

            string movie = JsonConvert.SerializeObject(new
            {
                Title = reader["Title"].ToString(),
                Description = reader["Description"].ToString(),
                Duration = reader.GetInt32(reader.GetOrdinal("Duration")),
                Image = reader["Image"].ToString(),
                Rating = Convert.ToDouble(reader["Rating"]),
                Country = reader["Country"].ToString(),
                ReleaseDate = reader.GetDateTime(reader.GetOrdinal("ReleaseDate")).ToString("MM/dd/yyyy")
            }, Formatting.Indented);

            reader.Close();

            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", movie.Length.ToString());
            Context.Response.Flush();
            Context.Response.Write(movie);
        }
    }
}