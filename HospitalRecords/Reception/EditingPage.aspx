<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditingPage.aspx.cs" Inherits="HospitalRecords.Reception.EditingPage" %>

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
				<asp:GridView ID="GridView1" class="table table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="editPatientSource" DataKeyNames="patientID">
					<Columns>
						<asp:CommandField ShowEditButton="True" />
						<asp:BoundField DataField="social" HeaderText="Social Security Number" ReadOnly="True" SortExpression="social" />
						<asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
						<asp:BoundField DataField="middleName" HeaderText="Middle Name" SortExpression="middleName" />
						<asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
						<asp:BoundField DataField="phoneNumber" HeaderText="Phone Number" SortExpression="phoneNumber" />
						<asp:BoundField DataField="dateOfBirth" HeaderText="Birthday" SortExpression="dateOfBirth" />
						<asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
						<asp:BoundField DataField="address1" HeaderText="Address 1" SortExpression="address1" />
						<asp:BoundField DataField="address2" HeaderText="Address 2" SortExpression="address2" />
						<asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
						<asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
						<asp:BoundField DataField="zipcode" HeaderText="Zipcode" SortExpression="zipcode" />
					</Columns>
				</asp:GridView>
				<asp:SqlDataSource ID="editPatientSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PatientTable] WHERE [patientID] = @patientID" InsertCommand="INSERT INTO [PatientTable] ([firstName], [middleName], [lastName], [phoneNumber], [dateOfBirth], [social], [email], [address1], [address2], [state], [city], [zipcode]) VALUES (@firstName, @middleName, @lastName, @phoneNumber, @dateOfBirth, @social, @email, @address1, @address2, @state, @city, @zipcode)" SelectCommand="SELECT * FROM [PatientTable] WHERE ([social] = @social)" UpdateCommand="UPDATE [PatientTable] SET [firstName] = @firstName, [middleName] = @middleName, [lastName] = @lastName, [phoneNumber] = @phoneNumber, [dateOfBirth] = @dateOfBirth, [social] = @social, [email] = @email, [address1] = @address1, [address2] = @address2, [state] = @state, [city] = @city, [zipcode] = @zipcode WHERE [patientID] = @patientID">
					<DeleteParameters>
						<asp:Parameter Name="patientID" Type="Int32" />
					</DeleteParameters>
					<InsertParameters>
						<asp:Parameter Name="firstName" Type="String" />
						<asp:Parameter Name="middleName" Type="String" />
						<asp:Parameter Name="lastName" Type="String" />
						<asp:Parameter Name="phoneNumber" Type="String" />
						<asp:Parameter Name="dateOfBirth" Type="DateTime" />
						<asp:Parameter Name="social" Type="String" />
						<asp:Parameter Name="email" Type="String" />
						<asp:Parameter Name="address1" Type="String" />
						<asp:Parameter Name="address2" Type="String" />
						<asp:Parameter Name="state" Type="String" />
						<asp:Parameter Name="city" Type="String" />
						<asp:Parameter Name="zipcode" Type="Int32" />
					</InsertParameters>
					<SelectParameters>
						<asp:CookieParameter CookieName="patientSSC" Name="social" Type="String" />
					</SelectParameters>
					<UpdateParameters>
						<asp:Parameter Name="firstName" Type="String" />
						<asp:Parameter Name="middleName" Type="String" />
						<asp:Parameter Name="lastName" Type="String" />
						<asp:Parameter Name="phoneNumber" Type="String" />
						<asp:Parameter Name="dateOfBirth" Type="DateTime" />
						<asp:Parameter Name="social" Type="String" />
						<asp:Parameter Name="email" Type="String" />
						<asp:Parameter Name="address1" Type="String" />
						<asp:Parameter Name="address2" Type="String" />
						<asp:Parameter Name="state" Type="String" />
						<asp:Parameter Name="city" Type="String" />
						<asp:Parameter Name="zipcode" Type="Int32" />
						<asp:Parameter Name="patientID" Type="Int32" />
					</UpdateParameters>
				</asp:SqlDataSource>
			</div>
        </div>
    </form>
</body>
</html>
