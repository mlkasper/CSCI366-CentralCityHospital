﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HospitalRecords.Admin.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="UTF-8"/>
	<link rel="icon" type="image/png" sizes="32x32" href="../favicon/favicon-32x32.png"/>
	<link rel="icon" type="image/png" sizes="96x96" href="../favicon/favicon-96x96.png"/>
	<link rel="icon" type="image/png" sizes="16x16" href="../favicon/favicon-16x16.png"/>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../css/styles.css"/>
	<title>Central City Hospital - Registration</title>
	</head>
<body>
    <form id="form1" runat="server">
		<div>
        <div>
			<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a href="Default.aspx" class="navbar-brand"><img src="../img/medicine.svg" alt="" width="54px" height="54px" class="d-inline-block align-top"/></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active"> <a class="nav-link" href="Default.aspx">Home <span class="sr-only">(current)</span></a> </li>
					<li class="nav-item"> <a class="nav-link" href="#">Register</a> </li>
					<li class="nav-item"> <a class="nav-link" href="Manage.aspx">Manage</a> </li>
					<li class="nav-item"> <a class="nav-link" href="SendAnnouncment.aspx">Send Announcment</a></li>
					<li class="nav-item"> <asp:LoginStatus ID="login" class="nav-link" runat="server" /></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="navbar-item"><label id="displayName" class="lead" runat="server"></label></li>
				</ul>
			</div>
			</nav>

			<div class="container-fluid">
				<br /><br />
				<div class="row justify-content-center">
                    <div class="col-md-8">
						<div class="alert alert-danger" hidden="hidden">
							<asp:Label class="text-center" ID="Label1" runat="server" Text=""></asp:Label>
						</div>
                        <div class="card">
                            <div class="card-header text-center">Register A New User</div>
                            <div class="card-body">

                                </div>

                                    <div class="form-group" id="firstName" aria-disabled="False">
                                        <label for="name" class="cols-sm-2 control-label">First Name</label><asp:Label ID="enterFirstName" runat="server" ForeColor="#CC0000"></asp:Label>
										&nbsp;<div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="firstName" id="firstName" placeholder="First Name" runat="server"/>
                                            </div>
                                        </div>
                                    </div>
									<div class="form-group">
										<label for="middleInitial" class="cols-sm-2 control-label">Middle Initial</label><asp:Label ID="enterMiddle" runat="server" ForeColor="#CC0000"></asp:Label>
										&nbsp;<div class="input-group">
											<span class="input-group-addon"><i class="fade fa-user fa" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="middleInitial" id="middleInitial" placeholder="Middle Initial" pattern="[A-Za-z]" maxlength="1" runat="server"/>
										</div>
									</div>
									<div class="form-group">
										<label for="middleInitial" class="cols-sm-2 control-label">Last Name</label><asp:Label ID="enterLastName" runat="server" ForeColor="#CC0000"></asp:Label>
										&nbsp;<div class="input-group">
											<span class="input-group-addon"><i class="fade fa-user fa" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="lastName" id="lastName" placeholder="Last Name" runat="server"/>
										</div>
									</div>
                                    <div class="form-group">
                                        <label for="email" class="cols-sm-2 control-label">Your Email</label><asp:Label ID="enterEmail" runat="server" ForeColor="#CC0000"></asp:Label>
										&nbsp;<div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                <input type="email" class="form-control" name="email" id="email" placeholder="Enter your Email" runat="server"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="phonenumber" class="cols-sm-2 control-label">Your Phone Number</label><asp:Label ID="enterPhoneNumber" runat="server" ForeColor="#CC0000"></asp:Label>
										&nbsp;<div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="phonenumber" id="phoneNumber" placeholder="Enter your phone number" runat="server"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="role" class="cols-sm-2 control-label">User Role</label>
                                        <div class="cols-sm-10">
                                            <select class="form-control" name="role" id="role" runat="server">
												<option>Reception</option>
												<option>Nurse</option>
												<option>Doctor</option>
												<option>Admin</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="cols-sm-2 control-label">Password</label>
										<asp:Label ID="passwordsNotMatch" runat="server" ForeColor="#CC0000"></asp:Label>
										<div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your Password" runat="server"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="confirm" id="confirm" placeholder="Confirm your Password" runat="server"/>
                                            </div>
                                        </div>
                                    </div>
									<div class="form-group">
										<label for="address1" class="cols-sm-2 control-label">Address Line 1</label><asp:Label ID="enterAddress" runat="server" ForeColor="#CC0000"></asp:Label>
