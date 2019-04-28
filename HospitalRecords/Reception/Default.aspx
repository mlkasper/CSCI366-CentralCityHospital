<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HospitalRecords.Reception.Default" %>

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
    <title>Central City Hospital - Reception</title>
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
					<li class="nav-item">
						<asp:LoginStatus class="nav-link" ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" /></li>
					
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="navbar-item"><label id="displayName" class="lead" runat="server"></label></li>
				</ul>
			</div>
			</nav>
			<div class="container-fluid">
				<div class="jumbotron">
					<h1 class="display-4">Announcments</h1>
					<p class="lead">Hospital Announcments</p>
					<p class="lead" id="isAnnouncment" runat="server">There are currently no announcments. Check back later.</p>

				</div>
			</div>
        </div>
    	<asp:GridView ID="ReceptionAnnouncmentGridview" runat="server" AutoGenerateColumns="False" DataSourceID="AnnouncmentSource" class="table table-striped">
			<Columns>
				<asp:BoundField DataField="announcmentDate" HeaderText="Date Sent" SortExpression="announcmentDate" />
				<asp:BoundField DataField="announcmentMessage" HeaderText="Message" SortExpression="announcmentMessage" />
				<asp:BoundField DataField="announcmentSend" HeaderText="Admin Name" SortExpression="announcmentSend" />
			</Columns>
		</asp:GridView>
		<asp:SqlDataSource ID="AnnouncmentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [announcmentDate], [announcmentMessage], [announcmentSend] FROM [AnnouncmentTable]"></asp:SqlDataSource>
    </form>
</body>
</html>
