<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PurchaseOrdersIssued.aspx.cs" Inherits="CelVendorForm.PurchaseOrderIssued" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
     <img src="imgs/fghgrh.jpg" class="img-fluid" width="100%" />
    </section>

    <div class="row">
    <div class="col-md-5 mx-auto">
    <label>Purchase Orders awarded against enquiries & tender :</label>
    <table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Document Name</th>
        <th scope="col">Download</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">PO-April-Oct2016.pdf</th>
        <td>
            <a href="Files%20Download/PO-April-Oct2016.pdf" downlaod>Download</a>
        </td>
    </tr>
</tbody>
</table>
</div>
</div>
    <br />
    <br />

</asp:Content>
