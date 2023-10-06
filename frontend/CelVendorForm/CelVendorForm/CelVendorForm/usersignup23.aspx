<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup23.aspx.cs" Inherits="CelVendorForm.usersignup23" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var Noofmanagers = document.getElementById("<%= TextBox98.ClientID %>").value;
         var Noofengineers = document.getElementById("<%= TextBox99.ClientID %>").value;
         var Noofsupervisors = document.getElementById("<%= TextBox100.ClientID %>").value;
  	     var Noofskilledworkers = document.getElementById("<%= TextBox101.ClientID %>").value;
         var Noofsemiskilledworkers = document.getElementById("<%= TextBox102.ClientID %>").value;
         var Noofunskilledworkers = document.getElementById("<%= TextBox103.ClientID %>").value;

         var vendorData = {
             total_manager: Noofmanagers,
             total_engineer: Noofengineers,
             total_supervisor: Noofsupervisors,
             total_skilled: Noofskilledworkers,
             total_semi_skilled: Noofsemiskilledworkers,
             total_unskilled: Noofunskilledworkers,
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createTotalManpower", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                 window.location.href = "usersignup24.aspx";
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
                                    <h6>Total:</h6>
                            </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>No. of managers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox98" runat="server" placeholder="No. of managers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of engineers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox99" runat="server" placeholder="No. of engineers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of supervisors</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox100" runat="server" placeholder="No. of supervisors" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>No. of skilled workers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox101" runat="server" placeholder="No. of skilled workers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of Semi-skilled workers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox102" runat="server" placeholder="No. of Semi-skilled workers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of Un-skilled workers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox103" runat="server" placeholder="No. of Un-skilled workers" TextMode="Number"></asp:TextBox>
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
