<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BacklistedVendor.aspx.cs" Inherits="CelVendorForm.BacklistedVendor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section>
     <img src="imgs/fghgrh.jpg" class="img-fluid" width="100%" />
</section>

            <div class="row">
            <div class="col-md-5 mx-auto">
                <label>POLICY ON BANNING OF BUSINESS DEALINGS</label>
                <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Document Name</th>
                    <th scope="col">Download</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">Policy on Banning of Business Dealings</th>
                    <td>
                        <a href="Files%20Download/FINAL%20DOCUMENT%20ON%20BANNING-9-12-2020%20(1).pdf" downlaod>Download</a>
                    </td>
                </tr>
            </tbody>
            </table>
            </div>
            </div>

        <br />
        <br />
        <br />

        <div class="row">
        <div class="col-md-5 mx-auto">
            <label>Backlisted Vendors:</label>
            <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Vendor Name</th>
                <th scope="col">City</th>
                <th scope="col">Address</th>
                <th scope="col">Backlisted Date</th>

            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">M/s. Punam Energy Pvt. Ltd.</th>
                <td>Kolkata</td>
                <td>1A, D.L. Khan Road, Kolkata, West Bengal, Pin Code 700027</td>
                <td>30 Nov, 2021</td>    
            </tr>
            <tr>
                <th scope="row">M/s THANDON INFRASTRUCTURE PVT. LTD.</th>
                <td>HYDERABAD</td>
                <td>M/s. Thandon Infrastructure Pvt. Ltd., 4 th Floor, #26, Durga Nagar Colony, Ameerpet, Hyderabad - 500016</td>
                <td>22 Feb, 2019</td>
            </tr>
            <tr>
                <th scope="row">M/s Samavartan Business Pvt. Ltd.</th>
                <td>Lucknow</td>
                <td>M/s. Samavartan Business Pvt. Ltd., 1/246 Ground Floor Vastu Khand, Gomti Nagar Lucknow-226010</td>
                <td>23 May, 2019</td>
            </tr>
            </tbody>
            </table>
        </div>
        </div>
        <center>
        <br />
        <br />

</asp:Content>
