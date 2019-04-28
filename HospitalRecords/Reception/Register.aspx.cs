using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Data.Entity;
using System.Windows;

namespace HospitalRecords.Reception
{
    public partial class Register : System.Web.UI.Page
    {
        private HospitalDBEntities dbcon = new HospitalDBEntities();
        public static String Username
        {
            get
            {
                HospitalDBEntities dbcon = new HospitalDBEntities();
                string username = HttpContext.Current.User.Identity.Name;
                var user = from x in dbcon.UserTables
                           where x.Username == username
                           select x;
                string name = user.First().FirstName + " " + user.First().LastName;
                return name;
            }
        }
        private Boolean checkFirstName()
        {
            if (patientFirstName.Value.Length < 3)
            {
                enterFirstName.Text = "   Enter a name greater than three letters.";
                return false;
            }
            enterFirstName.Visible = false;
            return true;
        }

        private Boolean checkMiddle()
        {
            if (patientMiddleName.Value.Length == 0)
            {
                enterMiddle.Text = "   Enter a middle initial.";
                return false;
            }
            enterMiddle.Visible = false;
            return true;
        }
        private Boolean checkLastName()
        {
            if (patientLastName.Value.Length < 3)
            {
                enterLastName.Text = "   Enter a last name greater than three letters.";
                return false;
            }
            enterLastName.Visible = false;
            return true;
        }

        private Boolean checkAddress()
        {
            if (address1.Value.Length == 0)
            {
                enterAddress.Text = "   Please enter an address.";
                return false;
            }
            enterAddress.Visible = false;
            return true;
        }
        private Boolean checkCity()
        {
            if (city.Value.Length == 0)
            {
                enterCity.Text = "   Please enter a city.";
                return false;
            }
            enterCity.Visible = false;
            return true;
        }
        private Boolean checkEmail()
        {
            if (patientEmail.Value.Length == 0)
            {
                enterEmail.Text = "   Please enter a valid email";
                return false;
            }
            enterEmail.Visible = false;
            return true;
        }
        private Boolean checkZipcode()
        {
            if (zipcode.Value.Length < 5)
            {
                enterZipcode.Text = "   Please enter a valid zipcode.";
                return false;
            }
            enterZipcode.Visible = false;
            return true;
        }

        private Boolean checkPhonenumber()
        {
            if (patientPhoneNumber.Value.Length == 0)
            {
                enterPhoneNumber.Text = "Please enter a valid phone number";
                return false;
            }
            enterPhoneNumber.Visible = false;
            return true;
        }

        private Boolean checkState()
        {
            if (Request.Form["state"] == "Select a State")
            {
                enterState.Text = "   Please select a state.";
                return false;
            }
            enterState.Text = "";
            return true;
        }
        private Boolean checkSocial()
        {
            if(patientSocialSecurity.Value.Length == 0 || patientSocialSecurity.Value.Length < 9 ||
                patientSocialSecurity.Value.Length > 11)
            {
                enterSSC.Text = "    Please enter a valid social security number.";
                return false; 
            }
            enterSSC.Text = "";
            return true;
        }
        private Boolean checkDoB()
        {
            if(patientBirthDay.Value.Length == 0 )
            {
                enterDateOfBirth.Text = "   Please enter a valid date of birth.";
                return false; 
            }
            enterDateOfBirth.Text = "";
            return true; 
        }
        private string getState()
        {
            return Request.Form["state"]; ;
        }

        

        protected void Page_Load(object sender, EventArgs e)
        {
            displayName.InnerText = "Welcome, " + Username; //load username in navbar
        }
        private void createNewRegisteredUser(HospitalDBEntities dbcon)
        {
            PatientTable newPatient = new PatientTable();           

            if (checkFirstName() == true)
            {
                newPatient.firstName = patientFirstName.Value;
            }
            if (checkMiddle() == true)
            {
                newPatient.middleName = patientMiddleName.Value;
            }
            if (checkLastName() == true)
            {
                newPatient.lastName = patientLastName.Value;
            }

            if (checkSocial() == true )
            {
                newPatient.social = patientSocialSecurity.Value; 
            }
            if(checkDoB() == true)
            {
                newPatient.dateOfBirth = Convert.ToDateTime(patientBirthDay.Value); 
            }
            if (checkEmail() == true)
            {
                newPatient.email = patientEmail.Value;
            }
            if (checkPhonenumber() == true)
            {
                newPatient.phoneNumber = patientPhoneNumber.Value;
            }
            if (checkState() == true)
            {
                newPatient.state = getState();
            }
            if (checkZipcode() == true)
            {
                newPatient.zipcode = Convert.ToInt32(zipcode.Value);
            }
            if (checkCity() == true)
            {
                newPatient.city = city.Value;
            }
            if (checkAddress() == true)
            {
                newPatient.address1 = address1.Value;
            }
            if (address2.Value.Length != 0)
            {
                newPatient.address2 = address2.Value;
            }

            dbcon.PatientTables.Add(newPatient);
            dbcon.SaveChanges();

        }
 
        protected void registerUser_Click(object sender, EventArgs e)
        {
            using (HospitalDBEntities dbcon = new HospitalDBEntities())
            {
                try
                {
                    createNewRegisteredUser(dbcon);

                    Page.Response.Redirect("Default.aspx" + "?PreviousPage=SuccessRegistered", true);
                }
                catch (Exception exc)
                {
                    Console.WriteLine("Error " + exc);
                }

            }
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("../Default.aspx");
        }
    }
}