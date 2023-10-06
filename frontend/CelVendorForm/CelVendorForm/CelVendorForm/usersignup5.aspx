<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup5.aspx.cs" Inherits="CelVendorForm.usersignup5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var Nameofthecontactperson = document.getElementById("<%= TextBox15.ClientID %>").value;
         var Designation = document.getElementById("<%= TextBox16.ClientID %>").value;
         var Addressoftheconatactperson= document.getElementById("<%= TextBox4.ClientID %>").value;
         var TelephoneNumberofcontactperson= document.getElementById("<%= TextBox2.ClientID %>").value;
         var MobileNumberoftheconatactperson= document.getElementById("<%= TextBox17.ClientID %>").value;
         var FaxNumberofContactperson= document.getElementById("<%= TextBox1.ClientID %>").value;
         var EmailIDofthecontactperson= document.getElementById("<%= TextBox18.ClientID %>").value;


         var vendorData = {
             name: Nameofthecontactperson,
             designation: Designation,
             address  : Addressoftheconatactperson,
             tel_no :TelephoneNumberofcontactperson ,
             mobile_no: MobileNumberoftheconatactperson,
             fax_no: FaxNumberofContactperson,
             email_id : EmailIDofthecontactperson
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createContactPerson", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                  window.location.href = "usersignup6.aspx";
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
                                        <h4>Details of Contact Person</h4>
                                    </center>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-6">
                                    <label>Name of the contact person</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox15" runat="server" placeholder="Name of the contact person"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Designation</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox16" runat="server" placeholder="Designation"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label>Address of the conatact person</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Address"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Telephone Number of contact person</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Telephone Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Mobile Number of the conatact person</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox17" runat="server" placeholder="Mobile Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Fax Number of Contact person</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Fax Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Email ID of the contact person</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox18" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                                                     <div>
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
