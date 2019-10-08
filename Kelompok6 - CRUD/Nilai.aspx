<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Nilai.aspx.cs" Inherits="Nilai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Nilai
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
     <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
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
                        <h3 class="text-themecolor m-b-0 m-t-0">View Nilai</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                            <li class="breadcrumb-item active">Nilai</li>
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
                                        <asp:LinkButton runat="server" ID="btn_tambah" CssClass="btn waves-effect waves-light btn-danger pull-left hidden-sm-down" OnClick="btn_tambah_Click"><span class="mdi mdi-plus"></span>Tambah</asp:LinkButton>
                                  </div>

                                <div class="col-md-10 col-4 align-right">
                                    <div class="form-group pull-right">
                                         <asp:Button ID="btnCari" runat="server" CssClass="btn btn-primary" style="height:38px" Text="Cari" OnClick="btnCari_Click"/>
                                           
                                    </div>
                                </div>
                                
                                <div class="col-md-10 col-4 align-self-right">
                                    <div class="form-group pull-right ">
                                       <asp:TextBox CssClass="form-control form-control-md" runat="server" ID="txtcariMatkul" OnTextChanged="txtcariMatkul_TextChanged"/>
                                    </div>
                                </div>
                                <div class="table-responsive">
                    <asp:GridView ID="gridNilai" runat="server" CssClass="table" AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="nim,id_matkul" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" PagerStyle-CssClass="pagination" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridNilai_PageIndexChanging"
                    OnRowCommand="gridNilai_RowCommand" OnSorting="gridNilai_Sorting" OnSelectedIndexChanged="gridNilai_SelectedIndexChanged">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="uts" HeaderText="UTS"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="uts" />
                        <asp:BoundField DataField="uas" HeaderText="UAS"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="uas" />
                        <asp:BoundField DataField="tugas" HeaderText="TUGAS"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="tugas" />
                       <asp:BoundField DataField="nilai_total" HeaderText="Total"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="nilai_total" />
                        <asp:BoundField DataField="status" HeaderText="Status"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="status" />
                        
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
                        <h3 class="text-themecolor m-b-0 m-t-0">Edit Nilai</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                            <li class="breadcrumb-item active">Mata Nilai</li>
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
                                        <asp:Label ID="lblIDEdit" Visible="false" runat="server"></asp:Label>
                                        <label class="col-md-12">UTS
                                        <asp:RequiredFieldValidator ID="valEditUts" ControlToValidate="txtEdituts" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valEdit"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtEdituts" runat="server" type="number" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                   <div class="form-group">
                                        
                                        <label class="col-md-12">UAS
                                        <asp:RequiredFieldValidator ID="valEditUas" ControlToValidate="txtEdituas" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valEdit"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtEdituas" runat="server" type="number" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                <div class="form-group">
                                        
                                        <label class="col-md-12">Tugas
                                        <asp:RequiredFieldValidator ID="valEdittugas" ControlToValidate="txtEdittugas" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valEdit"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtEdittugas" runat="server" type="number" CssClass="form-control form-control-line"/>
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
                        <h3 class="text-themecolor m-b-0 m-t-0">Add Nilai</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                            <li class="breadcrumb-item active">Nilai</li>
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
                                        <asp:RequiredFieldValidator ID="valNim" ControlToValidate="ddlnim" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:DropDownList ID="ddlnim" runat="server" CssClass="form-control form-control-line">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                 <div class="form-group">
                                        <label class="col-md-12">ID Matkul
                                        <asp:RequiredFieldValidator ID="valIDMatkul" ControlToValidate="ddlid_matkul" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:DropDownList ID="ddlid_matkul" runat="server" CssClass="form-control form-control-line">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                 <div class="form-group">
                                        
                                        <label class="col-md-12">UTS
                                        <asp:RequiredFieldValidator ID="valuts" ControlToValidate="txtuts" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtuts" runat="server" type="number" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        
                                        <label class="col-md-12">UAS
                                        <asp:RequiredFieldValidator ID="valuas" ControlToValidate="txtuas" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtuas" runat="server" type="number" CssClass="form-control form-control-line"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        
                                        <label class="col-md-12">Tugas
                                        <asp:RequiredFieldValidator ID="valtugas" ControlToValidate="txttugas" Display="Dynamic" ForeColor="Red"
                                            runat="server" Text="*" SetFocusOnError="true" ValidationGroup="valAdd"></asp:RequiredFieldValidator></label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txttugas" runat="server" type="number" CssClass="form-control form-control-line"/>
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

