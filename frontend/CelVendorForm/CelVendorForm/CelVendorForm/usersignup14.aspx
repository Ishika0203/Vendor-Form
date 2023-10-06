<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup14.aspx.cs" Inherits="CelVendorForm.usersignup14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {

         
         var AreyouandISOcertifiedcompany = document.getElementById('<%= YesNoCheckBoxList.ClientID %>');
             var selectedValue1 = "";

             // Loop through the checkboxes to find the selected one
         for (var i = 0; i < AreyouandISOcertifiedcompany.getElementsByTagName('input').length; i++) {
             if (AreyouandISOcertifiedcompany.getElementsByTagName('input')[i].checked) {
                 selectedValue1 = AreyouandISOcertifiedcompany.getElementsByTagName('input')[i].value;
                     break; // Exit the loop after finding the first selected checkbox
                 }
             }


         var AreyourproductsBISapproved = document.getElementById('<%= YesNoCheckBoxList.ClientID %>');
         var selectedValue2 = "";

         // Loop through the checkboxes to find the selected one
         for (var i = 0; i < AreyourproductsBISapproved.getElementsByTagName('input').length; i++) {
             if (AreyourproductsBISapproved.getElementsByTagName('input')[i].checked) {
                 selectedValue2 = AreyourproductsBISapproved.getElementsByTagName('input')[i].value;
                 break; // Exit the loop after finding the first selected checkbox
             }
         }


         // Get user inputs from form controls
        // var AreyouandISOcertifiedcompany = document.getElementById("<%= YesNoCheckBoxList.ClientID %>").value;
         //var AreyourproductsBISapproved = document.getElementById("<%= CheckBoxList1.ClientID %>").value;
         var Isyourfirmapprovedforanyothercertification= document.getElementById("<%= TextBox49.ClientID %>").value;
        
        
         var vendorData = {
             iso_certified:selectedValue1 ,
             bis_approved: selectedValue2,
             other_certificate: Isyourfirmapprovedforanyothercertification ,        
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createCompanyCertificates", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                  window.location.href = "usersignup15.aspx";
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
                                        <h4>Quality Approvals / Certification</h4>
                                    </center>
                                </div>
                        </div>

                        <div class="row">
                        <label>Are you and ISO certified company?</label>
                        <asp:CheckBoxList ID="YesNoCheckBoxList" runat="server"  RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes" />
                                <asp:ListItem Text="No" Value="No" />
                        </asp:CheckBoxList>
                        </div>

                        <div class="row">
                        <label>Are your products BIS approved?</label>
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server"  RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes" />
                                <asp:ListItem Text="No" Value="No" />
                        </asp:CheckBoxList>
                        </div>
 
                        <div class="row">
                            <div class="col">
                                <label>Is your firm approved for any other certification (LCSO,CACT,RDSO,C-DOT,etc)</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox49" runat="server" placeholder="Any other certification"></asp:TextBox>
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
