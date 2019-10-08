using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bukuu : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
    DataSet ds = new DataSet();
    private const string ASCENDING = " ASC";
    private const string DESCENDING = " DESC";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            AddBuku.Visible = false;
            EditBuku.Visible = false;
            ViewBuku.Visible = true;

        }
    }

    public DataSet LoadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "[selectName]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@judul", txtSearch.Text);
        SqlDataAdapter adapter = new SqlDataAdapter(com);
        adapter.Fill(ds);
        gridDataBuku.DataSource = ds;
        gridDataBuku.DataBind();
        return ds;
    }

    public SortDirection GridViewsortDirection
    {
        get
        {
            if (ViewState["sortDirection"] == null)
                ViewState["sortDirection"] = SortDirection.Ascending;

            return (SortDirection)ViewState["sortDirection"];
        }

        set
        {
            ViewState["sortDirection"] = value;
        }

    }


    public void sortGridView(string sortExpression, string direction)
    {
        //cache the database

        DataTable dt = LoadData().Tables[0];
        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridDataBuku.DataSource = dv;
        gridDataBuku.DataBind();

    }


    protected void cmdOK_Click(object sender, EventArgs e)
    {
        LoadData();
        AddBuku.Visible = false;
        EditBuku.Visible = false;
        ViewBuku.Visible = true;

    }

    protected void gridDataBuku_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void gridDataBuku_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridDataBuku.PageIndex = e.NewPageIndex;
        LoadData();

    }

    protected void gridDataBuku_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Ubah")
        {
            string judul = gridDataBuku.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblIdEdit.Text = judul;
            txtEditNama.Text = gridDataBuku.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            AddBuku.Visible = false;
            EditBuku.Visible = true;
            ViewBuku.Visible = false;
        }
        else if (e.CommandName == "Hapus")
        {
        }

    }

    protected void gridDataBuku_OnSorting(object sender, GridViewSortEventArgs e)
    {
        string sortExpression = e.SortExpression;

        if (GridViewsortDirection == SortDirection.Ascending)
        {
            GridViewsortDirection = SortDirection.Descending;
            sortGridView(sortExpression, DESCENDING);
        }
        else
        {

            GridViewsortDirection = SortDirection.Ascending;
            sortGridView(sortExpression, ASCENDING);
        }

    }

    protected void btnSearch_OnClick(object sender, EventArgs e)
    {

    }

    protected void btnAdd_OnClick(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e) // button edit
    {
        //SqlCommand com = new SqlCommand();
        //com.Connection = con;
        //com.CommandText = "[updatedata]";
        //com.CommandType = CommandType.StoredProcedure;
        //com.Parameters.AddWithValue("@id", lblIdEdit.Text);
        //com.Parameters.AddWithValue("@nama", txtEditNama.Text);
        //con.Open();

        //int result = Convert.ToInt32(com.ExecuteNonQuery());
        //con.Close();
        //LoadData();
        //AddCoba.Visible = false;
        //EditCoba.Visible = false;
        //ViewCoba.Visible = true;
    }
}