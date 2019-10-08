using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nilai : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownMhs();
        DropDownMatkul();
        if (!IsPostBack)
        {
            loadData();
            divAdd.Visible = false;
            divEdit.Visible = false;
            divView.Visible = true;
        }
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

    }


    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectNilai";
        com.CommandType = CommandType.StoredProcedure;
       

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridNilai.DataSource = ds;
        gridNilai.DataBind();
        return ds;
    }


    protected void gridNilai_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridNilai.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridNilai_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridNilai_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void gridNilai_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            String nim = gridNilai.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Values[0].ToString();
            String id = gridNilai.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Values[1].ToString();
            lblIDEdit.Text = id;
            lblNIMEdit.Text = nim;
            txtEdituts.Text = gridNilai.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            txtEdituas.Text = gridNilai.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
            txtEdittugas.Text = gridNilai.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;

            divAdd.Visible = false;
            divEdit.Visible = true;
            divView.Visible = false;
        }
        else if (e.CommandName == "cmHapus")
        {
            String nim = gridNilai.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Values[0].ToString();
            String id = gridNilai.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Values[1].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "sp_deleteNilai";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nim", nim);
            cmd.Parameters.AddWithValue("@id_matkul", id);

            conn.Open();
            int result = Convert.ToInt32(cmd.ExecuteNonQuery());
            conn.Close();
            loadData();
        }
    }

    protected void btnSaveEdit_Click(object sender, EventArgs e)
    {
        int uts = Convert.ToInt32(txtuts.Text) * 30;
        int uas = Convert.ToInt32(txtuas.Text) * 40;
        int tugas = Convert.ToInt32(txttugas.Text) * 30;
        int total = (uts + uas + tugas) / 100;
        string status = null;
        if (total > 60)
        {
            status = "LULUS";
        }
        else
        {
            status = "REMIDI";
        }

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_updateNilai";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nim", lblNIMEdit.Text);
        com.Parameters.AddWithValue("@id_matkul", lblIDEdit.Text);
        com.Parameters.AddWithValue("@uts", txtEdituts.Text);
        com.Parameters.AddWithValue("@uas", txtEdituas.Text);
        com.Parameters.AddWithValue("@tugas", txtEdittugas.Text);
        com.Parameters.AddWithValue("@nilai_total", total.ToString());
        com.Parameters.AddWithValue("@status", status);

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

    }

    private void DropDownMhs()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectMhs";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nama","");
        com.Parameters.AddWithValue("@prodi", "");
        com.Parameters.AddWithValue("@alamat", "");
        SqlDataAdapter adap = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        adap.Fill(dt);
        ddlnim.DataSource = dt;
        ddlnim.DataTextField = "nama";
        ddlnim.DataValueField = "nim";
        ddlnim.DataBind();
    }

    private void DropDownMatkul()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectMatkul";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nama_matkul", "");
        
        SqlDataAdapter adap = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        adap.Fill(dt);
        ddlid_matkul.DataSource = dt;
        ddlid_matkul.DataTextField = "nama_matkul";
        ddlid_matkul.DataValueField = "id_matkul";
        ddlid_matkul.DataBind();
    }

    protected void btn_simpan_Click(object sender, EventArgs e)
    {
        int uts = Convert.ToInt32(txtuts.Text) * 30; 
        int uas = Convert.ToInt32(txtuas.Text) * 40;
        int tugas = Convert.ToInt32(txttugas.Text) * 30;
        int total = (uts + uas + tugas) / 100;
        string status = null;
        if(total>60)
        {
            status = "LULUS";
        }
        else
        {
            status = "REMIDI";
        }

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InsertNilai";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nim", ddlnim.SelectedValue);
        com.Parameters.AddWithValue("@id_matkul", ddlid_matkul.SelectedValue);
        com.Parameters.AddWithValue("@uts", txtuts.Text);
        com.Parameters.AddWithValue("@uas", txtuas.Text);
        com.Parameters.AddWithValue("@tugas", txttugas.Text);
        com.Parameters.AddWithValue("@nilai_total",total.ToString());
        com.Parameters.AddWithValue("@status",status );

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
        txtuts.Text = null;
        txtuas.Text = null;
        txttugas.Text = null;
    }

    private void cancelEdit()
    {
        txtEdituts.Text = null;
        txtEdituas.Text = null;
        txtEdittugas.Text = null;
    }
}