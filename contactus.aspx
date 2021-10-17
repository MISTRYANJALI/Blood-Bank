<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="admin_contactus" %>

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
                                CONTACT US TABLE
                            </h2>
                            <ul class="header-dropdown m-r--5">
                
                            </ul>
                        </div>

                       

                        <div class="body">
                   <asp:Panel ID="pnlshow" runat="server">
                <div class="table-responsive">

            
                             
              <table class="table table-bordered table-striped table-hover js-basic-example dataTable" id="dataTables-example" >
                               
               <thead>
                <tr> 
                   
                    <th>Name</th>
                    <th>Email Id</th>
                    <th>Subject</th>
                    <th>Meassage</th>
                    <th>Status</th> 
                                 
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptcon" runat="server" onitemcommand="rptcon_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("name") %> </td>
                   <td> <%# Eval("emailid") %> </td>
                   <td> <%# Eval("subject") %> </td>
                   <td> <%# Eval("message") %> </td>
                   <td>  <asp:Button ID="btnstatus" class="btn btn-danger" runat="server" Text="STATUS"   CommandArgument='<%# Eval("contactid") %>' />
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
         

                              
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>

