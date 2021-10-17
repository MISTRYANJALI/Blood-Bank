<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="pickupdetail.aspx.cs" Inherits="admin_pickupdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <style type="text/css">
 
 input[type=text]
 {
   border:1px solid black!important;
 } 

 
</style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


            <div class="block-header">
              
            </div>
            
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                PICKUP TABLE
                            </h2>
                        </div>

                       

                        <div class="body">
                    <asp:Panel ID="pnlshow" runat="server">
                <div class="table-responsive">

                                  
              <table class="table table-bordered table-striped table-hover js-basic-example dataTable" id="dataTables-example" >
                               
               <thead>
                <tr> 
                  <th>ID</th>
                    <th>DATE</th>
                     <th>REG ID</th> 
                     <th>ADDRESS</th>
                     <th>CITYID</th>
                     <th>LANDMARK</th>
                    <th>BLOODGR ID</th>   
                    <th>QTY</th>
                    <th>PICKUP TIME</th> 
                    <th>STATUS</th> 
                    <th>DELETE</th>           
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptpickupdetail" runat="server" onitemcommand="rptbloodbank_ItemCommand">
              <ItemTemplate>
               <tr> 
                   <td> <%# Eval("pickupid") %> </td>
                   <td> <%# Eval("pickupdate") %> </td>
                   <td> <%# Eval("regid") %> </td>
                   <td> <%# Eval("address") %> </td>
                   <td> <%# Eval("cityname") %> </td>
                   <td> <%# Eval("landmark") %> </td>
                    <td> <%# Eval("bloodgrpname") %> </td>
                    <td> <%# Eval("qty") %> </td>
                    <td> <%# Eval("pickuptime") %> </td>
                    <td> <%# Eval("status") %> </td>
                   
                  
                   <td>  <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("pickupid") %>' />
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

