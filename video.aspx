<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="video.aspx.cs" Inherits="admin_video" %>

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
                               VIDEO TABLE
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
                                            
                                            <th>videoname</th>
                                            <th>filename</th>
                                            <th>videotype</th>
                                            <th>videosize</th>
                                            <th>purpose</th>
                                            <th>Delete</th>
                                           <th>Update</th>                 
 
                                                         
                                        </tr>
                                       </thead>
               <tbody>

             <asp:Repeater ID="rptvideo" runat="server" onitemcommand="rptvideo_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("videoname") %> </td>
                   <td> <%# Eval("filename") %> </td>
                   <td> <%# Eval("videotype") %> </td>
                   <td> <%# Eval("videosize") %> </td>
                   <td> <%# Eval("purpose") %> </td>
                  <td> <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("videoid") %>' /> </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("videoid") %>' /> </td>
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
                 <label>Video Name </label><span style="color:red">*</span>
                 <asp:TextBox ID="txtvideoname" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>

                 <asp:RequiredFieldValidator ID="rqvdoname" runat="server" 
                     ErrorMessage="Please Enter Video name " ControlToValidate="txtvideoname" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          
              </div>

              <div class="input-field">
                 <label>File Name</label>
                 <asp:TextBox ID="txtfilename" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>

                 <asp:RequiredFieldValidator ID="rqfilename" runat="server" 
                     ErrorMessage="Please Enter File name " ControlToValidate="txtfilename" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          
              </div>

              <div class="input-field">
                 <label>Video Type</label>
                 <asp:TextBox ID="txtvideotype" class="form-control" runat="server"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>Video Size</label>
                 <asp:TextBox ID="txtvideosize" class="form-control" runat="server"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>Purpose</label>
                 <asp:TextBox ID="txtpurpose" class="form-control" runat="server"></asp:TextBox>
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

