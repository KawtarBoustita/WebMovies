
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace TP1_Movies.admin.movies
{
    public partial class list : Page
    {
        DB db = new DB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void BindGrid()
        {
            DataTable dt = db.GetList("SELECT * FROM Movie");
            gvList.DataSource = dt;
            gvList.DataBind();
        }

        protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvList.PageIndex = e.NewPageIndex;
            BindGrid();

        }

        protected void gvList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = (int)gvList.DataKeys[e.RowIndex].Value;
            GridViewRow gr = gvList.Rows[e.RowIndex];
            TextBox txtTitle = (TextBox)gr.Cells[0].Controls[0];
            TextBox txtDuration = (TextBox)gr.Cells[1].Controls[0];
            TextBox txtCountry = (TextBox)gr.Cells[2].Controls[0];

            string query = $"UPDATE Movie SET Title = @Title, Duration = @Duration, " +
                           $"Country = @Country WHERE Id = @id";

            SqlCommand cmd = new SqlCommand(query, DB.con);
            cmd.Parameters.Add("@Title", SqlDbType.VarChar, 50).Value = txtTitle.Text;
            cmd.Parameters.Add("@Duration", SqlDbType.Int).Value = txtDuration.Text;
            cmd.Parameters.Add("@Country", SqlDbType.VarChar, 50).Value = txtCountry.Text;
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

            cmd.ExecuteNonQuery();
            gvList.EditIndex = -1;
            BindGrid();
        }

        protected void gvList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        //    int id = (int)gvList.DataKeys[e.RowIndex].Value;
        //    string query = "DELETE FROM Movie WHERE ID = " + id;
        //    SqlCommand cmd = new SqlCommand(query, DB.con);
        //    cmd.CommandText = query;
        //    cmd.ExecuteNonQuery();
        //    BindGrid();
        }

        protected void gvList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvList.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvList.EditIndex = -1;
            BindGrid();
        }

        protected void gvList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton btnEdit = e.Row.FindControl("btnEdit") as ImageButton;
                ImageButton btnDelete = e.Row.FindControl("btnDelete") as ImageButton;

                DataRowView dr = e.Row.DataItem as DataRowView;
                btnDelete.CommandArgument = dr["ID"].ToString();
                btnEdit.CommandArgument = dr["ID"].ToString();
            }
        }

        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "FullEdit")
            {
                Response.Redirect("/admin/movies/add.aspx?ID=" + e.CommandArgument);
            }

            if(e.CommandName == "Suppri")
            {
                string query = "DELETE FROM Movie WHERE ID = " + e.CommandArgument;
                SqlCommand cmd = new SqlCommand(query, DB.con);
                cmd.CommandText = query;
                cmd.ExecuteNonQuery();
                BindGrid();
            }
        }
    }
}