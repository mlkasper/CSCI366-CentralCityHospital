using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalRecords.Admin
{
    public partial class Manage : System.Web.UI.Page
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
        protected void Page_Load(object sender, EventArgs e)
        {
            displayName.InnerText = "Welcome, " + AdminName;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex - 1;
            int row = e.NewEditIndex; 

            
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex]; 
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}