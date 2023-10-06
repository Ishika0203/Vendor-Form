<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="CelVendorForm.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <img src="imgs/banner%20cel.jpg" class="img-fluid" width="100%" height="20"/>
    </section>

    <section>
         <img src="imgs/fghgrh.jpg" class="img-fluid" width="100%" />
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h1>VENDOR</h1>
                    </center>
                </div>
            </div>
            <br />
            <br />
            <div class="row">
                
                <div class="col-md-4">
                    <center>
                    <a href="Registrationprocedure.aspx">
                    <img width="150px" src="imgs/gear_2092060.png" alt="Image Description" />
                    <h4>Registration Procedure</h4>
                    </a>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                    <a href="userlogin.aspx">
                    <img  width="150px" src="imgs/upload-file_9425398.png" alt="Image Description" />
                    <h4>New Vendor registration</h4>
                    </a>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                    <a href="vendorapplicationstatus.aspx">
                    <img  width="150px" src="imgs/timeline_4759939.png" alt="Image Description" />
                    <h4>Vendor Application Status</h4>
                    </a>
                    </center>
                </div>

            </div>
            <br /><br />
            <div class="row">
    
                <div class="col-md-4">
                    <center>
                    <a href="Approvedvendor.aspx">
                    <img  width="150px" src="imgs/checkbox_8932032.png" alt="Image Description"/>
                    <h4>Approved Vendor List</h4>
                    </a>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                    <a href="BacklistedVendor.aspx">
                    <img  width="150px" src="imgs/paper_7615504.png" alt="Image Description" />
                    <h4>Backlisted Vendors</h4>
                    </a>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                    <a href="PurchaseOrdersIssued.aspx">
                    <img  width="150px" src="imgs/shopping-list_3225216.png" alt="Image Description" />
                    <h4>Purchase Order Issued</h4>
                    </a>
                    </center>
                </div>

            </div>

        </div>
    </section>
    <br /><br />
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <p>
                            Central Electronics Limited is a Govt. of India Enterprise under the Department of Scientific and Industrial Research (DSIR),<br />
                            Ministry of Science & Technology. It was established in 1974, with an objective to commercially exploit indigenous technologies <br />
                            developed by National Laboratories and R&D Institutions in the country.
                        </p>
                    </center>
                </div>
            </div>
             <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="350" src="imgs/slider-digital-india-logo.jpg" />
                    </center>
                </div>
                   <div class="col-md-4">
                    <center>
                        <img width="350" src="imgs/slider-CSIR.jpg" />
                    </center>
                </div>
                   <div class="col-md-4">
                    <center>
                        <img width="350" src="imgs/slider-make-in-india.jpg" />
                    </center>
                </div>
            </div>
        </div>
        <br />
    </section>


</asp:Content>
