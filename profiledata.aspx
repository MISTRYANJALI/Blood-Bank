<%@ Page Title="" Language="C#" MasterPageFile="~/receiver/receivermaster.master" AutoEventWireup="true" CodeFile="profiledata.aspx.cs" Inherits="receiver_profiledata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="about">
 
<div class="container-fluid" style="background-image:url('../main/img/background.jpg')"> 

 <div class="row">
      <div class="col-md-3"></div>
      <div class="col-md-6">
      <br />
               <h2 style="margin-top:20px;"><u>Profile</u></h2>
             </div>
           </div>
 <div class="row">
            <div class="col-md-3"></div>
             <div class="col-md-6">
             <center>
                 <table class="style1" width="100%" >
                 
                     <tr>
                         <td rowspan="12">
                             <asp:Image ID="imguser" Width="200px" Height="200px" runat="server" />
                         </td>
                     </tr>

                     <tr>
                         <td>
                             Receiver Name</td>
                         <td>
                             <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             Address</td>
                         <td>
                             <asp:Label ID="lbladd" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             City Name</td>
                         <td>
                             <asp:Label ID="lblcity" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             Pincode</td>
                         <td>
                             <asp:Label ID="lblpin" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             Contactno</td>
                         <td>
                             <asp:Label ID="lblcon" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             Gender</td>
                         <td>
                             <asp:Label ID="lblgender" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             Email Id</td>
                         <td>
                             <asp:Label ID="lblemail" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             Birthdate</td>
                         <td>
                             <asp:Label ID="lblbir" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             Blood Group
                         </td>
                         <td>
                             <asp:Label ID="lblbldgrp" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>


                     <tr>
                         <td>
                             Height</td>
                         <td>
                             <asp:Label ID="lblheight" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             Weight</td>
                         <td>
                             <asp:Label ID="lblweight" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>

                     <tr>
                         <td>
                             <asp:Button ID="update" runat="server" onclick="update_Click" 
                                 Text="Update Profile" BackColor="#CC0000" ForeColor="White" />
                         </td>
                         <td>
                             &nbsp;</td>
                     </tr>
                 </table>
             </center>
              </div>
  </div>
</div>
</div>

</asp:Content>

