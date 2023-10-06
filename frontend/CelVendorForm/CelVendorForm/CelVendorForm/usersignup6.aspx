<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup6.aspx.cs" Inherits="CelVendorForm.usersignup6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var RegistrationNumberwithDirectorateofIndustriesifregistered= document.getElementById("<%= TextBox13.ClientID %>").value;
         var IncaseofMicrosmallindustryRegnNo= document.getElementById("<%= TextBox19.ClientID %>").value;
         var Statusofthefirm= document.getElementById("<%= DropDownList3.ClientID %>").value;
   
         var vendorData = {
            reg_no_directorate : RegistrationNumberwithDirectorateofIndustriesifregistered,
             reg_no_small_industry  :  IncaseofMicrosmallindustryRegnNo,
             status_of_firm : Statusofthefirm
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createStatusOfIndustry", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                  window.location.href = "usersignup7.aspx";
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
                                        <h4>Details of Registration Number</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Registration Number with Directorate of Industries , if registered</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="Registration Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>In case of Micro/small industry, Regn. No.</label>
                                    <br />
                                    <br />
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox19" runat="server" placeholder="registration Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
      
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Status of the firm (Please enclose partnership deed or proof of incorporation , whichever is applicable)</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                                                <asp:ListItem Text="Select" Value="select" />
                                                <asp:ListItem Text="Proprietary" Value="Proprietary" />
                                                <asp:ListItem Text="Partnership" Value="Partnership" />
                                                <asp:ListItem Text="Private Limited" Value="Private Limited" />
                                                <asp:ListItem Text="Public Limited" Value="Public Limited" />
                                                <asp:ListItem Text="PSU" Value="PSU" />
                                            </asp:DropDownList>
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
