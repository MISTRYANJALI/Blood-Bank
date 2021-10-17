<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="hospital.aspx.cs" Inherits="admin_hospital" %>

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
                                HOSPITAL TABLE
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
                    <th>Address</th>
                    <th>City Name</th>
                    <th>Contactno</th>
                    <th>Email</th> 
                    <th>Hospital Name</th> 
                    <th>Trust</th> 
                    <th>Delete</th>
                    <th>Update</th>                 
                
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rpthospital" runat="server" onitemcommand="rpthospital_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("hospitalname") %> </td>
                   <td> <%# Eval("address") %> </td>
                   <td> <%# Eval("cityname") %> </td>
                   <td> <%# Eval("contactno") %> </td>
                   <td> <%# Eval("email") %> </td>
                   <td> <%# Eval("hospitaltype") %> </td>
                   <td> <%# Eval("trust") %> </td>
                   <td> <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("hospitalid") %>' /> </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("hospitalid") %>' /> </td>
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
                 <label>Hospital Name </label><span style="color:red">*</span>
                 <asp:TextBox ID="txthosname" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>

                  <asp:RequiredFieldValidator ID="rqhosname" runat="server" 
                     ErrorMessage="Please Enter Hospital Name " ControlToValidate="txthosname" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grphos"></asp:RequiredFieldValidator>
          
              </div>

              <div class="input-field">
                 <label>Address </label><span style="color:red">*</span>
                 <asp:TextBox ID="txthosadd" class="form-control" runat="server" TextMode="multiline" CausesValidation="True"></asp:TextBox>

                  <asp:RequiredFieldValidator ID="rqhosadd" runat="server" 
                     ErrorMessage="Please Enter Hospital Address " ControlToValidate="txthosadd" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grphos"></asp:RequiredFieldValidator>
          
              </div>

              <div class="input-field">
                 <label>City id</label>
                  <asp:DropDownList ID="ddcityname" runat="server" class="form-control" Width="100px">
                  </asp:DropDownList>
              </div>

               <div class="input-field">
                 <label>Contact No </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtconno" class="form-control" runat="server" CausesValidation="True" ></asp:TextBox>

                  <asp:RegularExpressionValidator ID="rgexpcon" runat="server" ErrorMessage="Please Enter Valid Contact No" ValidationExpression="\d{10}" SetFocusOnError="True" ControlToValidate="txtconno" Display="Dynamic" ValidationGroup="grphos"></asp:RegularExpressionValidator>

              </div>

               <div class="input-field">
                 <label>Email </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtemail" class="form-control" runat="server" CausesValidation="True" TextMode="Email"></asp:TextBox>

                  <asp:RegularExpressionValidator ID="regexpemail" runat="server" 
                    ErrorMessage="Enter Valid Email " ControlToValidate="txtemail" 
                    Display="Dynamic" SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="grphos"></asp:RegularExpressionValidator>
            
              </div>

               <div class="input-field">
                 <label>Hospital Type</label>
                 <asp:TextBox ID="txthostype" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>Trust</label>
                 <asp:TextBox ID="txthostru" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
              </div>


         <br />
                 <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click" ValidationGroup="grphos"/>&nbsp;&nbsp;
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