&nbsp;<div class="input-group">
											<span class="input-group-addon"><i class="fade fa-user fa" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="address1" id="address1" placeholder="Address Line 1" runat="server"/>
										</div>
									</div>
									<div class="form-group">
										<label for="address2" class="cols-sm-2 control-label">Address Line 2</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fade fa-user fa" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="address2" id="address2" placeholder="Address Line 2" runat="server"/>
										</div>
									</div>
									<div class="form-group">
										<label for="city" class="cols-sm-2 control-label">City</label><asp:Label ID="enterCity" runat="server" ForeColor="#CC0000"></asp:Label>
&nbsp;<div class="input-group">
											<span class="input-group-addon"><i class="fade fa-user fa" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="city" id="city" placeholder="City" runat="server"/>
										</div>
									</div>
									<div class="form-group">
										<label for="address2" class="cols-sm-2 control-label">State</label><asp:Label ID="enterState" runat="server" ForeColor="#CC0000"></asp:Label>
&nbsp;<div class="input-group">
											<span class="input-group-addon"><i class="fade fa-user fa" aria-hidden="true"></i></span>
											<select class="form-control" name="state" id="state" runat="server">
												<option>Select a State</option>
												<option>Alabama</option>
												<option>Alaska</option>
												<option>Arizona</option>
												<option>Arkanas</option>
												<option>California</option>
												<option>Colorado</option>
												<option>Connecticut</option>
												<option>Delaware</option>
												<option>Florida</option>
												<option>Georgia</option>
												<option>Hawaii</option>
												<option>Idaho</option>
												<option>Illinois</option>
												<option>Indiana</option>
												<option>Iowa</option>
												<option>Kansas</option>
												<option>Kentucky</option>
												<option>Louisiana</option>
												<option>Maine</option>
												<option>Maryland</option>
												<option>Massachusetts</option>
												<option>Michigan</option>
												<option>Minnesota</option>
												<option>Mississippi</option>
												<option>Missouri</option>
												<option>Montana</option>
												<option>Nebraska</option>
												<option>Nevada</option>
												<option>New Hampshire</option>
												<option>New Jersey</option>
												<option>New Mexico</option>
												<option>New York</option>
												<option>North Carolina</option>
												<option>North Dakota</option>
												<option>Ohio</option>
												<option>Oklahoma</option>
												<option>Oregon</option>
												<option>Pennsylvania</option>
												<option>Rhode Island</option>
												<option>South Carolina</option>
												<option>South Dakota</option>
												<option>Tennessee</option>
												<option>Texas</option>
												<option>Utah</option>
												<option>Vermont</option>
												<option>Virgina</option>
												<option>Washington</option>
												<option>West Virginia</option>
												<option>Wisconsin</option>
												<option>Wyoming</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="zipcode" class="cols-sm-2 control-label">Zip Code</label><asp:Label ID="enterZipcode" runat="server" ForeColor="#CC0000"></asp:Label>
&nbsp;<div class="input-group">
											<span class="input-group-addon"><i class="fade fa-user fa" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="zipcode" id="zipcode" placeholder="Enter Your Zipcode" title="zipcode" maxlength="5" oninput="this.value=this.value.replace(/[^0-9]/g,'');" runat="server"/>
										</div>
									</div>
                                    <div class="form-group ">
										<asp:Button ID="registerUser" class="btn btn-primary btn-lg btn-block login-button" runat="server" Text="Register" OnClick="registerUser_Click" />
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
			</div>
        </div>
    </form>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
