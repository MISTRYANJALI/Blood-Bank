<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="seminar.aspx.cs" Inherits="admin_seminar" %>

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
                               SEMINAR TABLE
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
                                           
                                            <th>Seminar Date</th>
                                            <th>Seminar Title</th>
                                            <th>Detail</th>
                                            <th>Venue</th>
                                            <th>Co-ordinate By</th>
                                            <th>Purpose</th> 
                                            <th>Start Time</th> 
                                            <th>End Time</th> 
                                            <th>Delete</th>
                                           <th>Update</th>                 
                
                                        </tr>
                                       </thead>
               <tbody>

             <asp:Repeater ID="rptseminar" runat="server" onitemcommand="rptseminar_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                     <td> <%# Eval("semdate") %> </td>
                   <td> <%# Eval("semtitle") %> </td>
                   <td> <%# Eval("detail") %> </td>
                   <td> <%# Eval("venue") %> </td>
                   <td> <%# Eval("coordinateby") %> </td>
                   <td> <%# Eval("purpose") %> </td>
                   <td> <%# Eval("starttime") %> </td>
                   <td> <%# Eval("endtime") %> </td>
                   <td> <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("semid") %>' /> </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("semid") %>' /> </td>
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
                 <label>Seminar Date </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtsemdate" class="form-control" ReadOnly="true" runat="server" TextMode="Date" CausesValidation="True"></asp:TextBox>

                 <asp:RequiredFieldValidator ID="rqsemdate" runat="server" 
                     ErrorMessage="Please Enter Seminar Date " ControlToValidate="txtsemdate" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
              </div>

              <div class="input-field">
                 <label>Seminar Title </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtsemtitle" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>

                 <asp:RequiredFieldValidator ID="rqsemtitle" runat="server" 
                     ErrorMessage="Please Enter Seminar Title " ControlToValidate="txtsemtitle" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
              </div>

              <div class="input-field">
                 <label>detail</label>
                 <asp:TextBox ID="txtdetail" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
              </div>

              <div class="input-field">
                 <label>Venue </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtvenue" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>Coordinate By</label>
                 <asp:TextBox ID="txtcordnt" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>purpose</label>
                 <asp:TextBox ID="txtpurpose" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>Start Time </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtstarttime" class="form-control" runat="server" TextMode="Time" CausesValidation="True"></asp:TextBox>



                 <asp:RequiredFieldValidator ID="rqstarttime" runat="server" 
                     ErrorMessage="Please Enter Start Time " ControlToValidate="txtstarttime" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          
                   </div>

               <div class="input-field">
                 <label>End Time </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtendtime" class="form-control" runat="server" TextMode="Time" CausesValidation="True"></asp:TextBox>
                
                 <asp:RequiredFieldValidator ID="rqendtime" runat="server" 
                     ErrorMessage="Please Enter End Time " ControlToValidate="txtendtime" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          
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

