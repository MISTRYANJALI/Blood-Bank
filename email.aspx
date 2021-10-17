<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="email.aspx.cs" Inherits="admin_email" %>

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
            <!-- Basic Examples -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                EMAIL TABLE
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

            
                             
              <table class="table table-bordered table-striped table-hover js-basic-example dataTable" id="dataTables-example">
                               
               <thead>
                <tr> 
                    
                    <th>Email From</th>
                    <th>Email to</th>
                    <th>Subject</th>
                    <th>Description</th> 
                   
                    <th>Delete</th>
                    <th>Update</th>                 
                  
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptemail" runat="server" onitemcommand="rptemail_ItemCommand">
              <ItemTemplate>
               <tr> 
                   <td> <%# Eval("emailfrom") %> </td>
                   <td> <%# Eval("emailto") %> </td>
                   <td> <%# Eval("subject") %> </td>
                   <td> <%# Eval("description") %> </td>
                  
                   <td> <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("emailid") %>' /> </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("emailid") %>' /> </td>
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
             <div class="col-md-12">
               <h3>  <asp:Label ID="lbltitle" runat="server" Text=" "></asp:Label></h3>
             </div>
           </div>
           <div class="row">
             <div class="col-md-12">
               <div class="input-field">
                

            

              <div class="input-field">
                 <label>Email From </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtemailfrom" class="form-control" runat="server" 
                      CausesValidation="True" TextMode="Email"></asp:TextBox>
                 
                  <asp:RegularExpressionValidator ID="regexpemail" runat="server" 
                    ErrorMessage="Enter Valid Email From" ControlToValidate="txtemailfrom" 
                    Display="Dynamic" SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="grpemail" ></asp:RegularExpressionValidator>
            
              </div>

              <div class="input-field">
                 <label>Email To </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtemailto" class="form-control" runat="server" TextMode="Email"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="regexpemailto" runat="server" 
                    ErrorMessage="Enter Valid Email To" ControlToValidate="txtemailto" 
                    Display="Dynamic" SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="grpemail" ></asp:RegularExpressionValidator>
            
              </div>

               <div class="input-field">
                 <label>subject</label>
                 <asp:TextBox ID="txtsub" class="form-control" runat="server"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>Description *</label>
                 <asp:TextBox ID="txtdescr" class="form-control" runat="server" 
                       TextMode="MultiLine" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rqdescrp" runat="server" 
                     ErrorMessage="Please Enter Description " ControlToValidate="txtdescr" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"  ValidationGroup="grpemail" ></asp:RequiredFieldValidator>
          

              </div>

            
             </div>
           </div>
        </div>
           <div class="row">
             <div class="col-md-12">
                 <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click" ValidationGroup="grpemail" />
                 <asp:Button ID="btncancel" class="btn btn-danger" runat="server" Text="Cancel" 
                     onclick="btncancel_Click" />
             </div>
           </div>
        </asp:Panel>

                               
                            </div>
                        </div>
                    </div>
                </div>
           
            <!-- #END# Basic Examples -->

</asp:Content>

