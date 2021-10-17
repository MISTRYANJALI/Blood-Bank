<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="bloodgroup.aspx.cs" Inherits="admin_bloodgroup" %>

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
                                BLOOD GROUP TABLE
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li><asp:Button ID="btnnew" class="btn btn-primary" runat="server" Text="INSERT NEW RECORD" 
 
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
                                           
                                            <th>bloodgroup</th>
                                            <th>shortname</th>
                                            <th>usegroup</th> 
                                            <th>Delete</th>
                                           <th>Update</th>                 
                  
                                        </tr>
                                       </thead>
               <tbody>

             <asp:Repeater ID="rptbloodgrp" runat="server" onitemcommand="rptbloodgrp_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("bloodgrpname") %> </td>
                    <td> <%# Eval("shortname") %> </td>
                    <td> <%# Eval("usegroup") %> </td>
                   <td> <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("bloodgrpid") %>' /> </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("bloodgrpid") %>' /> </td>
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
                 <label>Bloodgroup Name </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtbldgrpname" class="form-control" runat="server"></asp:TextBox>

                  <asp:CustomValidator ID="custbldgrpname" runat="server" 
                      ErrorMessage="only enter alphabets" ClientValidationFunction="onlyalpha" 
                      ControlToValidate="txtbldgrpname" Display="Dynamic"></asp:CustomValidator>


                  <asp:RequiredFieldValidator ID="rqbldgrpname" runat="server" 
                     ErrorMessage="Please Enter Blood Group Name " ControlToValidate="txtbldgrpname" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          
              </div>

             

               <div class="input-field">
                 <label>Short Name </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtshortname" class="form-control" runat="server"></asp:TextBox>
              </div>

              
               <div class="input-field">
                 <label>usegroup</label>
                 <asp:TextBox ID="txtusegroup" class="form-control" runat="server"></asp:TextBox>
              </div>


          <br />
                 <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click" />&nbsp;&nbsp;
                 <asp:Button ID="btncancel" class="btn btn-danger" runat="server" Text="Cancel" 
                     onclick="btncancel_Click" />
             </div>
           </div>
           <br />
        </asp:Panel>

                               
                            </div>
                        </div>
                    </div>
  
  

</asp:Content>

