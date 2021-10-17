<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="admin_news" %>

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
                                NEWS TABLE
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
                   
                    <th>News heading</th>
                    <th>News Details</th>
                    <th>News By</th>
                    <th>News For</th>  
                    <th>Delete</th>
                    <th>Update</th>                 
             
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptnews" runat="server" onitemcommand="rptnews_ItemCommand">
              <ItemTemplate>
               <tr> 
                  
                   <td> <%# Eval("newshdn")%> </td>
                   <td> <%# Eval("news")%> </td>
                   <td> <%# Eval("newsby")%> </td>
                   <td> <%# Eval("newsfor")%> </td>
                   <td> <asp:Button ID="btndel" class="btn btn-danger" runat="server" Text="Delete" CommandName="delete"  CommandArgument='<%# Eval("newsid") %>' /> </td>
                   <td><asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Eval("newsid") %>' /> </td>
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
                 <label>News Heading</label><span style="color:red">*</span>
                 <asp:TextBox ID="txtnewshdn" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>

                 <asp:RequiredFieldValidator ID="rqrnewshdn" runat="server" 
                     ErrorMessage="Please Enter News Heading " ControlToValidate="txtnewshdn" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            
              </div>

              <div class="input-field">
                 <label>News</label><span style="color:red">*</span>
                 <asp:TextBox ID="txtnews" class="form-control" runat="server" CausesValidation="True" TextMode="MultiLine" BorderColor="Black" BorderStyle="Solid" BorderWidth="1"></asp:TextBox>

                 <asp:RequiredFieldValidator ID="rqnews" runat="server" 
                     ErrorMessage="Please Enter News " ControlToValidate="txtnews" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            
              </div>

               <div class="input-field">
                 <label>News By</label>
                 <asp:TextBox ID="txtnewsby" class="form-control" runat="server"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>News For</label>
                 <asp:TextBox ID="txtnewsfor" class="form-control" runat="server"></asp:TextBox>
              </div>

             

           <br />
                 <asp:Button ID="btnsave" class="btn btn-success" runat="server" Text="Save" 
                     onclick="btnsave_Click" />&nbsp;&nbsp;
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

