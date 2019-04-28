<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="HospitalRecords.Admin.Manage" %>

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
			</div>
			<div class="container-fluid">
				<br /><br />
				<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="ManageSource"  class="table table-striped" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
					<Columns>
						<asp:CommandField ShowEditButton="True" />
						<asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
						<asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
						<asp:BoundField DataField="MiddleI" HeaderText="Middle I" SortExpression="MiddleI" />
						<asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
						<asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
						<asp:BoundField DataField="PhoneNumer" HeaderText="Phone Numer" SortExpression="PhoneNumer" />
						<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
						<asp:BoundField DataField="Address1" HeaderText="Address 1" SortExpression="Address1" />
						<asp:BoundField DataField="Address2" HeaderText="Address 2" SortExpression="Address2" />
						<asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
						<asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
						<asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
					</Columns>
				</asp:GridView>
				<asp:SqlDataSource ID="ManageSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [UserTable] WHERE [Username] = @Username" InsertCommand="INSERT INTO [UserTable] ([Username], [Role], [FirstName], [MiddleI], [LastName], [PhoneNumer], [Email], [Address1], [Address2], [City], [State], [ZipCode]) VALUES (@Username, @Role, @FirstName, @MiddleI, @LastName, @PhoneNumer, @Email, @Address1, @Address2, @City, @State, @ZipCode)" SelectCommand="SELECT [Username], [Role], [FirstName], [MiddleI], [LastName], [PhoneNumer], [Email], [Address1], [Address2], [City], [State], [ZipCode] FROM [UserTable]" UpdateCommand="UPDATE [UserTable] SET [Role] = @Role, [FirstName] = @FirstName, [MiddleI] = @MiddleI, [LastName] = @LastName, [PhoneNumer] = @PhoneNumer, [Email] = @Email, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [State] = @State, [ZipCode] = @ZipCode WHERE [Username] = @Username">
					<DeleteParameters>
						<asp:Parameter Name="Username" Type="String" />
					</DeleteParameters>
					<InsertParameters>
						<asp:Parameter Name="Username" Type="String" />
						<asp:Parameter Name="Role" Type="String" />
						<asp:Parameter Name="FirstName" Type="String" />
						<asp:Parameter Name="MiddleI" Type="String" />
						<asp:Parameter Name="LastName" Type="String" />
						<asp:Parameter Name="PhoneNumer" Type="String" />
						<asp:Parameter Name="Email" Type="String" />
						<asp:Parameter Name="Address1" Type="String" />
						<asp:Parameter Name="Address2" Type="String" />
						<asp:Parameter Name="City" Type="String" />
						<asp:Parameter Name="State" Type="String" />
						<asp:Parameter Name="ZipCode" Type="Int32" />
					</InsertParameters>
					<UpdateParameters>
						<asp:Parameter Name="Role" Type="String" />
						<asp:Parameter Name="FirstName" Type="String" />
						<asp:Parameter Name="MiddleI" Type="String" />
						<asp:Parameter Name="LastName" Type="String" />
						<asp:Parameter Name="PhoneNumer" Type="String" />
						<asp:Parameter Name="Email" Type="String" />
						<asp:Parameter Name="Address1" Type="String" />
						<asp:Parameter Name="Address2" Type="String" />
						<asp:Parameter Name="City" Type="String" />
						<asp:Parameter Name="State" Type="String" />
						<asp:Parameter Name="ZipCode" Type="Int32" />
						<asp:Parameter Name="Username" Type="String" />
					</UpdateParameters>
				</asp:SqlDataSource>
			</div>
        </div>
    </form>
</body>
</html>
