<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup27.aspx.cs" Inherits="CelVendorForm.usersignup27" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var LatestVendorrating = document.getElementById("<%= TextBox111.ClientID %>").value;
         var Anyotherinformation = document.getElementById("<%= TextBox112.ClientID %>").value;

         var vendorData = {
             Latest_Vendor_Rating: LatestVendorrating,
             Other_Information: Anyotherinformation,
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createVendorRatingAndInfo", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Thanks for filling this form!");
                 window.location.href = "homepage.aspx";
             })
             .catch(function (error) {
                 // Handle errors (e.g., show an error message)
                 console.error("API error:", error);
                 alert("Error submitting the form. Please try again.");
             });
     }

 </script>

    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="100px" src="imgs/generaluser.png" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Vendor Registration</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label>Latest Vendor rating given to you by your major customer</label>
                                        <div class="form-group">
                                           <asp:TextBox CssClass="form-control" ID="TextBox111" runat="server" placeholder="Latest Vendor rating given to you by your major customer" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label>Any other information you would like to furnish</label>
                                        <div class="form-group">
                                           <asp:TextBox CssClass="form-control" ID="TextBox112" runat="server" placeholder="Any other information you would like to furnish"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

    





                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                         <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" OnClientClick="submitForm()" runat="server" Text="Submit" />
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br /><br />
            </div>
        </div>    
    </div>

</asp:Content>
