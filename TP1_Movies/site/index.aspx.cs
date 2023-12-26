using System;
using System.Collections;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using Newtonsoft.Json;

namespace TP1_Movies
{
    public partial class index : Page
    {
        DB db = new DB();
        protected string colorClass = "";

        public int PageNum
        {
            get {
                if (ViewState["pageNum"] != null)
                    return Convert.ToInt32(ViewState["pageNum"]);
                return 0;
            }
            set
            {
                ViewState["pageNum"] = value;
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindList();
                BindDropdowns();
            }
        }

        protected void BindDropdowns()
        {
            for(int i = 1900; i <= DateTime.Now.Year; i++)
            {
                drpFromYear.Items.Add(i.ToString());
                drpToYear.Items.Add(i.ToString());
            }
        }

        protected void BindList()
        {
            System.Threading.Thread.Sleep(3000);
            string query = "SELECT * FROM Movie";
            string where = " WHERE ";

            if (txtKeyword.Text != string.Empty)
            {
                query += $"{where} (Title LIKE '%{txtKeyword.Text}%' OR Description LIKE '%{txtKeyword.Text}%')";
                where = " AND ";
            }

            if (drpFromYear.SelectedValue != string.Empty)
            {
                query += $"{where} YEAR(ReleaseDate) >= {drpFromYear.SelectedValue}";
                where = " AND ";
            }

            if (drpToYear.SelectedValue != string.Empty)
            {
                query += $"{where} YEAR(ReleaseDate) <= {drpToYear.SelectedValue}";
                where = " AND ";
            }

            if (txtFrom.Value != string.Empty)
            {
                query += $"{where} Rating >= {txtFrom.Value}";
                where = " AND ";
            }

            if (txtTo.Value != string.Empty)
            {
                query += $"{where} Rating <= {txtTo.Value}";
                where = " AND ";
            }

            if (drpSort.SelectedValue != string.Empty)
            {
                query += " ORDER BY " + drpSort.SelectedValue;
            }

            DataTable dt = db.GetList(query);
            
            ltrEmptyResults.Visible = dt.Rows.Count == 0;

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 12;
            rptTopPager.Visible = pds.PageCount > 1;
            rptBottomPager.Visible = pds.PageCount > 1;
            PageNum = PageNum >= pds.PageCount ? 0 : PageNum;
            pds.CurrentPageIndex = PageNum;

            ArrayList pages = new ArrayList();
            for (int i = 0; i <= pds.PageCount - 1; i++)
            {
                pages.Add(i.ToString());
            }

            rptTopPager.DataSource = pages;
            rptTopPager.DataBind();

            rptBottomPager.DataSource = pages;
            rptBottomPager.DataBind();

            lnkPrevious.CommandArgument = (pds.CurrentPageIndex - 1).ToString();
            lnkPrevious.Visible = !pds.IsFirstPage;
            lnkNext.CommandArgument = (pds.CurrentPageIndex + 1).ToString();
            lnkNext.Visible = !pds.IsLastPage;

            lnkPreviousTop.CommandArgument = (pds.CurrentPageIndex - 1).ToString();
            lnkPreviousTop.Visible = !pds.IsFirstPage;
            lnkNextTop.CommandArgument = (pds.CurrentPageIndex + 1).ToString();
            lnkNextTop.Visible = !pds.IsLastPage;

            rptMovies.DataSource = pds;
            rptMovies.DataBind();
        }

        protected void rptMovies_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView rptItem = e.Item.DataItem as DataRowView;
                HyperLink lnkTitle = e.Item.FindControl("lnkTitle") as HyperLink;
                HyperLink lnkImage = e.Item.FindControl("lnkImage") as HyperLink;
                Literal ltrRating = e.Item.FindControl("ltrRating") as Literal;
                Image imgItem = e.Item.FindControl("imgItem") as Image;

                lnkTitle.Text = rptItem["Title"].ToString();
                lnkTitle.NavigateUrl = "details.aspx?ID=" + rptItem["ID"];
                lnkImage.NavigateUrl = "details.aspx?ID=" + rptItem["ID"];
                imgItem.ImageUrl = "~/images/" + rptItem["image"];

                double rating = Convert.ToDouble(rptItem["Rating"]);
                
                colorClass = "green";
                if (rating < 5)
                {
                    colorClass = "red";
                }
                else if (rating < 7)
                {
                    colorClass = "yellow";
                }

                ltrRating.Text = $"<div class='rating {colorClass}'>{ rating.ToString("0.0") }</div>";
            }
        }

        protected void drpSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindList();
        }

        protected void rptPager_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int pageItem = Convert.ToInt32(e.Item.DataItem);
                LinkButton lnk = e.Item.FindControl("lnk") as LinkButton;
                lnk.Text = (pageItem + 1).ToString();
                lnk.Enabled = PageNum != pageItem;
                lnk.CssClass = PageNum == pageItem ? "active" : "";
                lnk.CommandArgument = pageItem.ToString();
            }
        }

        protected void lnk_Click(object sender, CommandEventArgs e)
        {
            ViewState["pageNum"] = Convert.ToInt32(e.CommandArgument);
            BindList();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindList();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtKeyword.Text = string.Empty;
            drpFromYear.SelectedValue = string.Empty;
            drpToYear.SelectedValue = string.Empty;
            txtFrom.Value = string.Empty;
            txtTo.Value = string.Empty;
            BindList();
        }
    }
}