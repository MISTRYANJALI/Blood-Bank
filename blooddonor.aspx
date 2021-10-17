<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="blooddonor.aspx.cs" Inherits="admin_blooddonor" %>

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
  <div class="block-header">
              
            </div>
            
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                BLOOD DONOR TABLE
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
                <div class="table-responsive"">


                <table class="table table-bordered table-striped table-hover js-basic-example dataTable" id="dataTables-example" >

                               
               <thead>
                <tr> 
                   
                    <th>Blood Group Name</th>
                    <th>Quantity</th>
                    <th>Unit</th>
                    <th>Himoglobin</th>
                    <th>Pressure</th> 
                    <th>weight</th> 
                    <th>Color</th>
                    <th>Last Donate </th>
                    <th>Delete </th>
                    <th>Update</th>   
                    
                                   
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptblooddonor" runat="server" onitemcommand="rptblooddonor_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("bloodgrpname") %> </td>
                   <td> <%# Eval("qty") %> </td>
                   <td> <%# Eval("unit") %> </td>
                   <td> <%# Eval("himoglobin") %> </td>
                   <td> <%# Eval("pressure") %> </td>
                   <td> <%# Eval("weight") %> </td>
                   <td> <%# Eval("color") %> </td>
                    <td> <%# Eval("lastdonate","{0:dd/MM/yyyy}") %> </td>
                   <td>  <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("bdonorid") %>' />
                
                    </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("bdonorid") %>' /> </td>
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
               <h3>  <asp:Label ID="lbltitle" runat="server" Text=" "></asp:Label></h3>
             </div>
           </div>
          <div class="row">
             <div class="col-md-3"></div>
             <div class="col-md-6">
             

              <div class="input-field">
                 <label>Blood Group Name </label><span style="color:red">*</span>
                  <asp:DropDownList ID="ddbldgrpid" runat="server" class="form-control" Width="100px">
                  </asp:DropDownList>

                

                 <asp:RequiredFieldValidator ID="rqrbldgrp" runat="server" 
                     ErrorMessage="Please Enter Bank Name " ControlToValidate="ddbldgrpid" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          
              </div>

              <div class="input-field">
                 <label>Quantity</label><span style="color:red">*</span>
                 <asp:TextBox ID="txtqty" class="form-control" runat="server" 
                      TextMode="MultiLine" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rqrqty" runat="server" 
                     ErrorMessage="Please Enter Quantity " ControlToValidate="txtqty" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpblooddonor"></asp:RequiredFieldValidator>
          
              </div>
             
              <div class="input-field" >
                 <label>Unit</label>
                  <asp:TextBox ID="txtunit" runat="server" class="form-control"></asp:TextBox>

                   <asp:RequiredFieldValidator ID="rqrunit" runat="server" 
                     ErrorMessage="Please Enter unit " ControlToValidate="txtunit" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpblooddonor"></asp:RequiredFieldValidator>
          
                   </div>
               
               <div class="input-field">
                 <label>Himoglobin</label>
                 <asp:TextBox ID="txthim" class="form-control" runat="server"></asp:TextBox>
                  

              </div>

               <div class="input-field">
                 <label>Pressure</label>
                 <asp:TextBox ID="txtprs" class="form-control" runat="server"></asp:TextBox>
                  
              </div>

               <div class="input-field">
                 <label>Weight</label>
                 <asp:TextBox ID="txtweight" class="form-control" runat="server"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>Color</label>
                 <asp:TextBox ID="txtcolor" class="form-control" runat="server"></asp:TextBox>
              </div>

              <div class="input-field">
                 <label>Last Donate</label>
                 <asp:TextBox ID="txtlastdonate" class="form-control" runat="server" Textmode="Date"></asp:TextBox>
              </div>
          
          
          <br />
                 <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click"  ValidationGroup="grpblooddonor"/>
            &nbsp;&nbsp;
                 <asp:Button ID="btncancel" class="btn btn-danger" runat="server" Text="Cancel" 
                     onclick="btncancel_Click" />

                           
            </div>
            </div>
           
             
        </asp:Panel>

                              
                            </div>
                        </div>
                    </div>
                </div>


</asp:Content>

