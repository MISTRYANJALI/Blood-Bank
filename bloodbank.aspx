<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="bloodbank.aspx.cs" Inherits="admin_bloodbank" %>

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
                                BLOOD BANK TABLE
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
                   
                    <th>Blood Bank Name</th>
                    <th>Address</th>
                    <th>City Name</th>
                    <th>Contactno</th>
                    <th>Email</th> 
                    <th>Head</th> 
                    <th>Bank Type</th>
                    <th>Delete </th>
                    <th>Update</th>                 
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptbloodbank" runat="server" onitemcommand="rptbloodbank_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("bankname") %> </td>
                   <td> <%# Eval("address") %> </td>
                   <td> <%# Eval("cityname") %> </td>
                   <td> <%# Eval("contactno") %> </td>
                   <td> <%# Eval("email") %> </td>
                   <td> <%# Eval("head") %> </td>
                   <td> <%# Eval("banktype") %> </td> 
                  
                   <td>  <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("bankid") %>' />
                
                    </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("bankid") %>' /> </td>
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
                 <label>Bank Name </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtbnkname" class="form-control" runat="server"></asp:TextBox>

                 <asp:CustomValidator ID="custname" runat="server" 
                      ErrorMessage="only enter alphabets" ClientValidationFunction="onlyalpha" 
                      ControlToValidate="txtbnkname" Display="Dynamic"  ForeColor="Red"></asp:CustomValidator>

                 <asp:RequiredFieldValidator ID="rqrbankname" runat="server" 
                     ErrorMessage="Please Enter Bank Name " ControlToValidate="txtbnkname" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          
              </div>

              <div class="input-field">
                 <label>Address</label><span style="color:red">*</span>
                 <asp:TextBox ID="txtbnkadd" class="form-control" runat="server" 
                      TextMode="MultiLine" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rqraddress" runat="server" 
                     ErrorMessage="Please Enter Address " ControlToValidate="txtbnkadd" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpbloodbank"></asp:RequiredFieldValidator>
          
              </div>
             
              <div class="input-field" >
                 <label>City Name</label>
                  <asp:DropDownList ID="ddcityname" runat="server" class="form-control" Width="100px">
                  </asp:DropDownList>
                   </div>
               
               <div class="input-field">
                 <label>Contact No</label><span style="color:red">*</span>
                 <asp:TextBox ID="txtconno" class="form-control" runat="server"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="rgexpcon" runat="server" ErrorMessage="Please Enter Valid Contact No" ValidationExpression="\d{10}" SetFocusOnError="True" ControlToValidate="txtconno" Display="Dynamic" ValidationGroup="grpbloodbank"  ForeColor="Red"></asp:RegularExpressionValidator>

              </div>

               <div class="input-field">
                 <label>Email</label><span style="color:red">*</span>
                 <asp:TextBox ID="txtemail" class="form-control" runat="server"></asp:TextBox>
                   <asp:CustomValidator ID="custemail" runat="server" setfocusonerror="true"
                      ErrorMessage="only enter alphabets" ClientValidationFunction="checkemail" 
                      ControlToValidate="txtemail" Display="Dynamic"  ForeColor="Red"></asp:CustomValidator>

               <%--   <asp:RegularExpressionValidator ID="regexpemail" runat="server" 
                    ErrorMessage="Enter Valid Email " ControlToValidate="txtemail" 
                    Display="Dynamic" SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            --%>
                
              </div>

               <div class="input-field">
                 <label>Head</label>
                 <asp:TextBox ID="txthead" class="form-control" runat="server"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>Bank Type</label>
                 <asp:TextBox ID="txtbnktype" class="form-control" runat="server"></asp:TextBox>
              </div>

           
            <br />
           
                <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click"  ValidationGroup="grpbloodbank"/>
            &nbsp; &nbsp;
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

