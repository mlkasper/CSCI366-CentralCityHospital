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

namespace HospitalRecords.DoctorNurse
{

    public partial class Default : System.Web.UI.Page
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
        protected void Page_Load(object sender, EventArgs e)
        {
            displayName2.InnerText = "Welcome, " + Username; //load username in navbar
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("../Default.aspx");
        }
    }
}