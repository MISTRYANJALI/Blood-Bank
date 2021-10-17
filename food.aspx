<%@ Page Title="" Language="C#" MasterPageFile="~/receiver/receivermaster.master" AutoEventWireup="true" CodeFile="food.aspx.cs" Inherits="receiver_food" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<section id="venue" class="wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
<br />
<br />
      <div class="container-fluid">

        <div class="section-header">
          <h2>Increase hemoglobin call</h2>
        </div>

        

      </div>

      <div class="container venue-gallery-container">
              <asp:Repeater ID="Repfoodimg" runat="server">
                <ItemTemplate > 

                <div class="venue-gallery">
                <table>
                <tr>
                    <td  width="100px" height="150px">
                      <a href='<%# "../photos/"+Eval("foodimg")%>' class="venobox vbox-item" data-gall="venue-gallery">
                     <img src='<%# "../photos/"+Eval("foodimg")%>' alt="" class="img-fluid">
                    </a>
                    </td> 
                    <td>    </td> 
                     <td>    </td> 
                      <td>    </td> 
                       <td>    </td> 
                     <td>
                    
                    <asp:Label ID="Lblfood" runat="server" Text='<%#Eval("description")%>'></asp:Label>
                    </td>
                </tr>
                </table>
                   </div>                         
                </ItemTemplate>
             
          </asp:Repeater>
           
     
          
      
     
      </div>

    </section>

</asp:Content>

