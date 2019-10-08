using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mahasiswa : System.Web.UI.Page
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
            AddMahasiswa.Visible = false;
            editMahasiswa.Visible = false;
            viewMahasiswa.Visible = true;
            add();
        }
    }

    public void add()
    {
        drProdiedit.Items.Add("MK");
        drProdiedit.Items.Add("SI");
    }

    public DataSet LoadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "[selectMahasiswa]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nim", txtSearch.Text);
        SqlDataAdapter adapter = new SqlDataAdapter(com);
        adapter.Fill(ds);
        gridDataMahasiswa.DataSource = ds;
        gridDataMahasiswa.DataBind();
        return ds;
    }

    protected void gridDataMahasiswa_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void cmdOK_Click(object sender, EventArgs e)
    {
        LoadData();
        AddMahasiswa.Visible = true;
        //EditMahasiswa.Visible = false;
        viewMahasiswa.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadData();
        AddMahasiswa.Visible = false;
        //EditBuku.Visible = false;
        viewMahasiswa.Visible = true;
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

        gridDataMahasiswa.DataSource = dv;
        gridDataMahasiswa.DataBind();

    }

    protected void gridDataMahasiswa_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridDataMahasiswa.PageIndex = e.NewPageIndex;
        LoadData();

    }

    protected void gridDataMahasiswa_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Ubah")
        {
            string id = gridDataMahasiswa.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblnim.Text = id;
            txtNIMedit.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            txtNamaedit.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
            txtTempatedit.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;

            //drProdiedit.SelectedValue = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[5].Text;
            txtAlamatedit.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
            txtEmailedit.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[7].Text;
            txtNomoredit.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[8].Text;
            viewMahasiswa.Visible = false;
            editMahasiswa.Visible = true;
            AddMahasiswa.Visible = false;
        }
        else if (e.CommandName == "Delete")
        {
            txtNIMedit.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[0].Text;
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "[sp_DeleteMahasiswa]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nim", txtNIMedit.Text);
            con.Open();
            int result = Convert.ToInt32(com.ExecuteNonQuery());
            con.Close();
            LoadData();
            viewMahasiswa.Visible = true;
            editMahasiswa.Visible = false;
            AddMahasiswa.Visible = false;
        }

    }

    protected void gridDataMahasiswa_OnSorting(object sender, GridViewSortEventArgs e)
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

    protected void tambah_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "sp_InputMahasiswa";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nim", txtNIM.Text);
        com.Parameters.AddWithValue("@nama", txtNama.Text);
        com.Parameters.AddWithValue("@tempatlahir", txtTempat.Text);
        com.Parameters.AddWithValue("@tgl_lahir", Calendar1.SelectedDate);
        com.Parameters.AddWithValue("@prodi", drProdi.Text);
        com.Parameters.AddWithValue("@alamat", txtAlamat.Text);
        com.Parameters.AddWithValue("@email", txtEmail.Text);
        com.Parameters.AddWithValue("@nohp", txtNohp.Text);
        con.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        con.Close();
        LoadData();
        viewMahasiswa.Visible = true;
        // edit.Visible = false;
        AddMahasiswa.Visible = false;
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "[sp_UpdateMahasiswa]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nim", txtNIMedit.Text);
        com.Parameters.AddWithValue("@nama", txtNamaedit.Text);
        com.Parameters.AddWithValue("@tempatlahir", txtTempatedit.Text);
        com.Parameters.AddWithValue("@tgl_lahir", Calendar2.SelectedDate);
        com.Parameters.AddWithValue("@prodi", drProdiedit.Text);
        com.Parameters.AddWithValue("@alamat", txtAlamatedit.Text);
        com.Parameters.AddWithValue("@email", txtEmailedit.Text);
        com.Parameters.AddWithValue("@nohp", txtNomoredit.Text);
        con.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        con.Close();
        LoadData();
        viewMahasiswa.Visible = true;
        editMahasiswa.Visible = false;
        AddMahasiswa.Visible = false;
    }

    //protected void gridDataMahasiswa_RowDeleting(object sender, GridViewDeletedEventArgs e)
    //{
    //    LoadData();
    //}
    
}