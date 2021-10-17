<%@ Page Title="" Language="C#" MasterPageFile="~/donor/donormaster.master" AutoEventWireup="true" CodeFile="history.aspx.cs" Inherits="donor_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="block-header" >
              
            </div>

          
         <div id="about"> 
         
        <div class="container-fluid" >
            <div class="row">
                <div class="col-md-12">
                   
                        <div class="header">
                            <h2><br />
                                BLOOD DONOR HISTORY<br />
                            </h2>
                            <ul class="header-dropdown m-r--5">
                         
                            </ul>
                        </div>

                       

                 <div class="body" >
                   <asp:Panel ID="pnlshow" runat="server">
                <div class="table-responsive">

            
                             
              <table class="table table-bordered table-striped table-hover js-basic-example dataTable" id="dataTables-example" >
                               
               <thead>
                <tr> 
                   
                    <th style="color:white">Blood Group</th>
                    <th style="color:white">Quantity </th>
                    <th style="color:white">Unit </th>
                   <th style="color:white">Himoglobin </th>
                   <th style="color:white">Pressure </th>
                   <th style="color:white">Weight </th>
                   <th style="color:white">Color </th>
                   <th style="color:white">Last Donate</th>
                   
                   
                   
                                   
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptblooddonor" runat="server" onitemcommand="rptblooddonor_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   
                   <td style="color:white"> <%# Eval("bloodgrpname") %> </td>
                   <td style="color:white"> <%# Eval("qty") %> </td>
                   <td style="color:white"> <%# Eval("unit") %> </td>
                   <td style="color:white"> <%# Eval("himoglobin") %> </td>
                   <td style="color:white"> <%# Eval("pressure") %> </td>
                   <td style="color:white"> <%# Eval("weight") %> </td>
                   <td style="color:white"> <%# Eval("color") %> </td>
                   <td style="color:white"> <%# Eval("lastdonate" , "{0:dd/MM/yyyy}") %> </td>
                          
                   
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
         </div>




</asp:Content>

