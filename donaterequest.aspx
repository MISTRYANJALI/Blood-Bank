<%@ Page Title="" Language="C#" MasterPageFile="~/donor/donormaster.master" AutoEventWireup="true" CodeFile="donaterequest.aspx.cs" Inherits="donor_donaterequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="about">
<section id="contact">

<div class="container">
 <div class="row section-header" >
      <div class="col-md-12">
               <h2>  DONATE REQUEST</h2>
             </div>
           </div>
<div class="row">
    <div class="col-md-3"></div>
          
    <div class="col-md-4">

                <div class="input-field">
                 <label> User Name</label>
                    <asp:TextBox ID="txtregid" runat="server" class="form-control" Width="500px"></asp:TextBox>
                  </div>
                   
                 <div class="input-field">
                 <label> Blood Group Name</label>
                     <asp:DropDownList ID="ddbldgrpid" runat="server" class="form-control" Width="500px">
                     </asp:DropDownList>
                  </div>

               <div class="input-field">
                 <label>Quantity </label>
                 <asp:TextBox ID="txtqty" class="form-control" runat="server" TextMode="Number" Width="500px" CausesValidation="True"></asp:TextBox>

                  <asp:RequiredFieldValidator ID="rqqty" runat="server" 
                     ErrorMessage="Please Enter Quantity " ControlToValidate="txtqty" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
             <div class="input-field">
                 <label>Unit </label>
                 <asp:TextBox ID="txtunit" class="form-control" runat="server" Width="500px"></asp:TextBox>
              </div>

               <div class="input-field">
                 <label>Remark</label>
                 <asp:TextBox ID="txtremark" class="form-control" runat="server"  CausesValidation="True" Width="500px"></asp:TextBox>

                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                     ErrorMessage="Please Enter Quantity " ControlToValidate="txtqty" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" Width="500px"></asp:RequiredFieldValidator>
            </div>
            </div>

            <div class="row" style="margin-top:20px">
             <div class="col-md-12">
                 <asp:Button ID="btnsave" class="btn btn-danger" runat="server" Text="Send" 
                     onclick="btnsave_Click" />
                  </div>
           </div>
    </div>
</div>
</div> 

  </section>
  </div>         
</asp:Content>

