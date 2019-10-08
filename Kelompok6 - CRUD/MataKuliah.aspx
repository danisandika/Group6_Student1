<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="MataKuliah.aspx.cs" Inherits="MataKuliah" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Mata Kuliah
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
     <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">Mata Kuliah</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                            <li class="breadcrumb-item active">Mata Kuliah</li>
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
                                        <a href="" class="btn waves-effect waves-light btn-danger pull-left hidden-sm-down"><span class="mdi mdi-plus"></span>Tambah</a>
                                  </div>
                                <div class="col-md-10 col-4 align-right">
                                    <div class="form-group pull-right">
                                         <button class="btn waves-effect waves-light btn-success pull-left hidden-sm-down" type="submit" style="height:38px">
                                            <span class="mdi mdi-search-web"></span> Search
                                         </button>
                                    </div>
                                </div>
                                
                                <div class="col-md-10 col-4 align-self-right">
                                    <div class="form-group pull-right ">
                                       <input type="text" placeholder="Cari..." class="form-control form-control-md">
                                    </div>
                                </div>
                                
                               
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Deshmukh</td>
                                                <td>Prohaska</td>
                                                <td>@Genelia</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Deshmukh</td>
                                                <td>Gaylord</td>
                                                <td>@Ritesh</td>
                                            </tr>
                                            </table>
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
</asp:Content>

