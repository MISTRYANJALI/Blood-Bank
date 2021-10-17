<%@ Page Title="" Language="C#" MasterPageFile="~/receiver/receivermaster.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="receiver_Paymnet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="about" >
<div class="container-fluied">
    <div class="row" style="margin-top:29px">
        <div class="col-md-3"></div>
         <div class="col-md-6">
            
              <h2 class="text-white" >PAYMENT</h2>
            
           
             <div class="form-group">
             <label>User Name </label> <span style="color:red">*</span>
             <asp:TextBox ID="txtreguser" runat="server" class="form-control" Width="500px"></asp:TextBox>
             <asp:CustomValidator ID="custregname" runat="server" 
                      ErrorMessage="Only Enter Alphabets" ClientValidationFunction="onlyalpha" 
                      ControlToValidate="txtreguser" Display="Dynamic" ValidationGroup="grpreg" ForeColor="red">
                      </asp:CustomValidator>

            
                 <asp:RequiredFieldValidator ID="rqrusername" runat="server" 
                     ErrorMessage="Please Enter User Name " ControlToValidate="txtreguser" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"  ValidationGroup="grpreg">
                     </asp:RequiredFieldValidator>
             </div>

             <div class="input-field">
                 <label>Quantity </label>
                 <asp:TextBox ID="txtqty" class="form-control" runat="server" TextMode="Number" CausesValidation="True" Width="500px"></asp:TextBox>

                  <asp:RequiredFieldValidator ID="rqqty" runat="server" 
                     ErrorMessage="Please Enter Quantity " ControlToValidate="txtqty" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>

            <div class="form-group">
             <label>Amount </label> <span style="color:red">*</span>
             <asp:TextBox ID="txtamount" runat="server" class="form-control" CausesValidation="True" ReadOnly="true" Width="500px" ></asp:TextBox>
               
             </div>

           

     
            <div class="form-group">
               <asp:Button class="btn" ID="btnsubmit" runat="server" Text="submit"  
                    style="background-color:#f82249;color:white" ValidationGroup="grpreg" 
                    onclick="btnsubmit_Click" /> 
               <button type="button" class="btn " style="background-color:#f82249;color:white">close</button>
             </div>
       
       
         </div>       
        </div>
    </div>
    </div> 

    

</asp:Content>

