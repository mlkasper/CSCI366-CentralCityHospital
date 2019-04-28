using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalRecords.DoctorNurse
{
    public partial class CreateAppointment : System.Web.UI.Page
    {
        private static HospitalDBEntities dbcon = new HospitalDBEntities();
        public static String AdminName
        {
            get
            {

                string username = HttpContext.Current.User.Identity.Name;
                var user = from x in dbcon.UserTables
                           where x.Username == username
                           select x;
                string name = user.First().FirstName + " " + user.First().LastName;
                return name;
            }
        }
        private Boolean checkIfPatientExists()
        {
            var patient = from x in dbcon.PatientTables
                          where x.firstName == patientFirstName.Value
                          && x.social == patientSocial.Value
                          select x;
            if(!patient.Any())
            {
                return false; 
            }
            else
            {
                errorAlertBody.Visible = false; 
                return true; 
            }
        }
        private Boolean checkAppointmentTime()
        {
            Boolean flag = true; 
            DateTime wantedAppointmentDate = Convert.ToDateTime(appointmentCalendar.SelectedDate.ToLongDateString() + " " + appointmentTime.Value); //datetime value of our time
            var matchingDate = (from x in dbcon.AppointmentTables
                                                   where x.appointmentDate == wantedAppointmentDate
                                                   select x).ToList();
            if (matchingDate.Count != 0) flag = false;
            return flag; 
        }
        private Boolean checkDate()
        {
            if(appointmentCalendar.SelectedDate < DateTime.Now)
            {
                return false; 
            }
            else
            {
                return true; 
            }
        }
        private Boolean check()
        {
            if (!checkIfPatientExists())
            {
                errorAlertBody.Visible = true;
                appointmentError.Text = "Patient does not exist";
                return false; 

            }
            if(!checkAppointmentTime())
            {
                errorAlertBody.Visible = true;
                appointmentError.Text = "Appointment Time is unavailable. Check agian.";
                return false; 
            }
            if(!checkDate())
            {
                errorAlertBody.Visible = true;
                appointmentError.Text = "Appointment date cannot be in the past.";
                return false; 
            }
            return true; 

        }

        private void createAppointment()
        {
            AppointmentTable appointment = new AppointmentTable(); 
            if(checkIfPatientExists())
            {
                var patient = from x in dbcon.PatientTables
                              where x.firstName == patientFirstName.Value
                              && x.social == patientSocial.Value
                              select x;
                appointment.patientName = patient.First().firstName + " " + patient.First().middleName + " " + patient.First().lastName;
                appointment.patientID = patient.First().patientID; 
            }
            appointment.appointmentDate =  Convert.ToDateTime(appointmentCalendar.SelectedDate.ToLongDateString() + " " + Request.Form["appointmentTime"]); //string value of our time
            appointment.doctorName = doctorDropDown.SelectedValue;
            appointment.nurseName = nurseDropDown.SelectedValue;

            var doctor = from x in dbcon.DoctorTables
                         where x.doctorName == appointment.doctorName
                         select x.doctorID;
            appointment.idDoctor = doctor.First();

            var nurse = from x in dbcon.NurseTables
                        where x.nurseName == appointment.nurseName
                        select x.nurseID;
            appointment.idNurse = nurse.First();

            appointment.appointmentReason = appointmentReasonDropdown.Value;

            dbcon.AppointmentTables.Add(appointment);
            dbcon.SaveChanges(); 
            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            displayName.InnerText = "Welcome, " + AdminName;
            errorAlertBody.Visible = false;
            successAlertBody.Visible = false; 
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("../Default.aspx");
        }

        protected void createAppointmentButton_Click(object sender, EventArgs e)
        {
           if(check())
            {
                createAppointment();
                successAlertBody.Visible = true; 
            }
        }
    }
}