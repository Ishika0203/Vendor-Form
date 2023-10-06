<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup22.aspx.cs" Inherits="CelVendorForm.usersignup22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var NoOfManagers = document.getElementById("<%= TextBox92.ClientID %>").value;
         var NoOfEngineers = document.getElementById("<%= TextBox93.ClientID %>").value;
         var NoOfSupervisors = document.getElementById("<%= TextBox94.ClientID %>").value;
         var NoOfSkilledWorkers = document.getElementById("<%= TextBox95.ClientID %>").value;
         var NoOfSemiskilledWorkers  = document.getElementById("<%= TextBox96.ClientID %>").value;
         var NoOfUnskilledWorkers  = document.getElementById("<%= TextBox97.ClientID %>").value;

         var vendorData = {
             others_manager: NoOfManagers,
             others_engineer: NoOfEngineers,
             others_supervisor: NoOfSupervisors,
             others_skilled: NoOfSkilledWorkers,
             others_semi_skilled: NoOfSemiskilledWorkers,
             others_unskilled: NoOfUnskilledWorkers
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createOtherManpower", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                console.log("API response:", response.data);
                alert("Form submitted successfully!");
                window.location.href = "usersignup23.aspx";
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
                                    <h6>Others:</h6>
                            </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>No. of managers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox92" runat="server" placeholder="No. of managers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of engineers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox93" runat="server" placeholder="No. of engineers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of supervisors</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox94" runat="server" placeholder="No. of supervisors" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>No. of skilled workers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox95" runat="server" placeholder="No. of skilled workers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of Semi-skilled workers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox96" runat="server" placeholder="No. of Semi-skilled workers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of Un-skilled workers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox97" runat="server" placeholder="No. of Un-skilled workers" TextMode="Number"></asp:TextBox>
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
