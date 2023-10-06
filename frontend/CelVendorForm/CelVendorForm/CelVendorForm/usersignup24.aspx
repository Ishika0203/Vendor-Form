<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup24.aspx.cs" Inherits="CelVendorForm.usersignup24" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var Year = document.getElementById("<%= TextBox104.ClientID %>").value;
         var Turnover = document.getElementById("<%= TextBox105.ClientID %>").value;
         var ProfitLoss = document.getElementById("<%= TextBox108.ClientID %>").value;

         var vendorData = {
             Year: Year,
             Turnover: Turnover,
             Profit_Loss: ProfitLoss,
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createTurnover", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                 window.location.href = "usersignup25.aspx";
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
                                        <h4>Turnover during the last year</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>Year</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox104" runat="server" placeholder="Year" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Turnover</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox105" runat="server" placeholder="Turnover" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Profit/Loss</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox108" runat="server" placeholder="Profit/Loss" TextMode="Number"></asp:TextBox>
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
                <a href="homepage.aspx"><< Back to Home</a><br /><br />
            </div>
        </div>    
    </div>

</asp:Content>
