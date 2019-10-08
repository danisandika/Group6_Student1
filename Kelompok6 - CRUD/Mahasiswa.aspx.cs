using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mahasiswa : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            loadData();
            divAdd.Visible = false;
            divEdit.Visible = false;
            divView.Visible = true;
        }
    }

    protected void gridMahasiswa_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridMahasiswa.PageIndex = e.NewPageIndex;
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

    private void sortGridView(string sortExpression, string direction)
    {
        //You can cache the Datatable for improving performance
        DataTable dt = loadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridMahasiswa.DataSource = dv;
        gridMahasiswa.DataBind();
    }

    protected void gridMahasiswa_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            String id = gridMahasiswa.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblNIMEdit.Text = id;
            txtEditNama.Text = gridMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            txtEdittmp_Lahir.Text = gridMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
            txtEdittgl_lahir.Text = gridMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
            ddlEditProdi.Text = gridMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[4].Text;
            txtEditAlamat.Text = gridMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[5].Text;
            txtEditemail.Text = gridMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
            txtEditnohp.Text = gridMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[7].Text;


            divAdd.Visible = false;
            divEdit.Visible = true;
            divView.Visible = false;
        }
        else if(e.CommandName=="cmHapus")
        {
            String id = gridMahasiswa.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "sp_DeleteMhs";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nim", id);

            conn.Open();
            int result = Convert.ToInt32(cmd.ExecuteNonQuery());
            conn.Close();
            loadData();
        }
    }

    protected void gridMahasiswa_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortExpression = e.SortExpression;

        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            sortGridView(sortExpression, Descending);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            sortGridView(sortExpression, Ascending);
        }
    }

    protected void gridMahasiswa_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectMhs";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nama", txtcariMahasiswa.Text);
        com.Parameters.AddWithValue("@prodi", txtcariMahasiswa.Text);
        com.Parameters.AddWithValue("@alamat", txtcariMahasiswa.Text);
        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridMahasiswa.DataSource = ds;
        gridMahasiswa.DataBind();
        return ds;
    }

    protected void txtcariMahasiswa_TextChanged(object sender, EventArgs e)
    {
        loadData();
    }

    protected void btnCari_Click(object sender, EventArgs e)
    {
        loadData();
    }

    protected void btnSaveEdit_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_UpdateMhs";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nim", lblNIMEdit.Text);
        com.Parameters.AddWithValue("@nama", txtEditNama.Text);
        com.Parameters.AddWithValue("@tmp_lahir", txtEdittmp_Lahir.Text);
        com.Parameters.AddWithValue("@tgl_lahir", txtEdittgl_lahir.Text);
        com.Parameters.AddWithValue("@prodi", ddlEditProdi.Text);
        com.Parameters.AddWithValue("@alamat", txtEditAlamat.Text);
        com.Parameters.AddWithValue("@email", txtEditemail.Text);
        com.Parameters.AddWithValue("@nohp", txtEditnohp.Text);
        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        loadData();
        cancelEdit();
        divView.Visible = true;
        divEdit.Visible = false;
        divAdd.Visible = false;
    }

    protected void btnCancelEdit_Click(object sender, EventArgs e)
    {
        cancelEdit();
    }

    protected void btn_simpan_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InsertMhs";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nim", txtnim.Text);
        com.Parameters.AddWithValue("@nama", txtnama.Text);
        com.Parameters.AddWithValue("@tmp_lahir", txttmp_Lahir.Text);
        com.Parameters.AddWithValue("@tgl_lahir", txttgl_lahir.Text);
        com.Parameters.AddWithValue("@prodi", ddlProdi.Text);
        com.Parameters.AddWithValue("@alamat", txtAlamat.Text);
        com.Parameters.AddWithValue("@email", txtemail.Text);
        com.Parameters.AddWithValue("@nohp", txtnohp.Text);
        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        loadData();
        cancel();
        divView.Visible = true;
        divEdit.Visible = false;
        divAdd.Visible = false;
        
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        cancel();
    }


    protected void btn_tambah_Click1(object sender, EventArgs e)
    {
        divAdd.Visible = true;
        divEdit.Visible = false;
        divView.Visible = false;
    }

    private void cancelEdit()
    {

        txtEditNama.Text = null;
        txtEdittmp_Lahir.Text = null;
        txtEditAlamat.Text = null;
        txtEditemail.Text = null;
        txtEditnohp.Text = null;
    }

    private void cancel()
    {
        txtnim.Text = null;
        txtnama.Text = null;
        txttmp_Lahir.Text = null;
        txtAlamat.Text = null;
        txtemail.Text = null;
        txtnohp.Text = null;
    }
}