<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="sendemail.aspx.cs" Inherits="admin_sendemail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                EMAIL TABLE
                            </h2>
                            <ul class="header-dropdown m-r--5">
                            <li>
                            
                            
                            </li>
                               
                            </ul>
                        </div>
                        <div class="body">
           <asp:Panel ID="pnlshow" runat="server">
            
            <div class="table-responsive">

            
                             
              <table class="table table-bordered table-striped table-hover js-basic-example dataTable" id="dataTables-example">
                               
               <thead>
                <tr> 
                    
                    <th>User Name</th>
                    <th>Email </th>
                   
                   
                    <th>Send Email</th>
                                  
                  
                </tr>
               </thead>
               <tbody>

             <asp:Repeater ID="rptemail" runat="server" onitemcommand="rptemail_ItemCommand">
              <ItemTemplate>
               <tr> 
                   <td> <%# Eval("username") %> </td>
                   <td> <%# Eval("email") %> </td>
                  
                   
                  
                   <td> <asp:Button ID="btnsend" class="btn btn-danger" runat="server" Text="Send Email" CommandName="sendemail"  CommandArgument='<%# Eval("regid") %>' /> </td>
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
             <div class="col-md-12">
               <h3>  <asp:Label ID="lbltitle" runat="server" Text=" "></asp:Label></h3>
             </div>
           </div>
           <div class="row" style="margin-top:20px">
  <div class="col-md-3"></div>
  <div class="col-md-6" style="margin-bottom:20px">

    <div class="form-group">
        <label>Email Address</label>
        <asp:TextBox class="form-control" ID="txtemailto" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="vldemail" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txtemailto" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
     </div>

     <div class="form-group">
        <label>Subject</label>
        <asp:TextBox class="form-control" ID="txtsubject" runat="server"></asp:TextBox>
     </div>

     <div class="form-group">
        <label>Description</label>
        <asp:TextBox class="form-control" ID="txtdescription" runat="server" TextMode="MultiLine" Rows="4" style="border:1px solid black!important"></asp:TextBox>
     </div>

     <div class="form-group">
         <asp:Button ID="btnsend" runat="server" Text="Send" class="btn btn-success" 
             onclick="btnsend_Click"/>
         <asp:Button ID="btncancel" runat="server" Text="Cancel" class="btn btn-danger" />
     </div>

     <div class="form-group">
          <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
     </div>

  </div>
</div>
        </asp:Panel>

                               
                            </div>
                        </div>
                    </div>
                </div>
           



</asp:Content>

