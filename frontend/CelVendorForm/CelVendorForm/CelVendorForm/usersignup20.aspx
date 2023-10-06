<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup20.aspx.cs" Inherits="CelVendorForm.usersignup20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var NoOfManagers = document.getElementById("<%= TextBox80.ClientID %>").value;
         var NoOfEngineers = document.getElementById("<%= TextBox81.ClientID %>").value;
         var NoOfSupervisors = document.getElementById("<%= TextBox82.ClientID %>").value;
         var NoOfSkilledWorkers = document.getElementById("<%= TextBox83.ClientID %>").value;
         var NoOfSemiskilledWorkers  = document.getElementById("<%= TextBox84.ClientID %>").value;
         var NoOfUnskilledWorkers  = document.getElementById("<%= TextBox85.ClientID %>").value;

         var vendorData = {
             purchase_manager: NoOfManagers,
             purchase_engineer: NoOfEngineers,
             purchase_supervisor: NoOfSupervisors,
             purchase_skilled: NoOfSkilledWorkers,
             purchase_semi_skilled: NoOfSemiskilledWorkers,
             purchase_unskilled: NoOfUnskilledWorkers
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createPurchaseManpower", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form  submitted successfully!");
                 window.location.href = "usersignup21.aspx";
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
                                        <h4>Details of Manpower</h4>
                                    </center>
                                </div>
                        </div>

                            <div class="row">
                                <div class="col">
                                    <h6>Purchase:</h6>
                            </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>No. of managers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox80" runat="server" placeholder="No. of managers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of engineers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox81" runat="server" placeholder="No. of engineers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of supervisors</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox82" runat="server" placeholder="No. of supervisors" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>No. of skilled workers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox83" runat="server" placeholder="No. of skilled workers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of Semi-skilled workers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox84" runat="server" placeholder="No. of Semi-skilled workers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of Un-skilled workers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox85" runat="server" placeholder="No. of Un-skilled workers" TextMode="Number"></asp:TextBox>
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
