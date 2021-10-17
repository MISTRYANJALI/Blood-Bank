<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="city.aspx.cs" Inherits="admin_city" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                                BASIC EXAMPLE
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                 <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="INSERT NEW RECORD" 
 
                                      onclick="btnnew_Click" />
                            </ul>
                        </div>
                       
                         <asp:Panel ID="pnlshow" runat="server">
                          <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                    
                                     <asp:Button ID="btnnew" class="btn btn-primary" runat="server" Text="New" 
                                      onclick="btnnew_Click" />
                               
                                       <thead>
                                        <tr> 
                                            <th>cityid</th>
                                            <th>cityname</th>
                                            <th>shortname</th>
                                            <th>pincode</th> 
                                             <th>statename</th> 
                                              <th>delete</th> 
                                               <th>update</th> 
                                                        
                                        </tr>
                                       </thead>
               <tbody>

             <asp:Repeater ID="rptcity" runat="server" onitemcommand="rptcity_ItemCommand">
              <ItemTemplate>
               <tr> 
                   <td> <%# Eval("cityid") %> </td>
                   <td> <%# Eval("cityname") %> </td>
                    <td> <%# Eval("shortname") %> </td>
                    <td> <%# Eval("pincode") %> </td>
                    <td> <%# Eval("statename") %> </td>

                   <td> <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("cityid") %>' /> </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("cityid") %>' /> </td>
              </tr>
              </ItemTemplate>
             </asp:Repeater>
             </tbody>
             <tfoot>
             
             </tfoot>
            </table>
            </div>
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
                 <label>city name</label>
                 <asp:TextBox ID="txtcityname" class="form-control" runat="server"></asp:TextBox>

                 <asp:CustomValidator ID="custcity" runat="server" setfocusonerror="true"
                      ErrorMessage="only enter alphabets" ClientValidationFunction="onlyalpha" 
                      ControlToValidate="txtcityname" Display="Dynamic" ValidationGroup="grpcity"></asp:CustomValidator>


                 <asp:RequiredFieldValidator ID="rqrcityname" runat="server" 
                     ErrorMessage="Please Enter city Name " ControlToValidate="txtcityname" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpcity"></asp:RequiredFieldValidator>
          
              
              </div>

             

               <div class="input-field">
                 <label>short name</label>
                 <asp:TextBox ID="txtshortname" class="form-control" runat="server"></asp:TextBox>
              </div>

              
               <div class="input-field">
                 <label>pincode</label>
                 <asp:TextBox ID="txtpincode" class="form-control" runat="server"></asp:TextBox>

                   <asp:CustomValidator ID="custpin" runat="server" setfocusonerror="true"
                      ErrorMessage="Enter valid Pincode" ClientValidationFunction="checkpincode" 
                      ControlToValidate="txtpincode" Display="Dynamic" ValidationGroup="grpcity"></asp:CustomValidator>

                       <asp:RequiredFieldValidator ID="rqfpincode" runat="server" 
                     ErrorMessage="Please Enter Pincode " ControlToValidate="txtpincode" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpcity"></asp:RequiredFieldValidator>
          

              </div>

               <div class="input-field">
                 <label>State Name</label>
                 <asp:DropDownList ID="ddstatename" runat="server" class="form-control"  Width="100px"></asp:DropDownList>
                </div>


         <br />
                 <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click" ValidationGroup="grpcity" />&nbsp;&nbsp;
                 <asp:Button ID="btncancel" class="btn btn-danger" runat="server" Text="Cancel" 
                     onclick="btncancel_Click" />
             </div>
           </div>
           <br />
        </asp:Panel>

                               
                            </div>
                        </div>
                    </div>
   
            <!-- #END# Basic Examples -->
            
 


</asp:Content>

