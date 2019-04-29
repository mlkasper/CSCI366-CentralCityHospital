<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="HospitalRecords.DoctorNurse.Appointments" %>

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
    <title>Central City Hospital - Appointments</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
			<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a href="Default.aspx" class="navbar-brand"><img src="../img/medicine.svg" alt="" width="54px" height="54px" class="d-inline-block align-top"/></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active"> <a class="nav-link" href="Default.aspx">Home <span class="sr-only">(current)</span></a> </li>
					<li class="nav-item"> <a class="nav-link" href="Appointments.aspx">New Patient</a> </li>
					<li class="nav-item"> <a class="nav-link" href="CreateAppointment.aspx">New Appointment</a> </li>
					<li class="nav-item"> <asp:LoginStatus class="nav-link" ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" />
					</li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="navbar-item"><label id="displayName" class="lead" runat="server"></label></li>
				</ul>
			</div>
			</nav>
			<div class="container-fluid">
				<asp:GridView ID="doctorNurseGridview" runat="server"  class="table table-striped" AutoGenerateColumns="False" DataKeyNames="appointmentID" DataSourceID="DoctorNurseAppointmentGridview">
					<Columns>
						<asp:CommandField ShowEditButton="True" />
						<asp:BoundField DataField="appointmentID" HeaderText="appointment ID" InsertVisible="False" ReadOnly="True" SortExpression="appointmentID" />
						<asp:BoundField DataField="patientName" HeaderText="Patient Name" SortExpression="patientName" ReadOnly="True" />
						<asp:BoundField DataField="appointmentReason" HeaderText="Appointment Reason" SortExpression="appointmentReason" />
						<asp:BoundField DataField="doctorName" HeaderText="Doctor Name" SortExpression="doctorName" />
						<asp:BoundField DataField="nurseName" HeaderText="Nurse Name" SortExpression="nurseName" />
						<asp:BoundField DataField="notes" HeaderText="Notes" SortExpression="notes" />
						<asp:BoundField DataField="appointmentDate" HeaderText="Date" SortExpression="appointmentDate" />
					</Columns>
				</asp:GridView>
				<asp:SqlDataSource ID="DoctorNurseAppointmentGridview" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AppointmentTable] WHERE [appointmentID] = @appointmentID" InsertCommand="INSERT INTO [AppointmentTable] ([patientName], [appointmentReason], [doctorName], [nurseName], [notes], [appointmentDate]) VALUES (@patientName, @appointmentReason, @doctorName, @nurseName, @notes, @appointmentDate)" SelectCommand="SELECT [appointmentID], [patientName], [appointmentReason], [doctorName], [nurseName], [notes], [appointmentDate] FROM [AppointmentTable]" UpdateCommand="UPDATE [AppointmentTable] SET [patientName] = @patientName, [appointmentReason] = @appointmentReason, [doctorName] = @doctorName, [nurseName] = @nurseName, [notes] = @notes, [appointmentDate] = @appointmentDate WHERE [appointmentID] = @appointmentID">
					<DeleteParameters>
						<asp:Parameter Name="appointmentID" Type="Int32" />
					</DeleteParameters>
					<InsertParameters>
						<asp:Parameter Name="patientName" Type="String" />
						<asp:Parameter Name="appointmentReason" Type="String" />
						<asp:Parameter Name="doctorName" Type="String" />
						<asp:Parameter Name="nurseName" Type="String" />
						<asp:Parameter Name="notes" Type="String" />
						<asp:Parameter Name="appointmentDate" Type="DateTime" />
					</InsertParameters>
					<UpdateParameters>
						<asp:Parameter Name="patientName" Type="String" />
						<asp:Parameter Name="appointmentReason" Type="String" />
						<asp:Parameter Name="doctorName" Type="String" />
						<asp:Parameter Name="nurseName" Type="String" />
						<asp:Parameter Name="notes" Type="String" />
						<asp:Parameter Name="appointmentDate" Type="DateTime" />
						<asp:Parameter Name="appointmentID" Type="Int32" />
					</UpdateParameters>
				</asp:SqlDataSource>
			</div>
        </div>
    </form>
</body>
</html>
