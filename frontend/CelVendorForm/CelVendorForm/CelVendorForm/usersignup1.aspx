<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup1.aspx.cs" Inherits="CelVendorForm.usersignup1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <script>
      function submitForm() {
          // Get user inputs from form controls
          var firmName = document.getElementById("<%= TextBox1.ClientID %>").value;
           var businessNature = document.getElementById("<%= DropDownList2.ClientID %>").value;
          var materialsServices = document.getElementById("<%= TextBox10.ClientID %>").value;

          // Create an object with the data
          var vendorData = {
              firm_name: firmName,
              nature_of_business: businessNature,
              materials_services_interest : materialsServices
          };

          // Make an Axios POST request to your Node.js API
          axios.post("http://localhost:3000/firm/createBasicFirmInfo", vendorData)
              .then(function (response) {
                  // Handle the API response here (e.g., show a success message)
                  console.log("API response:", response.data);
                  alert("Form submitted successfully!");
                  window.location.href = "usersignup2.aspx";
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
                                    <label>Name of the Firm</label>
                                        <div class="form-group">
                                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Name of the Firm"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Nature of your business (In case of dealer, dealership certificate from the principals must be enclosed)</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                                <asp:ListItem Text="Select" Value="select" />
                                                    <asp:ListItem Text="Manufacturer" Value="manufacturer" />
                                                    <asp:ListItem Text="Dealer" Value="Dealer" />
                                                    <asp:ListItem Text="Trader" Value="Trader" />
                                                    <asp:ListItem Text="Service Provider" Value="Service Provider" />
                                                </asp:DropDownList>
                                        </div>
                                </div>
                          
                                <div class="col-md-6">
                                <label>Name of materials/services  you are interested in supplying/providing</label>
                                    <br /><br />
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Name of materials/services" ></asp:TextBox>
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
