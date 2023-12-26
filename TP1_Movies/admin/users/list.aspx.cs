using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace TP1_Movies.admin.users
{
    public partial class list : Page
    {
        DB db = new DB();
        int UsersCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void BindGrid()
        {
            UsersCount = Convert.ToInt32(db.ExecuteScalar("SELECT count(Username) FROM Users"));
            DataTable dt = db.GetList("SELECT * FROM Users");
            gvList.DataSource = dt;
            gvList.DataBind();
        }

        protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvList.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton btnEdit = e.Row.FindControl("btnEdit") as ImageButton;
                ImageButton btnDelete = e.Row.FindControl("btnDelete") as ImageButton;

                DataRowView dr = e.Row.DataItem as DataRowView;
                btnDelete.CommandArgument = dr["ID"].ToString();
                btnEdit.CommandArgument = dr["ID"].ToString();

                btnDelete.Visible = UsersCount > 1;
            }
        }

        protected void gvList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gvList.DataKeys[e.RowIndex].Value;
            string query = "DELETE FROM Users WHERE ID = " + id;
            SqlCommand cmd = new SqlCommand(query, DB.con);
            cmd.CommandText = query;
            cmd.ExecuteNonQuery();
            BindGrid();
        }

        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("/admin/users/add.aspx?ID=" + e.CommandArgument);
            }
        }
    }
}