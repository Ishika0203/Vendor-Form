<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="CelVendorForm.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
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
                                        <h4>Your Profile</h4>
                                        <span>Account Status - </span>
                                        <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Your Status"></asp:Label>



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
                                    <label>Name of the Firm</label>
                                        <div class="form-group">
                                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Name of the Firm"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Nature of your business (In case of dealer, dealership certificate from the principals must be enclosed)</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                                <asp:ListItem Text="Select" Value="select" />
                                                    <asp:ListItem Text="Manufacturer" Value="manufacturer" />
                                                    <asp:ListItem Text="Dealer" Value="Dealer" />
                                                    <asp:ListItem Text="Trader" Value="Trader" />
                                                    <asp:ListItem Text="Service Provider" Value="Service Provider" />
                                                </asp:DropDownList>
                                        </div>
                                </div>
                          
                                <div class="col-md-6">
                                <label>Name of materials/services  you are interested in supplying/providing</label>
                                    <br /><br />
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Name of materials/services" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label>Factory Complete Address with Telephone Number,Fax Number and email-id</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Factory Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col">
                                    <label>Head Office Complete Address with Telephone Number,Fax Number and email-id</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" placeholder="Head Office Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label>Delhi Office Complete Address with Telephone Number,Fax Number and email-id</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Delhi Office Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        </div>
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
                                <div class="col-md-6">
                                    <label>Mobile Number of the conatact person</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox17" runat="server" placeholder="Mobile Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Email ID of the contact person</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox18" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                        </div>
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
                                    <label>Nature of your business (In case of dealer, dealership certificate from the principals must be enclosed)</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                                                <asp:ListItem Text="Select" Value="select" />
                                                <asp:ListItem Text="Manufacturer" Value="manufacturer" />
                                                <asp:ListItem Text="Dealer" Value="Dealer" />
                                                <asp:ListItem Text="Trader" Value="Trader" />
                                                <asp:ListItem Text="Service Provider" Value="Service Provider" />
                                            </asp:DropDownList>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Details of Factory/Firm</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Total Area of the Factory and Covered Area</label>
                                    <br />
                                    <br />
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox20" runat="server" placeholder="Total Area of the Factory" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Whether premises owned or on rent and type of construction</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox21" runat="server" placeholder="Premises owned or on rent and type of construction"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Power Connected</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox22" runat="server" placeholder="Power Connected" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Capacity of the generator</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox23" runat="server" placeholder="Capacity of the Generator" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Financial Background</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Investment in Plant and Machinery</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox24" runat="server" placeholder="Investment in Plant and Machinery" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Investment in Building and Infrastructure</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox25" runat="server" placeholder="Investment in Building and Infrastructure" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Funds Available for meeting working capital</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox26" runat="server" placeholder="Funds Available" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-3">
                                    <label>Source : Own Capital</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox27" runat="server" placeholder="Own Capital" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-3">
                                    <label>Source : Borrowed</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox28" runat="server" placeholder="Borrowed Capital" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                            
                        <div class="row">
                            <div class="col">
                                <label>Banker's Name and Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox29" runat="server" placeholder="Banker's Name and Address"></asp:TextBox>
                                    </div>
                            </div>
                        </div>


                        <br />
                        <br />
                        <br />
                        <br />

                            <div class="row">
                                <div class="col">
                                    <center>
                                    <span class="badge badge-pill badge-info">Login Credentials</span>
                                    </center>
                                    </div>
                                </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>User Id</label>
                                        <div class="form-group">
                                            <asp:TextBox Class="form-control" ID="TextBox8" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Old Password</label>
                                        <div class="form-group">
                                            <asp:TextBox Class="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                        </div>
                                </div>

                                <div class="col-md-4">
                                    <label>New Password</label>
                                        <div class="form-group">
                                            <asp:TextBox Class="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        </div>
                                </div>


                            </div>

                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <center>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" />
                                    </div>
                                    </center>
                                </div>
                            </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br /><br />
            </div>

            <div class="col-md-7">
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
                                    <h4>Your Issued Books</h4>
                                        <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Your Books Info"></asp:Label>
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
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>
 
                    </div>
                </div>
            </div>

        </div>    
    </div>

</asp:Content>
