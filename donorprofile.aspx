<%@ Page Title="" Language="C#" MasterPageFile="~/donor/donormaster.master" AutoEventWireup="true" CodeFile="donorprofile.aspx.cs" Inherits="user_donorprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 

<div id="about">
 
<div class="container-fluid" style="background-image:url('../main/img/background.jpg')"> 
 <div class="row">
 
             <div class="col-md-12">
             <br />
            <br />
              <center> <h2> <asp:Label ID="lbltitle" runat="server" Text=" USER PROFILE"></asp:Label> </h2></center>
             </div>
           </div>
          <div class="row">
             <div class="col-md-3"></div>
           
             <div class="col-md-3">
                

              <div class="input-field">
                 <label>Donor Name </label> <span style="color:red">*</span>
                 <asp:TextBox ID="txtdnrname" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                  
                   <asp:CustomValidator ID="custdnrname" runat="server" 
                      ErrorMessage="only enter alphabets" ClientValidationFunction="onlyalpha" 
                      ControlToValidate="txtdnrname" Display="Dynamic" ValidationGroup="grpdonor" ForeColor="red"></asp:CustomValidator>

                  <asp:RequiredFieldValidator ID="rqdnrname" runat="server" 
                     ErrorMessage="Please Enter Donor name " ControlToValidate="txtdnrname" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpdonor"></asp:RequiredFieldValidator>
          
              </div>

               <div class="input-field">
                 <label>Address </label> <span style="color:red">*</span>
                 <asp:TextBox ID="txtdnradd" class="form-control" runat="server" 
                      TextMode="MultiLine" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ></asp:TextBox>

                 <asp:RequiredFieldValidator ID="rqraddress" runat="server" 
                     ErrorMessage="Please Enter Address " ControlToValidate="txtdnradd" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpdonor"></asp:RequiredFieldValidator>
            </div>

             <div class="input-field">
                 <label>cityname</label>
                 <asp:DropDownList ID="ddcity" runat="server" class="form-control" Width="300">
                 </asp:DropDownList>
               </div>
          
              <div class="input-field">
                 <label>pincode</label>
                 <asp:TextBox ID="txtpincode" class="form-control" runat="server"></asp:TextBox>

                  <asp:CustomValidator ID="custpincode" runat="server" 
                      ErrorMessage="only enter 6 Character" ClientValidationFunction="checkpincode" 
                      ControlToValidate="txtpincode" Display="Dynamic" ValidationGroup="grpdonor" ForeColor="red"></asp:CustomValidator>

              </div>

              <div class="input-field">
                 <label>Contact No </label> <span style="color:red">*</span>
                 <asp:TextBox ID="txtconno" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="rgexpcon" runat="server" ErrorMessage="Please Enter Valid Contact No" ValidationExpression="\d{10}"
                   SetFocusOnError="True" ControlToValidate="txtconno" Display="Dynamic" ValidationGroup="grpdonor"></asp:RegularExpressionValidator>

              </div>
                 
                <div class="input-field">
                 <label>Gender </label> <span style="color:red">*</span>
                    <asp:RadioButtonList ID="radiobtn" runat="server" CausesValidation="True" 
                        RepeatDirection="Horizontal" ValidationGroup="grpdonor" Font-Size="Medium">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>

                 </asp:RadioButtonList>
                  </div>
                  
            


               <div class="input-field">
                 <label>Email Id</label>
                 <asp:TextBox ID="txtemailid" class="form-control" runat="server" CausesValidation="True" TextMode="Email"></asp:TextBox>
                  
                  <asp:RegularExpressionValidator ID="regexpemail" runat="server" 
                    ErrorMessage="Enter Valid Email " ControlToValidate="txtemailid" 
                    Display="Dynamic" SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="grpdonor"></asp:RegularExpressionValidator>
            

              </div>

                <div class="input-field">
                 <label>Blood Group Name</label> <span style="color:red">*</span>
                  <asp:DropDownList ID="ddbldgrpid" runat="server" class="form-control" Width="300">
                  </asp:DropDownList>
                    </div>
            
             </div>

              <div class="col-md-1"></div>
             <div class="col-md-3">


            

               <div class="input-field">
                 <label>BIRTHDATE </label> <span style="color:red">*</span>
                 <asp:TextBox ID="txtbrtdate" class="form-control" runat="server" TextMode="Date" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rqbrtdate" runat="server" 
                     ErrorMessage="Please Enter Birth Date " ControlToValidate="txtbrtdate" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpdonor"></asp:RequiredFieldValidator>
          
             </div>
             

              

              <div class="input-field">
                 <label>Diseas</label>
                 <asp:TextBox ID="txtdiseas" class="form-control" runat="server"></asp:TextBox>
              </div>

            
              

               <div class="input-field">
                 <label>History </label> <span style="color:red">*</span>
                 <asp:TextBox ID="txthistory" class="form-control" runat="server" CausesValidation="True"></asp:TextBox>

                  <asp:RequiredFieldValidator ID="rqfhis" runat="server" 
                     ErrorMessage="Please Enter History " ControlToValidate="txthistory" 
                     SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="grpdonor"></asp:RequiredFieldValidator>
          
              </div>

               <div class="input-field">
                 <label>Health</label>
                 <asp:TextBox ID="txthealth" class="form-control" runat="server"></asp:TextBox>
              </div>

              <div class="input-field">
                 <label>Height</label>
                 <asp:TextBox ID="txtheight" class="form-control" runat="server"></asp:TextBox>

                   <asp:CustomValidator ID="custheight" runat="server" 
                      ErrorMessage="only enter positive Number" ClientValidationFunction="checkpositive" 
                      ControlToValidate="txtdnrname" Display="Dynamic" ValidationGroup="grpdonor" ForeColor="red"></asp:CustomValidator>

              </div>

              <div class="input-field">
                 <label>Weight</label>
                 <asp:TextBox ID="txtweight" class="form-control" runat="server"></asp:TextBox>

                   <asp:CustomValidator ID="custweight" runat="server" 
                      ErrorMessage="only enter positive Number" ClientValidationFunction="checkpositive" 
                      ControlToValidate="txtweight" Display="Dynamic" ValidationGroup="grpdonor" ForeColor="red"></asp:CustomValidator>

              </div>
               <div class="input-field">
                 <label>Photo</label>
                   <asp:FileUpload ID="fupphoto" runat="server" class="form-control" />
                  </div>

             
                <div class="form-group" style="margin-top:20px">

             
                 <asp:Button ID="btnupdate" class="btn btn-success" runat="server" Text="UPDATE" 
                     ValidationGroup="grpdonor" onclick="btnupdate_Click"  />
                 <asp:Button ID="btncancel" class="btn btn-danger" runat="server" Text="Cancel" 
                     onclick="btncancel_Click" />
                     </div>
            </div>

          </div>
               

               </div>
                 
             </div>
             
          
       
 
</asp:Content>

