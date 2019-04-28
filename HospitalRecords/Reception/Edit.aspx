<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="HospitalRecords.Manage" %>

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
    <title>Central City Hospital - Manage</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
			<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a href="Default.aspx" class="navbar-brand"><img src="../img/medicine.svg" alt="" width="54px" height="54px" class="d-inline-block align-top"/></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active"> <a class="nav-link" href="Default.aspx">Home <span class="sr-only">(current)</span></a> </li>
					<li class="nav-item"> <a class="nav-link" href="Register.aspx">New Patient</a> </li>
					<li class="nav-item"> <a class="nav-link" href="CreateAppointment.aspx">New Appointment</a> </li>
					<li class="nav-item"> <a class="nav-link" href="Edit.aspx">Edit Patient</a></li>
					<li class="nav-item"> <asp:LoginStatus class="nav-link" ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" />
					</li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="navbar-item"><label id="displayName" class="lead" runat="server"></label></li>
				</ul>
			</div>
			</nav>
			<div class="container-fluid">
				<br /><br />
				<div class="row">
					<div class="col-lg-4"></div>
					<div class="col-lg-4">
						<div class="alert alert-danger" role="alert" id="userDoesNotExist" runat="server">
							<asp:Label ID="doesNotExistText" class="text-center" runat="server" Text=""></asp:Label>
						</div>
					</div>
					<div class="col-lg-4"></div>

					<div class="col-lg-4"></div>
					<div class="col-lg-4 center-block">
						<div class="input-group">
							<label for="4SSC" class="control-label">Social Security: &nbsp</label>
							<input type="text" class="form-control" id="SSC" placeholder="Patient Social Security Number"  runat="server" />
						</div>
					</div>
					<div class="col-lg-4"></div>
					<div class="col-lg-4"></div>
					<div class="col-lg-4">
						<br />
						<div class="input-group">
							<label for="firstName" class="control-label">First Name: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </label>
							<input type="text" class="form-control" id="firstName" placeholder="Patients First Name" runat="server"/>
						</div>
					</div>
					<div class="col-lg-4"></div>
				</div>
			    <div class="form-group ">
					<br />
					<asp:Button ID="searchPatient" class="btn btn-primary btn-lg btn-block login-button button-width" runat="server" Text="Search" onClick="findPatient"/>
                </div>
			</div>
        </div>
    </form>
</body>
</html>
