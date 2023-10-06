<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup4.aspx.cs" Inherits="CelVendorForm.usersignup4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var DelhiOfficeTelephoneNumber = document.getElementById("<%= TextBox1.ClientID %>").value;
         var DelhiOfficeMobileNumber = document.getElementById("<%= TextBox2.ClientID %>").value;
         var DelhiOfficeFaxNumber= document.getElementById("<%= TextBox3.ClientID %>").value;
         var DelhiOfficeemailid = document.getElementById("<%= TextBox4.ClientID %>").value;
         var DelhiOfficeAddress = document.getElementById("<%= TextBox5.ClientID %>").value;


         var vendorData = {
             tel_no : DelhiOfficeTelephoneNumber,
             mobile_no  : DelhiOfficeMobileNumber ,
             fax_no :DelhiOfficeFaxNumber ,
             email_id: DelhiOfficeemailid ,
             address: DelhiOfficeAddress 
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createDelhiOffice", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                  window.location.href = "usersignup5.aspx";
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
                                        <h4>Delhi Office details</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Delhi Office Telephone Number</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Delhi Office Telephone Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Delhi Office Mobile Number</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Delhi Office Mobile Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Delhi Office Fax Number</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Delhi Office Fax Number" TextMode="Number" ></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Delhi Office email id</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Delhi Office email id"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label>Delhi Office Address</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Delhi Office Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
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
