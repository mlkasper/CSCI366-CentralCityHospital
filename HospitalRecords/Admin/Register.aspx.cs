using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Data.Entity;
using System.Windows;  
namespace HospitalRecords.Admin
{
    public partial class Register : System.Web.UI.Page
    {
        /**
         * 
         * Method to get the name of the Admin that has logged in, used for the navigation bar.
         * 
         */

        private HospitalDBEntities dbcon = new HospitalDBEntities();
        private string Encrpyt(string value) //a method that will be used to Decrpyt our passwords.
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(value));
                return Convert.ToBase64String(data);
            }
        }
        private string GenerateUsername()
        {

            char firstLetter = firstName.Value[0];
            string lastName = this.lastName.Value;
            string generatedName = (firstLetter + lastName).ToLower();
            //check if username exists

            /**
             * Run a query to determine if the username is already in existence.
             * Doesn't matter if the address and other information matches. 
             */
            var checkUser = from x in dbcon.UserTables
                            where x.Username == generatedName
                            select x; 

            if(!checkUser.Any()){ return generatedName; } //if user does not exist return the name
            generatedName = (firstLetter + middleInitial.Value + lastName).ToLower(); //if the user does exist add their middle Initial to the username
            return generatedName;   
        }
        private Boolean checkFirstName()
        {
            if(firstName.Value.Length < 3)
            {
                enterFirstName.Text = "   Enter a name greater than three letters.";
                return false; 
            }
            enterFirstName.Visible = false; 
            return true; 
        }

        private Boolean checkMiddle()
        {
            if(middleInitial.Value.Length == 0 )
            {
                enterMiddle.Text = "   Enter a middle initial.";
                return false; 
            }
            enterMiddle.Visible = false;
            return true; 
        }
        private Boolean checkLastName()
        {
            if(lastName.Value.Length < 3 )
            {
                enterLastName.Text = "   Enter a last name greater than three letters.";
                return false; 
            }
            enterLastName.Visible = false; 
            return true; 
        }

        private Boolean checkAddress()
        {
            if(address1.Value.Length == 0)
            {
                enterAddress.Text = "   Please enter an address.";
                return false; 
            }
            enterAddress.Visible = false; 
            return true; 
        }
        private Boolean checkCity()
        {
            if(city.Value.Length == 0 )
            {
                enterCity.Text = "   Please enter a city.";
                return false; 
            }
            enterCity.Visible = false; 
            return true; 
        }
        private Boolean checkEmail()
        {
            if(email.Value.Length == 0)
            {
                enterEmail.Text = "   Please enter a valid email";
                return false; 
            }
            enterEmail.Visible = false; 
            return true; 
        }
        private Boolean checkZipcode()
        {
            if(zipcode.Value.Length < 5)
            {
                enterZipcode.Text = "   Please enter a valid zipcode.";
                return false; 
            }
            enterZipcode.Visible = false; 
            return true;  
        }
        private Boolean matchPasswords()
        {
          if(password.Value.Length == 0)
            {
                passwordsNotMatch.Text = "Please enter a password";
                return false; 
            }
          if(password.Value != confirm.Value)
            {
                passwordsNotMatch.Text = "Passwords do not match. Try again.";
                return false; 
            }
            passwordsNotMatch.Visible = false; 
            return true; 
        }

        private Boolean checkPhonenumber()
        {
            if(phoneNumber.Value.Length == 0 )
            {
                enterPhoneNumber.Text = "Please enter a valid phone number";
                return false;
            }
            enterPhoneNumber.Visible = false;
            return true; 
        }

        private string getRole()
        {
            return Request.Form["role"]; 
        }

        private Boolean checkState()
        {
            if(Request.Form["state"] == "Select a State")
            {
                enterState.Text = "   Please select a state.";
                return false; 
            }
            enterState.Text = ""; 
            return true;
        }
        private string getState()
        {
            return Request.Form["state"]; ; 
        }

        public static String AdminName
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
        protected void Page_Load(object sender, EventArgs e)
        {
            
            displayName.InnerText = "Welcome, " + AdminName; //load username in navbar
        }

        private void createNewRegisteredUser(HospitalDBEntities dbcon)
        {
            UserTable newRow = new UserTable(); 

            if(checkFirstName() == true)
            {
                newRow.FirstName = firstName.Value; 
            }
            if (checkMiddle() == true)
            {
                newRow.MiddleI = middleInitial.Value;
            }
            if (checkLastName() == true)
            {
                newRow.LastName = lastName.Value;
            }
            if (checkAddress() == true)
            {
                newRow.Address1 = address1.Value;
            }
            if (address2.Value.Length != 0)
            {
                newRow.Address2 = address2.Value;
            }
            if (checkCity() == true)
            {
                newRow.City = city.Value;
            }
            if (checkZipcode() == true)
            {
                newRow.ZipCode = Convert.ToInt32(zipcode.Value);
            }
            if (matchPasswords() == true)
            {
                newRow.Password = Encrpyt(password.Value);
            }
            if (checkEmail() == true)
            {
                newRow.Email = email.Value;
            }
            if( checkPhonenumber() == true )
            {
                newRow.PhoneNumer = phoneNumber.Value; 
            }
            if( checkState() == true )
            {
                newRow.State = getState(); 
            }
            newRow.Role = getRole(); //get role
            newRow.Username = GenerateUsername(); //generate username
            dbcon.UserTables.Add(newRow);
            dbcon.SaveChanges();

        }

        protected void registerUser_Click(object sender, EventArgs e)
        {
            
            using( HospitalDBEntities dbcon = new HospitalDBEntities() )
            {
                try
                {
                    createNewRegisteredUser(dbcon);
                    
                    Page.Response.Redirect("Default.aspx" + "?PreviousPage=SuccessRegistered", true);
                }
                catch(Exception exc)
                {
                    Console.WriteLine("Error " + exc); 
                }

            }
            

        }
    }
}