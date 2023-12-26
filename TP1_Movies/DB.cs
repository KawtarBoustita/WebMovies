
using System.Data;
using System.Data.SqlClient;

namespace TP1_Movies
{
    public class DB
    {
        static string strCon = "Data Source=DESKTOP-93FVCH5;Initial Catalog=Movies;Integrated Security=True";
        public static SqlConnection con = new SqlConnection(strCon);

        public void Open()
        {
            con.Open();
        }

        public DataTable GetList(string query)
        {
            DataTable dt = new DataTable();
            SqlCommand command =  new SqlCommand(query, con);
            SqlDataReader reader = command.ExecuteReader();
            dt.Load(reader);
            return dt;
        }

        public void ExecuteQuery(string query)
        {
            SqlCommand command = new SqlCommand(query, con);
            command.ExecuteNonQuery();
        }

        public string ExecuteScalar(string query)
        {
            SqlCommand command = new SqlCommand(query, con);
            return command.ExecuteScalar().ToString();
        }

        public void Add(string query)
        {
        }

        public void Update()
        {
        }

        public void Delete()
        {
        }

        public void Close()
        {
            con.Close();
        }
    }
}