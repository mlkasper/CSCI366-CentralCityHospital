<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAppointment.aspx.cs" Inherits="HospitalRecords.DoctorNurse.CreateAppointment" %>

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
    <title>Central City Hospital - Create Appointment</title>
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
			<div class="container">
				<div class="form-row">
					
					<div class="col"></div>
					<div class="col"><br />
						<div class="alert alert-danger" id="errorAlertBody" role="alert" runat="server">
							<asp:Label ID="appointmentError" runat="server" Text=""></asp:Label>
						</div>
						<div class="alert alert-success" role="alert" id="successAlertBody" runat="server">
							 <asp:Label ID="appointmentSuccess" runat="server" Text="Appointment Successfully Created"></asp:Label>
						</div>
					</div>
					<div class="col"></div>
				</div>
	<div class="form-row">
    <div class="col-md-4 mb-3">
      <label for="validationCustom01">First name</label>
      <input type="text" class="form-control" id="patientFirstName" placeholder="First name" runat="server" required>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustom02">Social Security</label>
      <input type="text" class="form-control" id="patientSocial" placeholder="Social Security" runat="server" required>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustomUsername">Reason</label>
      <div class="form-group">
		<select class="form-control" id="appointmentReasonDropdown" runat="server">
			<option value="Abdpain">Abdominal Pain</option>
			<option value="Acne">Acne</option>
			<option value="Allergies">Allergies Seasonal</option>
			<option value="InjAllergy">Allergy Injection</option>
			<option value="GYNAnnual">Annual Female Examination</option>
			<option value="Asthma">Asthma</option>
			<option value="GYNOCP">Birth Control Discussion/Refill</option>
			<option value="Bite/Sting">Bite/Sting</option>
			<option value="BPCk">Blood Pressure Check With Nurse</option>
			<option value="BPCkProv">Blood Pressure Check With Provider</option>
			<option value="Burn">Burn</option>
			<option value="ColdFlu">Cold Or Flu Symptoms</option>
			<option value="Cough">Cough</option>
			<option value="InjDepo">Depoprovera Injection</option>
			<option value="Diarrhea">Diarrhea</option>
			<option value="DtConsult">Dietitian Consultation</option>
			<option value="DtRecheck">Dietitian Recheck</option>
			<option value="DtRckEatCo">Dietitian Recheck - Eating Behavior Concerns</option>
			<option value="EarProb">Ear Problem/Pain</option>
			<option value="MHEatDis">Eating Behavior Concerns</option>
			<option value="RckMHEatDi">Eating Behavior Concerns Recheck</option>
			<option value="ExSweating">Excessive Sweating</option>
			<option value="MHOverExer">Exercise Behavior Concerns</option>
			<option value="RckMHOvEx">Exercise Behavior Concerns Recheck</option>
			<option value="EyeProb">Eye Problems</option>
			<option value="Fever">Fever/High Temperature</option>
			<option value="GYNProb">GYN Concerns</option>
			<option value="GYNVag">GYN Vaginitis</option>
			<option value="GYNYeast">GYN Yeast Infection</option>
			<option value="Headache">Headache</option>
			<option value="ImHepA">Immunization - Hepatitis A</option>
			<option value="ImHepB">Immunization - Hepatitis B</option>
			<option value="ImGard">Immunization - HPV</option>
			<option value="ImMening">Immunization - Meningitis</option>
			<option value="ImMMR">Immunization - MMR</option>
			<option value="ImPneumo">Immunization - Pneumococcal</option>
			<option value="ImTet">Immunization - Tetanus</option>
			<option value="ImExempReq">Immunization Exemption Request</option>
			<option value="Injury">Injury</option>
			<option value="InternScre">International Student Screening</option>
			<option value="MHIntake">Mental Health Inital Exam</option>
			<option value="RckMentHlt">Mental Health Recheck/Medication Refill</option>
			<option value="NVD">Nausea, Vomiting, Diarrhea</option>
			<option value="Pain">Pain</option>
			<option value="Rash">Rash</option>
			<option value="LabSTIcarn">Sextival Event STI Screening</option>
			<option value="Sinus">Sinus Problem</option>
			<option value="Skin">Skin Problem/Concern</option>
			<option value="SleepProb">Sleeping Concerns - Insomnia Or Too Much Sleeping</option>
			<option value="SoreThroat">Sore Throat</option>
			<option value="STIFemale">STD Screening - Female</option>
			<option value="STIMale">STD Screening - Male</option>
			<option value="GIproblem">Stomach Or Intestinal Issues</option>
			<option value="TBFollowup">TB Follow Up</option>
			<option value="TBTestPhrm">TB Test Administration For Pharmacy Students</option>
			<option value="TBReadPhrm">TB Test Reading For Pharmacy Students</option>
			<option value="TobIntake">Tobacco Cessation Intake</option>
			<option value="TobCesRck">Tobacco Cessation Recheck</option>
			<option value="URI">Upper Respiratory Complaints</option>
			<option value="UTIFemale">Urinary Tract Infection -- Female</option>
			<option value="UTIMale">Urinary Tract Infection -- Male</option>
		</select>
      </div>
    </div>
  </div>
  <div class="form-row">
    <div class="col">
      <label for="validationCustom03">Doctor</label>
	  <div class="form-group">
		  <asp:DropDownList class="form-control" ID="doctorDropDown" runat="server" DataSourceID="DoctorAppointmentSource" DataTextField="doctorName" DataValueField="doctorName">
		  </asp:DropDownList>
		  <asp:SqlDataSource ID="DoctorAppointmentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [doctorName] FROM [DoctorTable]"></asp:SqlDataSource>
	  </div>
    </div>
    <div class="col">
      <label for="validationCustom04">Nurse</label>
    	<div class="form-group">
			<asp:DropDownList class="form-control" ID="nurseDropDown" runat="server" DataSourceID="NurseAppointmentSource" DataTextField="nurseName" DataValueField="nurseName">
			</asp:DropDownList>
			<asp:SqlDataSource ID="NurseAppointmentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [nurseName] FROM [NurseTable]"></asp:SqlDataSource>
    	</div>
    </div>
  </div>
  <div class="form-row">
	  <div class="col">
		  <label>Date</label>
		  <asp:Calendar ID="appointmentCalendar" runat="server"></asp:Calendar>
	  </div>
	  <div class="col">
		  <label>Time</label>
		  <select id="appointmentTime" runat="server" class="form-control">
			  <option value="7:00:00 AM">7:00am</option>
			  <option value="7:15:00 AM">7:15am</option>
			  <option value="7:30:00 AM">7:30am</option>
			  <option value="7:45:00 AM">7:45am</option>
			  <option value="8:00:00 AM">8:00am</option>
			  <option value="8:15:00 AM">8:15am</option>
			  <option value="8:30:00 AM">8:30am</option>
			  <option value="8:45:00 AM">8:45am</option>
			  <option value="9:00:00 AM">9:00am</option>
			  <option value="9:15:00 AM">9:15am</option>
			  <option value="9:30:00 AM">9:30am</option>
			  <option value="9:45:00 AM">9:45am</option>
			  <option value="10:00:00 AM">10:00am</option>
			  <option value="10:15:00 AM">10:15am</option>
			  <option value="10:30:00 AM">10:30am</option>
			  <option value="10:45:00 AM">10:45am</option>
			  <option value="11:00:00 AM">11:00am</option>
			  <option value="11:15:00 AM">11:15am</option>
			  <option value="11:30:00 AM">11:30am</option>
			  <option value="11:45:00 AM">11:45am</option>
			  <option value="12:00:00 PM">12:00pm</option>
			  <option value="12:15:00 PM">12:15pm</option>
			  <option value="12:30:00 PM">12:30pm</option>
			  <option value="12:45:00 PM">12:45pm</option>
			  <option value="1:00:00 PM">1:00pm</option>
			  <option value="1:15:00 PM">1:15pm</option>
			  <option value="1:30:00 PM">1:30pm</option>
			  <option value="1:45:00 PM">1:45pm</option>
			  <option value="2:00:00 PM">2:00pm</option>
			  <option value="2:15:00 PM">2:15pm</option>
			  <option value="2:30:00 PM">2:30pm</option>
			  <option value="2:45:00 PM">2:45pm</option>
			  <option value="3:00:00 PM">3:00pm</option>
			  <option value="3:15:00 PM">3:15pm</option>
			  <option value="3:30:00 PM">3:30pm</option>
			  <option value="3:45:00 PM">3:45pm</option>
			  <option value="4:00:00 PM">4:00pm</option>
			  <option value="4:15:00 PM">4:15pm</option>
			  <option value="4:30:00 PM">4:30pm</option>
			  <option value="4:45:00 PM">4:45pm</option>
			  <option value="5:00:00 PM">5:00pm</option>
			  <option value="5:15:00 PM">5:15pm</option>
			  <option value="5:30:00 PM">5:30pm</option>
			  <option value="5:45:00 PM">5:45pm</option>
			  <option value="6:00:00 PM">6:00pm</option>
			  <option value="6:15:00 PM">6:15pm</option>
			  <option value="6:30:00 PM">6:30pm</option>
			  <option value="6:45:00 PM">6:45pm</option>
			  <option value="7:00:00 PM">7:00pm</option>
			  <option value="7:15:00 PM">7:15pm</option>
			  <option value="7:30:00 PM">7:30pm</option>
			  <option value="7:45:00 PM">7:45pm</option>
		  </select>
	  </div>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
      <label class="form-check-label" for="invalidCheck">
        Agree to terms and conditions
      </label>
      <div class="invalid-feedback">
        You must agree before submitting.
      </div>
    </div>
  </div>
  <asp:Button ID="createAppointmentButton" runat="server" Text="Create Appointment" OnClick="createAppointmentButton_Click"/>
  
			</div>
        </div>
    </form>
</body>
</html>
