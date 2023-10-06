<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="CelVendorForm.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var Username = document.getElementById("<%= TextBox1.ClientID %>").value;
         var Password = document.getElementById("<%= TextBox2.ClientID %>").value;

         var vendorData = {
             username: Username,
             password: Password,
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/signup", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 window.location.href = "usersignup1.aspx";
                 alert("Successfully signedup !");
             })
             .catch(function (error) {
                 // Handle errors (e.g., show an error message)
                 console.error("API error:", error);
                 alert("Error signing up.");
             });
     }

 </script>

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="150px" src="imgs/generaluser.png" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h3>Member signup</h3>
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
                                    <label>Username</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Username"></asp:TextBox>
                                    </div>
                                    <label>Password</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                             <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" OnClientClick="submitForm()" runat="server" Text="Signup" />

                            </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br /><br />
            </div>
        </div>
    </div>

</asp:Content>
