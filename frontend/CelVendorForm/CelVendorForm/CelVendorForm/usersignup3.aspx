<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup3.aspx.cs" Inherits="CelVendorForm.usersignup3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
   <script>
       function submitForm() {
           // Get user inputs from form controls
           var HeadOfficeTelNumber  = document.getElementById("<%= TextBox1.ClientID %>").value;
           var HeadOfficeMobileNumber  = document.getElementById("<%= TextBox2.ClientID %>").value;
           var HeadOfficeFax = document.getElementById("<%= TextBox3.ClientID %>").value;
           var HeadOfficeMailID = document.getElementById("<%= TextBox4.ClientID %>").value;
           var HeadOfficeAddress  = document.getElementById("<%= TextBox5.ClientID %>").value;


           var vendorData = {
               tel_no : HeadOfficeTelNumber,
               mobile_no  : HeadOfficeMobileNumber,
               fax_no :HeadOfficeFax,
               email_id: HeadOfficeMailID,
               address: HeadOfficeAddress
           };

           // Make an Axios POST request to your Node.js API
           axios.post("http://localhost:3000/firm/createHeadOffice", vendorData)
               .then(function (response) {
                   // Handle the API response here (e.g., show a success message)
                   console.log("API response:", response.data);
                   alert("Form submitted successfully!");
                    window.location.href = "usersignup4.aspx";
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
                                        <h4>Head Office details</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Head Office Telephone Number</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Head Office Telephone Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Head Office Mobile Number</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Head Office Mobile Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Head Office Fax Number</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Head Office Fax Number" TextMode="Number" ></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Head Office email id</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Head Office email id"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label>Head Office Address</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Head Office Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
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
