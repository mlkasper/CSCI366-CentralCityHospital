<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendAnnouncment.aspx.cs" Inherits="HospitalRecords.Admin.SendAnnouncment" %>

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
	<title>Central City Hospital - Send Announcment</title>
	<style type="text/css">
		.auto-style1 {
			width: 100%;
			height: 400px; 
		}
	</style>
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
					<li class="nav-item"> <a class="nav-link" href="Register.aspx">Register</a> </li>
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
				<div class="card-header text-center">Send a New Announcment</div>
				<div class="card-body">
					<div class="form-group" id="message" aria-disabled="False">
						<label for="message" class="cols-sm-2 control-label">Message</label>
							<div class="input-group">
								  <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
								  <input id="announcmentMessage" type="text" class="auto-style1 form-control" TextMode="MultiLine" runat="server" />
							</div>
					</div>
                    <div class="form-group ">
						<asp:Button ID="sendMessage" class="btn btn-primary btn-lg btn-block login-button" runat="server" Text="Send Announcment" OnClick="sendMessage_Click" />
                    </div>
				</div>
			</div>
        </div>
    </form>
</body>
</html>
