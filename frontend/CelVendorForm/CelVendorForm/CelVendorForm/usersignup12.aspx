<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup12.aspx.cs" Inherits="CelVendorForm.usersignup12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var Detailsofthetestequipment = document.getElementById("<%= TextBox40.ClientID %>").value;
         var Make = document.getElementById("<%= TextBox41.ClientID %>").value;
         var Ageoftestequpment= document.getElementById("<%= TextBox42.ClientID %>").value;
         var Accuracy= document.getElementById("<%= TextBox43.ClientID %>").value;
         var Noofequipment = document.getElementById("<%= TextBox44.ClientID %>").value;


         var vendorData = {
             Details_of_the_Test_Equipment : Detailsofthetestequipment,
            Make  : Make,
             Age_of_Test_Equipment : Ageoftestequpment,
            Accuracy : Accuracy,
            No_of_Equipment_Available : Noofequipment 
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createQualityFactors", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                 window.location.href = "usersignup13.aspx";
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
                                    <h4>Quality Factors</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <h6>Test and Inspection equipment available(for the items registartion is sought for)</h6>
                                </div>
                            </div>
                         
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Details of the test equipment</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox40" runat="server" placeholder="Details of the test equipment"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-3">
                                    <label>Make</label>
                                    <br />
                                    <br />
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox41" runat="server" placeholder="Make"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-2">
                                    <label>Age of test equipment</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox42" runat="server" placeholder="Age of test equpment" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-2">
                                    <label>Accuracy</label>
                                    <br />
                                    <br />
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox43" runat="server" placeholder="Accuracy" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-2">
                                    <label>No. of equipment</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox44" runat="server" placeholder="No. of equipment" TextMode="Number"></asp:TextBox>
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
