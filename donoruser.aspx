<%@ Page Title="" Language="C#" MasterPageFile="~/donor/donormaster.master" AutoEventWireup="true" CodeFile="donoruser.aspx.cs" Inherits="user_donoruser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <br />
    <br />
    <section>
  <div class="container-fluid" style="background-color:black">
  <div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active" style="width:100%; height:550px">
      <img src="gel/bgimg.jpg" alt="Los Angeles" />
    </div>
    <div class="carousel-item" style="width:100%; height:550px">
      <img src="gel/6.jpg" alt="Chicago">
    </div>
    <div class="carousel-item" style="width:100%; height:550px">
      <img src="gel/3.jpg" alt="New York">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>



    

     
    </div>
    
  
  </section>

    
    
    <!--==========================
      Schedule Section
    ============================-->
    <section id="schedule" class="section-with-bg">
      <div class="container wow fadeInUp">
        <div class="section-header">
          <h2>CAMP SCHEDULE </h2>
          <p>Here is Came Details</p>
        </div>

        <ul class="nav nav-tabs" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" href="#day-1" role="tab" data-toggle="tab">CAMP 1</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#day-2" role="tab" data-toggle="tab">CAMP 2</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#day-3" role="tab" data-toggle="tab">CAMP 3</a>
          </li>
        </ul>
        
        <div class="tab-content row justify-content-center">

          <!-- Schdule Day 1 -->
          <div role="tabpanel" class="col-lg-9 tab-pane fade show active" id="day-1">

           
            <div class="row schedule-item">
              <div class="col-md-3"><h4 >CAMP TITLE</h4></div>
              <div class="col-md-9">
                
                <h5><asp:Literal ID="ltrlcampname1" runat="server"></asp:Literal></h5>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-3"><h4>DATE</h4></div>
              <div class="col-md-9">
              <h5><asp:Literal ID="ltrldate1" runat="server"></asp:Literal></h5>
                  </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-3"><h4> CAMP TIME</h4> </div>
              <div class="col-md-9">
                <h5><asp:Literal ID="ltrltime1" runat="server"></asp:Literal></h5>
                </div>
                </div>

            <div class="row schedule-item">
              <div class="col-md-3"><h4>CAMP LOCATION</h4></div>
              <div class="col-md-9">
              <h5><asp:Literal ID="ltrllocation1" runat="server"></asp:Literal></h5>
                
            </div>
            </div>

           
          </div>
          <!-- End Schdule Day 1 -->

          <!-- Schdule Day 2 -->
          <div role="tabpanel" class="col-lg-9  tab-pane fade" id="day-2">

           <div class="row schedule-item">
              <div class="col-md-3"><h4 >CAMP TITLE</h4></div>
              <div class="col-md-9">
                
                <h5><asp:Literal ID="ltrcampname2" runat="server"></asp:Literal></h5>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-3"><h4>DATE</h4></div>
              <div class="col-md-9">
              <h5><asp:Literal ID="ltrdate2" runat="server"></asp:Literal></h5>
                  </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-3"><h4> CAMP TIME</h4> </div>
              <div class="col-md-9">
                <h5><asp:Literal ID="ltrtime2" runat="server"></asp:Literal></h5>
                </div>
                </div>

            <div class="row schedule-item">
              <div class="col-md-3"><h4>CAMP LOCATION</h4></div>
              <div class="col-md-9">
              <h5><asp:Literal ID="ltrlocation2" runat="server"></asp:Literal></h5>
                
            </div>
            </div>


          </div>
          <!-- End Schdule Day 2 -->

          <!-- Schdule Day 3 -->
          <div role="tabpanel" class="col-lg-9  tab-pane fade" id="day-3">

             <div class="row schedule-item">
              <div class="col-md-3"><h4 >CAMP TITLE</h4></div>
              <div class="col-md-9">
                
                <h5><asp:Literal ID="ltrcampname3" runat="server"></asp:Literal></h5>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-3"><h4>DATE</h4></div>
              <div class="col-md-9">
              <h5><asp:Literal ID="ltrdate3" runat="server"></asp:Literal></h5>
                  </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-3"><h4> CAMP TIME</h4> </div>
              <div class="col-md-9">
                <h5 ><asp:Literal ID="ltrtime3" runat="server"></asp:Literal></h5>
                </div>
                </div>

            <div class="row schedule-item">
              <div class="col-md-3"><h4>CAMP LOCATION</h4></div>
              <div class="col-md-9">
              <h5><asp:Literal ID="ltrlocation3" runat="server"></asp:Literal></h5>
                
            </div>
            </div>


          </div>
          <!-- End Schdule Day 2 -->

        </div>

      </div>

    </section>
    <!--==========================
      Gallery Section
    ============================-->
    <section id="gallery" class="wow fadeInUp">

      <div class="container">
        <div class="section-header">
          <h2>Gallery</h2>
          <p>Check Our Gallery </p>
        </div>
      </div>

      <div class="owl-carousel gallery-carousel">
          <asp:Repeater ID="Repimg" runat="server">

                <ItemTemplate >
                    <a href='<%# "../photos/"+Eval("img")%>' class="venobox" data-gall="gallery-carousel">
                    <img src='<%# "../photos/"+Eval("img")%>' alt="" style="weight:200px;height:200px">

                    </a>                
                </ItemTemplate>

          </asp:Repeater>

      </div>
      <br />
      <center>     
       <asp:Button ID="Btnfood" runat="server" class="btn btn-danger" Text="How to Increase Blood" 
        onclick="Btnfood_Click"></asp:Button>
        </center>

    </section>

</asp:Content>

