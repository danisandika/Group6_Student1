using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Matkul : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
    DataSet ds = new DataSet();
    private const string ASCENDING = " ASC";
    private const string DESCENDING = " DESC";
    public DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "sp_cari";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@id_matkul", txtcari.Text);
        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridGust.DataSource = ds;
        gridGust.DataBind();
        return ds;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadData();
            view.Visible = true;
            edit.Visible = false;
            add.Visible = false;
        }

    }

    protected void gridGust_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Ubah")
        {
            string id = gridGust.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblid.Text = id;
            txtIDMat.Text = gridGust.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[0].Text;
            txtMatkuledit.Text = gridGust.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            view.Visible = false;
            edit.Visible = true;
            add.Visible = false;
        }
        else if (e.CommandName == "Hapus")
        {
            string id = gridGust.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblid.Text = id;
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "sp_hapus";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@id_matkul", lblid.Text);
            con.Open();
            int result = Convert.ToInt32(com.ExecuteNonQuery());
            con.Close();
            clear();
            loadData();
            view.Visible = true;
            edit.Visible = false;
            add.Visible = false;
        }
    }

    protected void gridGust_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridGust.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridGust_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortExpression = e.SortExpression;

        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            SortGridView(sortExpression, DESCENDING);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            SortGridView(sortExpression, ASCENDING);
        }
    }

    protected void gridGust_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnTambah_Click(object sender, EventArgs e)
    {
        view.Visible = false;
        edit.Visible = false;
        add.Visible = true;
    }

    protected void btnCari_Click(object sender, EventArgs e)
    {
        loadData();
    }
    public SortDirection GridViewSortDirection
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

    private void SortGridView(string sortExpression, string direction)
    {
        DataTable dt = loadData().Tables[0];
        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridGust.DataSource = dv;
        gridGust.DataBind();
    }

    protected void btnTambah1_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "sp_create";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@id_matkul", txtMatkul.Text);
        com.Parameters.AddWithValue("@nama_matakuliah", txtMatkul.Text);
        con.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        con.Close();
        clear();
        loadData();
        view.Visible = true;
        edit.Visible = false;
        add.Visible = false;
    }
    protected void linkEdit_Click(object sender, EventArgs e)
    {

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "sp_update";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@id_matkul", lblid.Text);
        com.Parameters.AddWithValue("@nama_matakuliah", txtMatkuledit.Text);
        con.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        con.Close();
        clear();
        loadData();
        view.Visible = true;
        edit.Visible = false;
        add.Visible = false;
    }
    public void clear()
    {
        txtcari.Text = "";
        txtMatkul.Text = "";
        txtMatkuledit.Text = "";
    }
}