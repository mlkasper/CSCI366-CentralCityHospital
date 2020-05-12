<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HospitalRecords.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="UTF-8"/>
	<link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png"/>
	<link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png"/>
	<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png"/>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/login.css"/>
	<title>Central City Hospital - Login</title>
</head>
<body class="text-center">
    <form id="form1" class="form-signin offset-xl-4" runat="server">
		<div>
			<asp:image runat="server" ImageUrl="~/img/logo.svg" Width="72" Height="72"></asp:image>
			<h1 class="h3 mb-3 font-weight-normal">Centeral City Hospital</h1>
			<h1 class="h3 mb-3 font-weight-normal">Sign In</h1>
			<div class="alert alert-danger" role="alert" id="usernameOrPasswordError" runat="server" visible="false"> <!-- An alert if the Username or password is incorrect -->
				Username or password does not match what is on file. Try again.
			</div>
			<label for="inputUsername" class="sr-only">Email address</label>
			<input id="inputUsername" class="form-control" placeholder="Username" required autofocus type="text" runat="server"/>
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="inputPassword" class="form-control" placeholder="Password" required runat="server" />
			<asp:Button ID="submitLogin" class="btn btn-lg btn-primary btn-block" runat="server" Text="Sign in" OnClick="submitLogin_Click" />
			 <p class="mt-5 mb-3 text-muted disclaimer">Electronic Protected Health Information. The HIPAA Privacy Rule protects the privacy of individually identifiable health information, called protected health information (PHI), as explained in the Privacy Rule and <a href="https://www.hhs.gov/hipaa/for-professionals/privacy/special-topics/de-identification/index.html">here</a>. 
			 The Security Rule protects a subset of information covered by the Privacy Rule, which is all individually identifiable health information a covered entity creates, receives, maintains or transmits in electronic form. The Security Rule calls this information “electronic protected health information” (e-PHI).3 The Security Rule does not apply to PHI transmitted orally or in writing.</p>
		</div>
    </form>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
