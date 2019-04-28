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

namespace HospitalRecords
{
    public partial class login : System.Web.UI.Page
    {
        private HospitalDBEntities dbcon = null;
        public void RefreshDatabase()
        {
            if( dbcon != null )
            {
                dbcon.Dispose(); 
            }
            dbcon = new HospitalDBEntities();
            dbcon.UserTables.Load(); 
        }

        protected void Page_Load(object sender, EventArgs e)
        {

           RefreshDatabase(); //on page load, Refresh our UserTable in our DB.
           UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        private string Decrpyt(string value) //a method that will be used to Decrpyt our passwords.
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(value));
                return Convert.ToBase64String(data); 
            }
        }

        

        protected void submitLogin_Click(object sender, EventArgs e)
        {
             
            var userEntry = from x in dbcon.UserTables
                            where x.Username == inputUsername.Value
                            select x; 
            foreach( UserTable x in userEntry )
            {
                if ( x.Password == Decrpyt(inputPassword.Value) )
                {
                    if ( x.Role == "Admin" )
                    {
                        FormsAuthentication.SetAuthCookie(x.Username, true); 
                        Response.Redirect("~/Admin/Default.aspx"); 
                    }
                    if( x.Role == "Reception" )
                    {
                        FormsAuthentication.SetAuthCookie(x.Username, true);
                        Response.Redirect("~/Reception/Default.aspx"); 
                    }
                    if(x.Role == "Doctor" || x.Role == "Nurse")
                    {
                        FormsAuthentication.SetAuthCookie(x.Username, true);
                        Response.Redirect("~/DoctorNurse/Default.aspx"); 
                    }
                }
            }
        }
    }
}
