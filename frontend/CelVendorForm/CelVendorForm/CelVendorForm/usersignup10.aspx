<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup10.aspx.cs" Inherits="CelVendorForm.usersignup10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var Nameofthemachine = document.getElementById("<%= TextBox32.ClientID %>").value;
         var MakeandModel = document.getElementById("<%= TextBox33.ClientID %>").value;
         var Ageofmachine = document.getElementById("<%= TextBox34.ClientID %>").value;
         var Accuracy = document.getElementById("<%= TextBox35.ClientID %>").value;
         var Noofmachineavailable= document.getElementById("<%= TextBox36.ClientID %>").value;
         var MachinewiseInstalledCapacity= document.getElementById("<%= TextBox38.ClientID %>").value;
         var MachinewiseUtilisedCapacity= document.getElementById("<%= TextBox39.ClientID %>").value;

         var vendorData = {
            
             machine_name: Nameofthemachine,
             make_and_model: MakeandModel,
             age_of_machine: Ageofmachine,
             accuracy: Accuracy,
             no_of_machine: Noofmachineavailable,
             installed_capacity: MachinewiseInstalledCapacity,
             utilised_capacity: MachinewiseUtilisedCapacity,
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createPlantMachineryAndProductionEquipment", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                  window.location.href = "usersignup11.aspx";
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
                                    <h5>Details of Plant,Machinery and Production Equipment available ( For the items registration is sought for)</h5>
                                    </center>
                                </div>
                            </div>
                         
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Name of the machine</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox32" runat="server" placeholder="Name of the machine"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Make and Model</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox33" runat="server" placeholder="Make and Model"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">
                                    <br />
                                    <label>Age of machine</label>
                                    <br />
                                    <br />
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox34" runat="server" placeholder="Age of machine" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <br />
                                    <label>Accuracy</label>
                                    <br />
                                    <br />
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox35" runat="server" placeholder="Accuracy" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <label>No. of machine available</label>
                                    <br />
                                    <br />
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox36" runat="server" placeholder="No. of machine available" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-2">
                                    <label>Machine-wise Installed Capacity</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox38" runat="server" placeholder="Installed Capacity" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-2">
                                    <label>Machine-wise Utilised Capacity</label>
                                    <br />
                                    <br />
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox39" runat="server" placeholder="Utilised Capacity" TextMode="Number"></asp:TextBox>
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
