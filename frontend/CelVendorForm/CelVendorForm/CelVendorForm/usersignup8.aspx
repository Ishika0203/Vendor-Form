<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup8.aspx.cs" Inherits="CelVendorForm.usersignup8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
    function submitForm() {
        // Get user inputs from form controls
        var InvestmentinPlantandMachinery = document.getElementById("<%= TextBox24.ClientID %>").value;
        var InvestmentinBuildingandInfrastructure = document.getElementById("<%=TextBox25.ClientID %>").value;
        var FundsAvailableformeetingworkingcapital = document.getElementById("<%= TextBox26.ClientID %>").value;
        var SourceOwnCapital = document.getElementById("<%= TextBox27.ClientID %>").value;
        var SourceBorrowed = document.getElementById("<%= TextBox28.ClientID %>").value;
        var BankersName = document.getElementById("<%= TextBox29.ClientID %>").value;
        var BankersAddress = document.getElementById("<%= TextBox1.ClientID %>").value;

        var vendorData = {
            Investment_in_plant_and_machinery: InvestmentinPlantandMachinery,
            Investment_in_building_and_Infrastructure: InvestmentinBuildingandInfrastructure,
            funds_for_working_capital: FundsAvailableformeetingworkingcapital,
            source_owned_capital: SourceOwnCapital,
            source_borrowed: SourceBorrowed,
            banker_name: BankersName,
            banker_address: BankersAddress
        }

        // Make an Axios POST request to your Node.js API
        axios.post("http://localhost:3000/firm/createFinancialBackground", vendorData)
            .then(function (response) {
                // Handle the API response here (e.g., show a success message)
                console.log("API response:", response.data);
                alert("Form submitted successfully!");
                window.location.href = "usersignup9.aspx";
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
                                        <h4>Financial Background</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Investment in Plant and Machinery</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox24" runat="server" placeholder="Investment in Plant and Machinery" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Investment in Building and Infrastructure</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox25" runat="server" placeholder="Investment in Building and Infrastructure" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Funds Available for meeting working capital</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox26" runat="server" placeholder="Funds Available" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-3">
                                    <label>Source : Own Capital</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox27" runat="server" placeholder="Own Capital" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-3">
                                    <label>Source : Borrowed</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox28" runat="server" placeholder="Borrowed Capital" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                            
                        <div class="row">
                            <div class="col-md-6">
                                <label>Banker's Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox29" runat="server" placeholder="Banker's Name"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-6">
                                <label>Banker's Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Banker's Address"></asp:TextBox>
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
