<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="message.aspx.cs" Inherits="admin_message" %>

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
                                MESSAGE TABLE
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
                   
                   
                    <th>Message</th>
                    <th>Contactno</th>
                    <th>Delete</th>
                    <th>Update</th>                 
               
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptmsg" runat="server" onitemcommand="rptmsg_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("message") %> </td>
                   <td> <%# Eval("contactno") %> </td>
                   <td> <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("msgid") %>' /> </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("msgid") %>' /> </td>
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
                 <label>Message</label><span style="color:red">*</span>
                 <asp:TextBox ID="txtmsg" class="form-control" runat="server" CausesValidation="True" TextMode="MultiLine" BorderColor="Black" BorderStyle="Solid" BorderWidth="1"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rqfmsg" runat="server" 
                     ErrorMessage="Please Enter Message " ControlToValidate="txtmsg" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpmsg"></asp:RequiredFieldValidator>
          
              </div>

              <div class="input-field">
                 <label>Contact No</label><span style="color:red">*</span>
                 <asp:TextBox ID="txtconno" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="rgexpcon" runat="server" 
                 ErrorMessage="Please Enter Valid Contact No" ValidationExpression="\d{10}" 
                 SetFocusOnError="True" ControlToValidate="txtconno" Display="Dynamic" ValidationGroup="grpmsg"></asp:RegularExpressionValidator>

              </div>

            

             <br />
                 <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click" ValidationGroup="grpmsg" />&nbsp;&nbsp;
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

