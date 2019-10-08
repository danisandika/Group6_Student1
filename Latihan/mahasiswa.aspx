<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mahasiswa.aspx.cs" Inherits="mahasiswa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form2" runat="server">
    <div id="AddMahasiswa" class="row" runat="server">
                 <div class="content">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>NIM</label>
                                                     <asp:TextBox ID="txtNIM" runat="server" CssClass="auto-style2"></asp:TextBox>
                                                      <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="txtNIM" ErrorMessage="NIM tidak boleh kosong!" ForeColor="Red"/>
                                            </div>
                                        </div>
                                    </div>

                                        <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>NAMA</label>
                                                     <asp:TextBox ID="txtNama" runat="server" CssClass="auto-style1"></asp:TextBox>
                                                     <asp:RequiredFieldValidator runat="server" id="ValidasiNama" ControlToValidate="txtNama" ErrorMessage="Nama tidak boleh kosong!" ForeColor="Red"/>
                                            </div>
                                        </div>
                                        </div>

                                        <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                 <label>Tempat Lahir</label>
                                                     <asp:TextBox ID="txtTempat" runat="server" CssClass="auto-style1"></asp:TextBox>
                                                     <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" ControlToValidate="txtTempat" ErrorMessage="Tempat tidak boleh kosong!" ForeColor="Red"/>
                                            </div>
                                        </div>
                                        </div>
                                  

                                    <div class="row">
                                       <td>
                                          <label>Tanggal Lahir</label>
                                         </td>
                                         <td>
                                             <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                                         </td>
                                        </div>
                                <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                  <label>Prodi</label>
                                                 <asp:DropDownList ID="drProdi" runat="server">
                                                 <asp:ListItem>SI</asp:ListItem>
                                                 <asp:ListItem>MK</asp:ListItem>
                                                 <asp:ListItem>TM</asp:ListItem>
                                                 </asp:DropDownList>                                          
                                             </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Alamat</label>
                                                <asp:TextBox ID="txtAlamat" runat="server" CssClass="auto-style1"></asp:TextBox>
                                                     <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" ControlToValidate="txtAlamat" ErrorMessage="Alamat tidak boleh kosong!" ForeColor="Red"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></asp:TextBox>
                                            </div>
                                        </div>
                                            <td>                                
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                                                runat="server" ErrorMessage="*Masukan Email" 
                                                ControlToValidate="txtEmail"  ForeColor="Red">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" 
                                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ControlToValidate="txtEmail" 
                                                ErrorMessage="*Format Email Salah"  ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>No HP</label>
                                                    <asp:TextBox ID="txtNohp" runat="server" CssClass="auto-style1" MaxLength="13"></asp:TextBox> 
                                            </div>
                                        </div>
                             
                                     <asp:Button id="cmdOK" runat="server" Text="I Accept Continue" OnClick="tambah_Click"  class="btn btn-primary"/>
                                    <div class="clearfix"></div>
                                    </div>

        </div>

    <div id="viewMahasiswa" class="row" runat="server">
         <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
			        <table width="100%" >	
                          <td colspan="2">
                                <div class="input-group mb-3">
                                  <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">Search</span>
                                  </div>
                                    <asp:TextBox ID="txtSearch" runat="server" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></asp:TextBox>
                                    <asp:Button id="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"  class="btn btn-primary"/>
                                </div>
					        </td> <!--membuat sel--> 			       
                                <div class="input-group mb-3">
                                  <div class="input-group-prepend">
                                  </div>
                                    <asp:Button id="btnTambah" runat="server" Text="Tambah" OnClick="cmdOK_Click" class="btn btn-primary"/>
                                </div>
				        <tr> <!--membuat baris-->
                     </table>
        <asp:gridView 
            runat="server" 
            ID="gridDataMahasiswa"
            CssClass="table table-bordered"
            AllowPaging="true"
            AllowSorting ="true"
            AutoGenerateColumns="false" 
            DataKeyNames="nama"
            EmptyDataText ="Tidak Ada data"
            PageSize="5" 
            PagerStyle-CssClass="pagination-lg"
            OnSorting="gridDataMahasiswa_OnSorting"
            OnSelectedIndexChanged ="gridDataMahasiswa_SelectedIndexChanged"
            OnPageIndexChanging ="gridDataMahasiswa_PageIndexChanging"
            OnRowCommand="gridDataMahasiswa_RowCommand">
            <Columns>

                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                    <itemTemplate>
                        <%# Container.DataItemIndex +1 %>
                    </itemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="nim" HeaderText ="NIM " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="judul"/>
                <asp:BoundField DataField="nama" HeaderText ="Nama " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="tempatlahir" HeaderText ="Tahun " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="tgl_lahir" HeaderText ="Tanggal Lahir " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="prodi" HeaderText ="Prodi " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="alamat" HeaderText ="Alamat " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="email" HeaderText ="Email " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="nohp" HeaderText ="No hp " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>

                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                         <itemTemplate>
                            <asp:LinkButton runat="server" ID="lnkEdit" CommandName="Ubah" CommandArgument ='<%# DataBinder.Eval(Container, "RowIndex")%>'
                            ToolTip="Ubah"><span class="btn btn-warning btn-circle btn-sm" aria-hidden="true"></span></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Delete" CommandArgument ='<%# DataBinder.Eval(Container, "RowIndex")%>'
                            ToolTip="Delete Data"><span class="btn btn-warning btn-circle btn-sm" aria-hidden="true"></span></asp:LinkButton>
                        </itemTemplate>
                    </asp:TemplateField>
           </Columns>
           </asp:gridView>
       
       </div>  	
     </div>  
 </div>  
 </div>  
</form>
</asp:Content>

