<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="camp.aspx.cs" Inherits="admin_camp" %>

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
                                CAMP TABLE
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
                   
                    <th>Camp Date</th>
                    <th>Camp Name</th>
                    <th>Location</th>
                    <th>City Name</th>
                    <th>Organizer</th> 
                    <th>Time</th> 
                    <th>Purpose</th>  
                    <th>Donate by</th>  
                    <th>Delete</th>
                    <th>Update</th>                 
              
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptcamp" runat="server" onitemcommand="rptcamp_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("campdate","{0:dd/MM/yyyy}") %> </td>
                   <td> <%# Eval("campname") %> </td>
                   <td> <%# Eval("location") %> </td>
                   <td> <%# Eval("cityname") %> </td>
                   <td> <%# Eval("organizer") %> </td>
                   <td> <%# Eval("time") %> </td>
                   <td> <%# Eval("purpose") %> </td>
                   <td> <%# Eval("donateby") %> </td>
                   <td> <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("campid") %>' /> </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("campid") %>' /> </td>
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
                 <label>Camp Name </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtcmpname" class="form-control" runat="server"></asp:TextBox>
                  <asp:CustomValidator ID="CustomValidator1" runat="server" setfocusonerror="true"
                      ErrorMessage="only enter alphabets" ClientValidationFunction="onlyalpha" 
                      ControlToValidate="txtcmpname" Display="Dynamic" ValidationGroup="grpcamp"></asp:CustomValidator>


                 <asp:RequiredFieldValidator ID="rqrcmpname" runat="server" 
                     ErrorMessage="Please Enter camp Name " ControlToValidate="txtcmpname" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpcamp"></asp:RequiredFieldValidator>
          
              </div>

              <div class="input-field">
                 <label>LOCATION </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtloc" class="form-control" runat="server" TextMode="multiline"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rqlocation" runat="server" 
                     ErrorMessage="Please Enter Location  " ControlToValidate="txtloc" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpcamp"></asp:RequiredFieldValidator>
          
              </div>

              <div class="input-field">
                 <label>City Name</label>
                 
                  <asp:DropDownList ID="ddcityname" runat="server" class="form-control" Width="100px">
                  </asp:DropDownList>
              </div>
               <div class="input-field">
                 <label>CAMP DATE </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtcmpdate" class="form-control" runat="server" TextMode="Date" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rqcmpdate" runat="server" 
                     ErrorMessage="Please Enter camp Date " ControlToValidate="txtcmpdate" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpcamp"></asp:RequiredFieldValidator>
          
             
              </div>

               <div class="input-field">
                 <label>ORGANIZER</label>
                 <asp:TextBox ID="txtorg" class="form-control" runat="server"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>TIME </label><span style="color:red">*</span>
                 <asp:TextBox ID="txttime" class="form-control" runat="server" TextMode="time"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="regexptime" runat="server" 
                    ErrorMessage="Enter Valid time" ControlToValidate="txttime" 
                    Display="Dynamic" SetFocusOnError="True" 
                    ValidationExpression="(1[0-2]|[1-9]):[0-5][0-9](\\s)?(i)(AM|PM)" ValidationGroup="grpcamp"></asp:RegularExpressionValidator>
                     
                     <asp:RequiredFieldValidator ID="rqcamptime" runat="server" 
                     ErrorMessage="Please Enter camp time " ControlToValidate="txttime" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpcamp"></asp:RequiredFieldValidator>
          
            
              </div>

               <div class="input-field">
                 <label>PURPOSE</label>
                 <asp:TextBox ID="txtpurpo" class="form-control" runat="server"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>DONATE BY</label>
                 <asp:TextBox ID="txtdon" class="form-control" runat="server"></asp:TextBox>
              </div>


           <br />
                 <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click" ValidationGroup="grpcamp" />
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
         
            <!-- #END# Basic Examples -->


</asp:Content>

