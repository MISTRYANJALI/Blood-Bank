<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="changepass.aspx.cs" Inherits="admin_changepass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="container-fluied">
    <div class="row " style="margin-top:29px">
        <div class="col-md-3"></div>
         <div class="col-md-6">
            
              <h2 class="text-white" >Change Password</h2>
              <div class="form-group">
                 <label>Old Password</label> 
                 <asp:TextBox ID="txtoldpwd" runat="server" class="form-control" textmode="Password"></asp:TextBox>
             </div>

             <div class="form-group">
                 <label>New Password</label> 
                <asp:TextBox ID="txtnewpwd" runat="server" class="form-control" textmode="Password"></asp:TextBox>
             </div>

              <div class="form-group">
                 <label>Conform Password</label> 
                <asp:TextBox ID="txtconpwd" runat="server" class="form-control" textmode="Password"></asp:TextBox>
             </div>


             <div class="form-group">
                 <asp:Button ID="btnchpwd"  class="btn btn-danger"  runat="server" 
                     Text="Change Password" onclick="btnchpwd_Click" />
                 <asp:Button ID="btnClose" class="btn btn-danger" runat="server" Text="CLOSE" />
             </div>
             <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
         </div>
    </div>
</div>
</div>


</asp:Content>

