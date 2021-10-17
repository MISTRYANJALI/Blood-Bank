<%@ Page Title="" Language="C#" MasterPageFile="~/donor/donormaster.master" AutoEventWireup="true" CodeFile="pickup.aspx.cs" Inherits="donor_pickup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<div id="about" >
<div class="container-fluied">
    <div class="row section-header">
        
        <div class="col-md-12">
        <h2 class="text-white" >Pickup</h2>
        </div>


    </div>
    <div class="row" style="margin-top:29px">
        <div class="col-md-2"></div>
         <div class="col-md-3">
            
              
            
           
             <div class="form-group">
             <label>Pickup Date </label> <span style="color:red">*</span>
                 <asp:TextBox ID="txtdate" runat="server" TextMode="Date" class="form-control" width="300px"></asp:TextBox>
           
             </div>

            <div class="form-group">
             <label>Address </label> <span style="color:red">*</span>
                <asp:TextBox ID="txtadd" runat="server" TextMode="Multiline" class="form-control" Width="300px"></asp:TextBox>
             </div>

               <div class="form-group">
             <label>City Name</label> <span style="color:red">*</span>

                    <asp:DropDownList ID="ddcity" runat="server" class="form-control" Width="300px">
                      </asp:DropDownList>

             </div>

                <div class="form-group">
             <label>Landmark</label> <span style="color:red">*</span>
                    <asp:TextBox ID="txtlandmark" runat="server" class="form-control" Width="300px"></asp:TextBox>
             </div>
             </div>
             <div class="col-md-1"></div>
             <div class="col-md-4">
                  <div class="form-group">
             <label>Blood Group Id</label> <span style="color:red">*</span>
                      <asp:DropDownList ID="ddbldgrpid" runat="server" class="form-control" Width="300px">
                      </asp:DropDownList>
                     
             </div>


                  <div class="form-group">
             <label>Qty</label> <span style="color:red">*</span>
                      <asp:TextBox ID="txtqty" runat="server" class="form-control" width="300px"></asp:TextBox>
             </div>

                 <div class="form-group">
             <label>Pickup Time</label> <span style="color:red">*</span>
                     <asp:TextBox ID="txttime" runat="server" class="form-control" TextMode="time" Width="300px"></asp:TextBox>
             </div>


               <div class="form-group">
                   <asp:Button ID="btnsend" runat="server" Text="Send" class="btn btn-danger" 
                       onclick="btnsend_Click" />
               </div>


       
       
         </div>       
        </div>
    </div>
   </div>  

</asp:Content>

