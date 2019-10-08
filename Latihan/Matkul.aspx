<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Matkul.aspx.cs" Inherits="Matkul" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <form id="form1" runat="server">
     <div class="row" runat="server" id="view">

            <div class="col-lg-6">
              <!-- Basic Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">View Guest Book</h6>
                </div>
                <div class="card-body">
                    <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtcari" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnCari" runat="server" Text="Cari" OnClick="btnCari_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnTambah" runat="server" Text="Tambah" OnClick="btnTambah_Click" />
                        </td>
                    </tr>
                   </table>
                    <br />
                  <asp:GridView 
                      runat="server" 
                      ID="gridGust" 
                      CssClass="table table-striped table-bordered table-hover"
                      AllowPaging="true"
                      AllowSorting="true"
                      AutoGenerateColumns="false"
                      DataKeyNames="id_matkul"
                      EmptyDataText="Tidak ada Data"
                      PageSize="5"
                      PagerStyle-CssClass="pagination-lg"
                      ShowHeaderWhenEmpty="true"
                      OnPageIndexChanging="gridGust_PageIndexChanging"
                      OnSorting="gridGust_Sorting"
                      OnSelectedIndexChanged="gridGust_SelectedIndexChanged"
                      OnRowCommand="gridGust_RowCommand">
                      <PagerSettings Mode="NumericFirstLast" 
                          FirstPageText="<<"
                          LastPageText=">>" />
                      <Columns>
                          <asp:TemplateField
                              HeaderText="No."
                              ItemStyle-HorizontalAlign="Center">
                              <ItemTemplate>
                                  <%# Container.DataItemIndex + 1 %>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:BoundField 
                              DataField="nama_matakuliah" 
                              HeaderText="Nama"
                              NullDisplayText="-"
                              ItemStyle-HorizontalAlign="Left"
                              SortExpression="nama_matakuliah" />
    
                          <asp:TemplateField
                              HeaderText="Aksi"
                              ItemStyle-HorizontalAlign="Center">
                              <ItemTemplate>
                                  <asp:LinkButton
                                      runat="server"
                                      ID="linkEdit"
                                      CommandName="Ubah"
                                      CommandArgument='<%#DataBinder.Eval(Container,"RowINdex") %>'
                                      ToolTip="Ubah Data Tabel"
                                      >Ubah</asp:LinkButton>
                                  <asp:LinkButton
                                      runat="server"
                                      ID="LinkButton1"
                                      CommandName="Hapus"
                                      CommandArgument='<%#DataBinder.Eval(Container,"RowINdex") %>'
                                      ToolTip="Ubah Data Tabel">Hapus</asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
                  </asp:GridView>
               </div>
            </div>
            </div>
            </div>
     <div class="row" runat="server" id="edit">

            <div class="col-lg-6">

              <!-- Basic Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Edit Matakuliah</h6>
                </div>
                <div class="card-body">
                   <table>
                        <tr>
                            <td>
                                <label>ID Matakuliah</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtIDMat" runat="server"></asp:TextBox>
                            </td>
                            <td><asp:RequiredFieldValidator
                            id="RequiredFieldValidator4"
                            ControlToValidate="txtIDMat"
                            ForeColor="Red"
                            ErrorMessage="*TextBox Tidak Boleh Kosong"
                            OnServerValidate="CustomValidator"
                            ValidateEmptyText="true"
                            runat="server"
                            ValidationGroup="valEdit" />
                            <asp:Label ID="labelid" runat="server" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <label>Nama Matkul</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMatkuledit" runat="server"></asp:TextBox>
                            </td>
                            <td><asp:RequiredFieldValidator
                            id="RequiredFieldValidator1"
                            ControlToValidate="txtMatkuledit"
                            ForeColor="Red"
                            ErrorMessage="*TextBox Tidak Boleh Kosong"
                            OnServerValidate="CustomValidator"
                            ValidateEmptyText="true"
                            runat="server"
                            ValidationGroup="valEdit" />
                            <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="btnEdit" runat="server" Text="Ubah" ValidationGroup="valEdit" OnClick="btnEdit_Click"/>
                            </td>
                            
                        </tr>
                   </table>
               </div>
            </div>
            </div>
            </div>
     <div class="row" runat="server" id="add">

            <div class="col-lg-6">

              <!-- Basic Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Add Matakuliah</h6>
                </div>
                <div class="card-body">
                  <table>
                        <tr>
                            <td>
                                <label>ID Matkul</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                            </td>
                            <td><asp:RequiredFieldValidator
                            id="RequiredFieldValidator2"
                            ControlToValidate="txtId"
                            ForeColor="Red"
                            ErrorMessage="*TextBox Tidak Boleh Kosong"
                            OnServerValidate="CustomValidator"
                            ValidateEmptyText="true"
                            runat="server"
                            ValidationGroup="valAdd" /></td>

                            <td>
                                <label>Nama</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMatkul" runat="server"></asp:TextBox>
                            </td>
                            <td><asp:RequiredFieldValidator
                            id="RequiredFieldValidator3"
                            ControlToValidate="txtMatkul"
                            ForeColor="Red"
                            ErrorMessage="*TextBox Tidak Boleh Kosong"
                            OnServerValidate="CustomValidator"
                            ValidateEmptyText="true"
                            runat="server"
                            ValidationGroup="valAdd" /></td>
                            <td>
                                <asp:Button ID="btnTambah1" runat="server" Text="Tambah" ValidationGroup="valAdd" OnClick="btnTambah1_Click" />
                            </td>
                        </tr>
                   </table>
               </div>
            </div>
            </div>
            </div>
     </form>
</asp:Content>

