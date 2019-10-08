<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="bukuu.aspx.cs" Inherits="bukuu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
    <div id="ViewBuku" class="row" runat="server">
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
                                    <asp:Button id="cmdOK" runat="server" Text="Search" OnClick="cmdOK_Click"  class="btn btn-primary"/>
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
            ID="gridDataBuku"
            CssClass="table table-bordered"
            AllowPaging="true"
            AllowSorting ="true"
            AutoGenerateColumns="false" 
            DataKeyNames="judul"
            EmptyDataText ="Tidak Ada data"
            PageSize="5" 
            PagerStyle-CssClass="pagination-lg"
            OnSorting="gridDataBuku_OnSorting"
            OnSelectedIndexChanged ="gridDataBuku_SelectedIndexChanged"
            OnPageIndexChanging ="gridDataBuku_PageIndexChanging"
            OnRowCommand="gridDataBuku_RowCommand">
            <Columns>

                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                    <itemTemplate>
                        <%# Container.DataItemIndex +1 %>
                    </itemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="judul" HeaderText ="Judul " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="judul"/>
                <asp:BoundField DataField="pengarang" HeaderText ="Pengarang " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="tahun" HeaderText ="Tahun " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="penerbit" HeaderText ="Penerbit " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="harga" HeaderText ="Harga " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="genre" HeaderText ="Genre " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="email" HeaderText ="Email " NullDisplayText ="-" ItemStyle-HorizontalAlign="Left"/>

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

     <div id="AddBuku" class="row" runat="server">
        <div class="form-group">
        <label>Judul :</label>
        <asp:Label ID="lblId" Visible="false" runat="server"></asp:Label>
        <asp:TextBox
             id="txtJudul"
             runat="server" 
             CssClass="form-control"></asp:TextBox>
            <asp:label id="lbl" text="*" forecolor="Red" runat="server"></asp:label>
            <asp:RequiredFieldValidator 
                id="valladdJudul" 
                controltovalidate="txtJudul"
                runat="server"
                display="Dynamic" 
                forecolor="Red"
                text="Judul Wajib diisi!" 
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        
              <div class="input-group mb-3">
                   <div class="input-group-prepend">
                   <label class="input-group-text" for="inputGroupSelect01">Genre</label>
                   </div>
                   <asp:DropDownList ID="genre" runat="server" class="custom-select"></asp:DropDownList>
            </div>

            <asp:TextBox
             id="txtPenerbit"
             runat="server" 
             CssClass="form-control"></asp:TextBox>
            <asp:label id="lblPenerbit" text="*" forecolor="Red" runat="server"></asp:label>
            <asp:RequiredFieldValidator 
                id="RequiredFieldValidator1" 
                controltovalidate="txtPenerbit"
                runat="server"
                display="Dynamic" 
                forecolor="Red"
                text="Penerbit Wajib diisi!" 
                SetFocusOnError="true"></asp:RequiredFieldValidator>

             <asp:TextBox
             id="txtPengarang"
             runat="server" 
             CssClass="form-control"></asp:TextBox>
            <asp:label id="lblPengarang" text="*" forecolor="Red" runat="server"></asp:label>
            <asp:RequiredFieldValidator 
                id="RequiredFieldValidator2" 
                controltovalidate="txtPengarang"
                runat="server"
                display="Dynamic" 
                forecolor="Red"
                text="Pengarang Wajib diisi!" 
                SetFocusOnError="true"></asp:RequiredFieldValidator>


            <div class="input-group mb-3">
                <div class="input-group-prepend">
                 <span class="input-group-text" id="basic-addon1">Jenis Cetak &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
                    <asp:RadioButtonList ID="rbjcetak" runat="server">
                          <asp:ListItem>Soft Copy</asp:ListItem>
                          <asp:ListItem>hard Copy</asp:ListItem>
                     </asp:RadioButtonList>  
                 </span>                                          
            </div>
         </div>

         <asp:TextBox
             id="txtHarga"
             runat="server" 
             CssClass="form-control"></asp:TextBox>
            <asp:label id="lblHarga" text="*" forecolor="Red" runat="server"></asp:label>
            <asp:RequiredFieldValidator 
                id="RequiredFieldValidator3" 
                controltovalidate="txtHarga"
                runat="server"
                display="Dynamic" 
                forecolor="Red"
                text="Harga Wajib diisi!" 
                SetFocusOnError="true"></asp:RequiredFieldValidator>

         <asp:TextBox
             id="txtEmail"
             runat="server" 
             CssClass="form-control"></asp:TextBox>
            <asp:label id="lblEmail" text="*" forecolor="Red" runat="server"></asp:label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                runat="server" ErrorMessage="*Masukan Email" 
                                ControlToValidate="txtEmail"  ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" 
                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ControlToValidate="txtEmail" 
                                ErrorMessage="*Format Email Salah"  ForeColor="Red">
                                </asp:RegularExpressionValidator>


        <asp:Button ID="btnSubmitEdit" runat="server" Text="Add" CssClass="btn btn-primary" />
        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn btn-primary" />

    </div>
    </div>

     <div id="EditBuku" class="row" runat="server">
        <div class="form-group">
        <label>Nama :</label>
        <asp:Label ID="lblIdEdit" Visible="false" runat="server"></asp:Label>
        <asp:TextBox id="txtEditNama" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:label id="Label3" text="*" forecolor="Red" runat="server"></asp:label>
            <asp:requiredfieldvalidator id="valeditnama" controltovalidate="txtEditNama" runat="server"
                display="Dynamic" forecolor="Red" text="Nama Wajib diisi!" SetFocusOnError="true" ValidationGroup ="valedit"></asp:requiredfieldvalidator>
            </div>
        <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-primary" ValidationGroup="valedit" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-primary" />
       
    </div>
</form>
</asp:Content>

