<%@ Page Title="" Language="C#" MasterPageFile="~/donor/donormaster.master" AutoEventWireup="true" CodeFile="changepwd.aspx.cs" Inherits="user_changepwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="about">
<div class="container-fluied">
    <div class="row " style="margin-top:29px">
        <div class="col-md-3"></div>
         <div class="col-md-6">
            
              <h2 class="text-white" ><u>Change Password</u></h2>
              <div class="form-group">
                 <label>Old Password</label> 
                 <asp:TextBox ID="txtoldpwd" runat="server" class="form-control" textmode="Password" Width=500px></asp:TextBox>
             </div>

             <div class="form-group">
                 <label>New Password</label> 
                <asp:TextBox ID="txtnewpwd" runat="server" class="form-control" textmode="Password" Width=500px></asp:TextBox>
             </div>

              <div class="form-group">
                 <label>Conform Password</label> 
                <asp:TextBox ID="txtconpwd" runat="server" class="form-control" textmode="Password" Width=500px></asp:TextBox>
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

