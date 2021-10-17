<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="doctor.aspx.cs" Inherits="admin_doctor" %>

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
                                DOCTOR TABLE
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
                   
                    <th>NAME</th>
                    <th>Contactno</th>
                    <th>Email</th>
                    <th>Hospital Name</th>
                    <th>Position</th>
                    <th>Photo</th>
                    <th>Qualification</th> 
                    <th>Exp</th>   
                    <th>Delete</th>
                    <th>Update</th>                 
              
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptdoctor" runat="server" onitemcommand="rptdoctor_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("docname") %> </td>
                   <td> <%# Eval("contactno") %> </td>
                   <td> <%# Eval("emailid") %> </td>
                   <td> <%# Eval("hospitalname") %> </td>
                   <td> <%# Eval("position") %> </td>
                   <td> <%# Eval("photo") %> </td>
                   <td> <%# Eval("qualification") %> </td>
                   <td> <%# Eval("exp") %> </td>
                   <td> <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("docid") %>' /> </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("docid") %>' /> </td>
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
                

              <div class="input-field">
                 <label>Doctor Name *</label>
                 <asp:TextBox ID="txtdocname" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                  

                  <asp:RequiredFieldValidator ID="rqdocname" runat="server" 
                     ErrorMessage="Please Enter Docter name " ControlToValidate="txtdocname" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpdoctor"></asp:RequiredFieldValidator>
          
              </div>


              <div class="input-field">
                 <label>Contact No *</label>
                 <asp:TextBox ID="txtconno" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="rgexpcon" runat="server" ErrorMessage="Please Enter Valid Contact No" ValidationExpression="\d{10}"
                   SetFocusOnError="True" ControlToValidate="txtconno" Display="Dynamic" ValidationGroup="grpdoctor"></asp:RegularExpressionValidator>

              </div>

               <div class="input-field">
                 <label>Email Id</label>
                 <asp:TextBox ID="txtemailid" class="form-control" runat="server" CausesValidation="True" TextMode="Email"></asp:TextBox>
                  
                  <asp:RegularExpressionValidator ID="regexpemail" runat="server" 
                    ErrorMessage="Enter Valid Email " ControlToValidate="txtemailid" 
                    Display="Dynamic" SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            

                 
          
              </div>


              <div class="input-field">
                 <label>Hospital Name</label>
                  <asp:DropDownList ID="ddhospt" runat="server" class="form-control" Width="100px">
                  </asp:DropDownList>
              </div>

              <div class="input-field">
                 <label>Position</label>
                 <asp:TextBox ID="txtposi" class="form-control" runat="server"></asp:TextBox>
              </div>

            
               <div class="input-field">
                 <label>Photo</label>
                   <asp:FileUpload ID="fupphoto" runat="server" class="form-control" />
                  </div>

               <div class="input-field">
                 <label>Qualification *</label>
                 <asp:TextBox ID="txtqua" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>

                  <asp:RequiredFieldValidator ID="rqfqual" runat="server" 
                     ErrorMessage="Please Enter Qualification " ControlToValidate="txtqua" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpdoctor"></asp:RequiredFieldValidator>
          
              </div>

               <div class="input-field">
                 <label>Exp</label>
                 <asp:TextBox ID="txtexp" class="form-control" runat="server"></asp:TextBox>
              </div>


           <br />
                 <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click" ValidationGroup="grpdoctor" />&nbsp;&nbsp;
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

