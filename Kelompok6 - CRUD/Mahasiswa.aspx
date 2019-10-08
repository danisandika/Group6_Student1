<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Mahasiswa.aspx.cs" Inherits="Mahasiswa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Mahasiswa
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .Hide
    {
        display: none;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" name="form1">
     <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid" runat="server" id="divView"> 
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">View Mahasiswa</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                            <li class="breadcrumb-item active">Mahasiswa</li>
                        </ol>
                    </div>
                    
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-block">
                                  <div class="col-md-7 col-4 align-self-left">
                                        <asp:LinkButton runat="server" ID="btn_tambah" CssClass="btn waves-effect waves-light btn-danger pull-left hidden-sm-down" OnClick="btn_tambah_Click1"><span class="mdi mdi-plus"></span>Tambah</asp:LinkButton>
                                  </div>

                                <div class="col-md-10 col-4 align-right">
                                    <div class="form-group pull-right">
                                         <asp:Button ID="btnCari" runat="server" CssClass="btn btn-primary" style="height:38px" Text="Cari" OnClick="btnCari_Click"/>
                                           
                                    </div>
                                </div>
                                
                                <div class="col-md-10 col-4 align-self-right">
                                    <div class="form-group pull-right ">
                                       <asp:TextBox CssClass="form-control form-control-md" runat="server" ID="txtcariMahasiswa" OnTextChanged="txtcariMahasiswa_TextChanged"/>
                                    </div>
                                </div>
                                <div class="table-responsive">
                    <asp:GridView ID="gridMahasiswa" runat="server" CssClass="table" AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="nim" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" PagerStyle-CssClass="pagination" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridMahasiswa_PageIndexChanging"
                    OnRowCommand="gridMahasiswa_RowCommand" OnSorting="gridMahasiswa_Sorting" OnSelectedIndexChanged="gridMahasiswa_SelectedIndexChanged">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="nama" HeaderText="Nama Mahasiswa"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="nama" />
                        <asp:BoundField DataField="tmp_lahir" HeaderText="Tempat" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"/>
                        <asp:BoundField DataField="tgl_lahir" HeaderText="Tanggal" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"/>
                        <asp:BoundField DataField="prodi" HeaderText="Program Studi" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="prodi" />
                        <asp:BoundField DataField="alamat" HeaderText="Alamat" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="alamat" />
                        <asp:BoundField DataField="email" HeaderText="Email" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"/>
                        <asp:BoundField DataField="nohp" HeaderText="Nohp" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"/>
                        
                        <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="mdi mdi-feather" aria-hidden="true">Edit</span>
                                </asp:LinkButton>
                                |
                                <asp:LinkButton runat="server" ID="linkDelete" CommandName="cmHapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Hapus Data"><span class="mdi mdi-delete" aria-hidden="true">Hapus</span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->

            <div class="container-fluid" runat="server" id="divEdit"> 
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">Edit Mahasiswa</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                            <li class="breadcrumb-item active">Mahasiswa</li>
                        </ol>
                    </div>
                    
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-block">
                                  <div class="form-group">
                                        <asp:Label ID="lblNIMEdit" Visible="false" runat="server"></asp:Label>
                                        <label class="col-md-12">Nama
                                        <asp:RequiredFieldValidator ID="valEditNama" ControlToValidate="txtEditNama" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valEdit"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtEditNama" runat="server" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                        <label class="col-md-12">Tempat Lahir
                                        <asp:RequiredFieldValidator ID="valEdittmp_Lahir" ControlToValidate="txtEdittmp_Lahir" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valEdit"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtEdittmp_Lahir" runat="server" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                        <label class="col-md-12">Tanggal Lahir
                                            <asp:RequiredFieldValidator ID="valEdittgl_lahir" ControlToValidate="txtEdittgl_Lahir" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valEdit"></asp:RequiredFieldValidator>
                                        </label>
                                       
                                        <div class="col-md-12">
                                            <asp:TextBox  ID="txtEdittgl_lahir" type="date" runat="server" CssClass="form-control form-control-line" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Program Studi
                                        <asp:RequiredFieldValidator ID="valEditdllProdi" ControlToValidate="ddlEditProdi" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valEdit"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:DropDownList ID="ddlEditProdi" runat="server" CssClass="form-control form-control-line">
                                                <asp:ListItem Value="Sistem Informasi" Text="Sistem Informasi"/>
                                                <asp:ListItem Value="Teknologi Manufaktur" Text="Teknologi Manufaktur"/>
                                                <asp:ListItem Value="P4" Text="P4"/>
                                                <asp:ListItem Value="Mekatronika" Text="Mekatronika"/>
                                                <asp:ListItem Value="TKBG" Text="TKBG"/>
                                                <asp:ListItem Value="PMO" Text="PMO"/>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                   <div class="form-group">
                                       
                                        <label class="col-md-12">Alamat
                                        <asp:RequiredFieldValidator ID="valEditAlamat" ControlToValidate="txtEditAlamat" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valEdit"></asp:RequiredFieldValidator>
                                            </label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtEditAlamat" TextMode="MultiLine" runat="server" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                        <label class="col-md-12">Email
                                        <asp:RequiredFieldValidator ID="valEditEmail" ControlToValidate="txtEditEmail" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valEdit"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="valRegEditemail" runat="server"
                                                     ErrorMessage="Format Email Salah" ControlToValidate="txtEditemail"
                                                     SetFocusOnError="True"  Display="Dynamic" ForeColor="Red" ValidationGroup="valEdit"
                                                     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>

                                        </label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtEditemail" runat="server" type="email" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                        <label class="col-md-12">No.Hp</label>
                                        <asp:RequiredFieldValidator ID="valEditnohp" ControlToValidate="txtEditnohp" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valEdit"></asp:RequiredFieldValidator>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtEditnohp" type="number" runat="server" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <asp:button CssClass="btn btn-success" Text="Save" ID="btnSaveEdit" OnClick="btnSaveEdit_Click" runat="server" ValidationGroup="valEdit"/>
                                            <asp:button CssClass="btn btn-danger" Text="Cancel" ID="btnCancelEdit" OnClick="btnCancelEdit_Click" runat="server" ValidationGroup="valEdit"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




        <div class="container-fluid" runat="server" id="divAdd"> 
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">Add Mahasiswa</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                            <li class="breadcrumb-item active">Mahasiswa</li>
                        </ol>
                    </div>
                    
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-block">
                                 <div class="form-group">
                                        <label class="col-md-12">NIM
                                        <asp:RequiredFieldValidator ID="valNIM" ControlToValidate="txtnim" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtnim" runat="server" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                  <div class="form-group">
                                        <label class="col-md-12">Nama
                                        <asp:RequiredFieldValidator ID="valNama" ControlToValidate="txtnama" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtnama" runat="server" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                        <label class="col-md-12">Tempat Lahir
                                        <asp:RequiredFieldValidator ID="valtmp_lahir" ControlToValidate="txttmp_Lahir" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txttmp_Lahir" runat="server" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                        <label class="col-md-12">Tanggal Lahir
                                            <asp:RequiredFieldValidator ID="valtxttgl_lahir" ControlToValidate="txttgl_Lahir" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator>
                                        </label>
                                       
                                        <div class="col-md-12">
                                            <asp:TextBox  ID="txttgl_lahir" type="date" runat="server" CssClass="form-control form-control-line" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Program Studi
                                        <asp:RequiredFieldValidator ID="valddlProdi" ControlToValidate="ddlProdi" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:DropDownList ID="ddlProdi" runat="server" CssClass="form-control form-control-line">
                                                <asp:ListItem Value="Sistem Informasi" Text="Sistem Informasi"/>
                                                <asp:ListItem Value="Teknologi Manufaktur" Text="Teknologi Manufaktur"/>
                                                <asp:ListItem Value="P4" Text="P4"/>
                                                <asp:ListItem Value="Mekatronika" Text="Mekatronika"/>
                                                <asp:ListItem Value="TKBG" Text="TKBG"/>
                                                <asp:ListItem Value="PMO" Text="PMO"/>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                   <div class="form-group">
                                       
                                        <label class="col-md-12">Alamat
                                        <asp:RequiredFieldValidator ID="valalamat" ControlToValidate="txtAlamat" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator>
                                            </label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtAlamat" TextMode="MultiLine" runat="server" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                        <label class="col-md-12">Email
                                        <asp:RequiredFieldValidator ID="valemail" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="valRegemail" runat="server"
                                                     ErrorMessage="Format Email Salah" ControlToValidate="txtemail"
                                                     SetFocusOnError="True"  Display="Dynamic" ForeColor="Red" ValidationGroup="valAdd"
                                                     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>

                                        </label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtemail" runat="server" type="email" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                        <label class="col-md-12">No.Hp</label>
                                        <asp:RequiredFieldValidator ID="valnohp" ControlToValidate="txtnohp" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtnohp" type="number" runat="server" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <asp:button CssClass="btn btn-success" Text="Save" ID="btn_simpan" OnClick="btn_simpan_Click" runat="server" ValidationGroup="valAdd"/>
                                            <asp:button CssClass="btn btn-danger" Text="Cancel" ID="btn_cancel" OnClick="btn_cancel_Click" runat="server" ValidationGroup="valAdd"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </form>
</asp:Content>

