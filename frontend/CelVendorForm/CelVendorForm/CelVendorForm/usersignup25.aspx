<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup25.aspx.cs" Inherits="CelVendorForm.usersignup25" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var Organization = document.getElementById("<%= TextBox106.ClientID %>").value;
         var Detailsofitems = document.getElementById("<%= TextBox107.ClientID %>").value;
         var Ordernoanddate  = document.getElementById("<%= TextBox109.ClientID %>").value;
         var Value = document.getElementById("<%= TextBox110.ClientID %>").value;

         var vendorData = {
             Organization: Organization,
             Detail_of_items: Detailsofitems,
             OrderNo_and_Date: Ordernoanddate,
             Value: Value,

         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createOrganization", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                 window.location.href = "usersignup26.aspx";
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
                                    <center>
                                        <h5>Organisation to whom similar items are supplied during the last 3 years</h5>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label>Organisation</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox106" runat="server" placeholder="Organisation"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-3">
                                    <label>Details of items</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox107" runat="server" placeholder="Details of the items"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-3">
                                    <label>Order No. and Date</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox109" runat="server" placeholder="Order No. and Date"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-3">
                                    <label>Value</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox110" runat="server" placeholder="Value" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>




                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                          <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" OnClientClick="submitForm()" runat="server" Text="Save and Next" />
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
