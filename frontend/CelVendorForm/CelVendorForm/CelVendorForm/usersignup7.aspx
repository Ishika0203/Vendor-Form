<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup7.aspx.cs" Inherits="CelVendorForm.usersignup7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var TotalAreaoftheFactory = document.getElementById("<%= TextBox20.ClientID %>").value;
         var Whetherpremisesownedoronrent = document.getElementById("<%= TextBox21.ClientID %>").value;
         var  Coveredareaandtypeofconstruction = document.getElementById("<%= TextBox1.ClientID %>").value;
         var  PowerConnected= document.getElementById("<%= TextBox22.ClientID %>").value;
         var Capacityofthegenerator = document.getElementById("<%= TextBox23.ClientID %>").value;

         var vendorData = {
             Total_area_of_factory: TotalAreaoftheFactory,
             Premises_owned_or_on_rent: Whetherpremisesownedoronrent,
             Covered_area_and_type_of_construction: Coveredareaandtypeofconstruction,
             Power_Connected: PowerConnected,
             Capacity_of_generator: Capacityofthegenerator,
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createFirmFactoryDetails", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                  window.location.href = "usersignup8.aspx";
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
                                        <h4>Details of Factory/Firm</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Total Area of the Factory</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox20" runat="server" placeholder="Total Area of the Factory" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Whether premises owned or on rent</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox21" runat="server" placeholder="Premises owned or on rent"></asp:TextBox>
                                        </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col">
                                    <label>Covered area and type of construction</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Power Connected"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Power Connected</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox22" runat="server" placeholder="Power Connected" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Capacity of the generator</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox23" runat="server" placeholder="Capacity of the Generator" TextMode="Number"></asp:TextBox>
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
