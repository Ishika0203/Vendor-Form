<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup15.aspx.cs" Inherits="CelVendorForm.usersignup15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




 <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var Noofgraduateengineers = document.getElementById("<%= TextBox50.ClientID %>").value;
         var Noofdiplomaholders = document.getElementById("<%= TextBox51.ClientID %>").value;
         var NoofITI = document.getElementById("<%= TextBox52.ClientID %>").value;
         var Noofgraduates= document.getElementById("<%= TextBox53.ClientID %>").value;
         var Noofotherstaff= document.getElementById("<%= TextBox54.ClientID %>").value;
         var Nooftotalemployees = document.getElementById("<%= TextBox55.ClientID %>").value;

         var vendorData = {
             graduate_engineers: Noofgraduateengineers,
             diploma_holders: Noofdiplomaholders,
             iti: NoofITI,
             graduates: Noofgraduates,
             other_staff: Noofotherstaff,
             total_employees: Nooftotalemployees
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createManpowerDetails", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                 window.location.href = "usersignup16.aspx";
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
                                    <h6>General: Technical </h6>
                            </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>No. of graduate engineers</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox50" runat="server" placeholder="No. of graduate engineers" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of diploma holders</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox51" runat="server" placeholder="No. of diploma holders" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of ITI</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox52" runat="server" placeholder="No. of ITI" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <h6>General: Non-Technical </h6>
                            </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>No. of graduates</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox53" runat="server" placeholder="No. of graduates" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of other staff</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox54" runat="server" placeholder="No. of other staff" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>No. of total employees</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox55" runat="server" placeholder="No. of total employees" TextMode="Number"></asp:TextBox>
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
