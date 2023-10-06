<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup13.aspx.cs" Inherits="CelVendorForm.usersignup13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
     function submitForm() {
         // Get user inputs from form controls
         var Inwardinspectionfortheboughtoutitems = document.getElementById("<%= TextBox45.ClientID %>").value;
         var InprocessStageinspection = document.getElementById("<%= TextBox46.ClientID %>").value;
         var Finalinspection = document.getElementById("<%= TextBox47.ClientID %>").value;
         var Calibrationoftestandmeasuringequipment = document.getElementById("<%= TextBox48.ClientID %>").value;
         

         var vendorData = {
             Inward_inspection_for_bought_out_items : Inwardinspectionfortheboughtoutitems ,
            In_process_Stage_inspection : InprocessStageinspection,
             Final_inspection : Finalinspection ,
           Calibration_of_test_and_measuring_equipment  : Calibrationoftestandmeasuringequipment ,  
         };

         // Make an Axios POST request to your Node.js API
         axios.post("http://localhost:3000/firm/createDetailsofProcedure", vendorData)
             .then(function (response) {
                 // Handle the API response here (e.g., show a success message)
                 console.log("API response:", response.data);
                 alert("Form submitted successfully!");
                 window.location.href = "usersignup14.aspx";
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
                                    <h5>Details of procedures adopted for:</h5>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Inward inspection for the bought out items</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox45" runat="server" placeholder="Inward inspection for the bought out items"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>In process/Stage inspection</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox46" runat="server" placeholder="In process/Stage inspection"></asp:TextBox>
                                        </div>
                                </div>
                             </div>
                             <div class="row">
                                <div class="col-md-6">
                                    <label>Final inspection</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox47" runat="server" placeholder="Final inspection"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Calibration of test and measuring equipment</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox48" runat="server" placeholder="Calibration of test and measuring equipment"></asp:TextBox>
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
