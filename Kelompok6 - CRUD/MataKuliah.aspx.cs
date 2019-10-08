using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MataKuliah : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadData();
            divAdd.Visible = false;
            divEdit.Visible = false;
            divView.Visible = true;
        }
    }

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectMatkul";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nama_matkul", txtcariMatkul.Text);
       
        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridMatkul.DataSource = ds;
        gridMatkul.DataBind();
        return ds;
    }

    protected void btn_tambah_Click(object sender, EventArgs e)
    {
        divAdd.Visible = true;
        divEdit.Visible = false;
        divView.Visible = false;
    }

    protected void btnCari_Click(object sender, EventArgs e)
    {
        loadData();
    }

    protected void txtcariMatkul_TextChanged(object sender, EventArgs e)
    {
        //loadData();
    }

    protected void gridMatkul_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridMatkul.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridMatkul_SelectedIndexChanged(object sender, EventArgs e)
    {

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

        gridMatkul.DataSource = dv;
        gridMatkul.DataBind();
    }



    protected void gridMatkul_Sorting(object sender, GridViewSortEventArgs e)
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

    protected void gridMatkul_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            String id = gridMatkul.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblIDEdit.Text = id;
            txtEditNama.Text = gridMatkul.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;

            divAdd.Visible = false;
            divEdit.Visible = true;
            divView.Visible = false;
        }
        else if (e.CommandName == "cmHapus")
        {
            String id = gridMatkul.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "sp_deleteMatkul";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_matkul", id);

            conn.Open();
            int result = Convert.ToInt32(cmd.ExecuteNonQuery());
            conn.Close();
            loadData();
        }
    }

    protected void btnSaveEdit_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_updateMatkul";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@id_matkul", lblIDEdit.Text);
        com.Parameters.AddWithValue("@nama_matkul", txtEditNama.Text);

        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        loadData();
        cancelEdit();
        divView.Visible = true;
        divEdit.Visible = false;
        divAdd.Visible = false;
    }

   

    protected void btn_simpan_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InsertMatkul";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@id_matkul", txtid.Text);
        com.Parameters.AddWithValue("@nama_matkul", txtnama.Text);
       
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

    private void cancel()
    {
        txtid.Text = null;
        txtnama.Text = null;
    }

    private void cancelEdit()
    {
        txtEditNama.Text = null;
    }

    protected void btnCancelEdit_Click(object sender, EventArgs e)
    {
        cancelEdit();
    }
}