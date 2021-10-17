<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="img.aspx.cs" Inherits="admin_img" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


            <div class="block-header">
              
            </div>
            
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               images TABLE
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                 <li>
                             <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="INSERT NEW RECORD" 
                                      onclick="btnnew_Click" />
                            
                            </li>
                            </ul>
                        </div>

                       

                        <div class="body">
                   <asp:Panel ID="pnlshow" runat="server">
                <div class="table-responsive">

                                  
              <table class="table table-bordered table-striped table-hover js-basic-example dataTable" id="dataTables-example" >
                               
               <thead>
                <tr> 
                   
                    <th>ID</th>
                    <th>imges</th>
                    <th>Delete</th>
                                   
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptimg" runat="server" onitemcommand="rptimg_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("id") %> </td>
                   <td> <%# Eval("img") %> </td>
                 
                  
                   <td>  <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("id") %>' />
                
                    </td>
                 
              </tr>
              </ItemTemplate>
             </asp:Repeater>
             </tbody>
             <tfoot>
             
             </tfoot>
            </table>
          </div>
         
         </asp:Panel>
         <asp:Panel ID="pnlform" runat="server" Visible="False">
         <div class="row">
               <div class="col-md-3"></div>
             <div class="col-md-6">
             </div>
           </div>
           <div class="row">
             <div class="col-md-3"></div>
             <div class="col-md-6">
             

               <div class="input-field">
                 <label>Imges</label>
                   <asp:FileUpload ID="Fupimg" runat="server" />
              </div>

           
            <br />
           
                <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click"  ValidationGroup="grpbloodbank"/>
            &nbsp; &nbsp;
                 <asp:Button ID="btncancel" class="btn btn-danger" runat="server" Text="Cancel" 
                     onclick="btncancel_Click" />
                
            </div>
               <h3>
                   <asp:Label ID="lbltitle" runat="server" Text=" "></asp:Label>
               </h3>
            </div>
           
        </asp:Panel>

                              
                            </div>
                        </div>
                    </div>
                </div>


</asp:Content>

