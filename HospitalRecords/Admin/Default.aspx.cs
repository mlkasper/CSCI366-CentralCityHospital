using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalRecords
{
    public partial class success : System.Web.UI.Page
    {
        private static  HospitalDBEntities dbcon = new HospitalDBEntities();  
        private void checkSuccessCreation()
        {
            string previousPage = Request.Url.AbsoluteUri;
            if (previousPage.ToLower().Contains("success")) 
            {
                if(previousPage.ToLower().Contains("successregistered"))
                {
                    successAlert.Visible = true;
                    userAdded.Text = "User has been successfully created!";
                    return; 
                }
                if(previousPage.ToLower().Contains("successmessage"))
                {
                    successAlert.Visible = true;
                    userAdded.Text = "Message has been successfully created!";
                    return;  
                }
                if(previousPage.ToLower().Contains("successdeletedmessage"))
                {
                    successAlert.Visible = true;
                    userAdded.Text = "Message has been successfully deleted!";
                    return; 
                }
                
            }
            else
            {
                successAlert.Visible = false;
            }
            
        }
        /**
         * 
         * Method to get the name of the Admin that has logged in, used for the navigation bar.
         * 
         */ 
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

        private void checkIfAnnouncement() //checks if there are announcements if none remove button and show message
        {
            var checkAnnouncment = from x in dbcon.AnnouncmentTables
                                   select x;
            if(!checkAnnouncment.Any()) //check if there are no announcments
            {
                isAnnouncment.Visible = true; 
                deleteSelectedData.Visible = false;

            }
            else
            {
            isAnnouncment.Visible = false;
            deleteSelectedData.Visible = true;
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            checkIfAnnouncement(); //check if any announcments exist.
            checkSuccessCreation(); 

            announcmentGridView.DataBind(); 

            displayName.InnerText = "Welcome, " + AdminName;



            
        }

        protected void announcmentGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int rowIndex = announcmentGridView.SelectedRow.RowIndex;
                int announcmentId = Convert.ToInt32(announcmentGridView.DataKeys[rowIndex].Values[0]);
                AnnouncmentTable obj = (from x in dbcon.AnnouncmentTables
                                           where x.announcmentID == announcmentId
                                           select x).First();
                dbcon.AnnouncmentTables.Remove(obj);
                dbcon.SaveChanges();
                announcmentGridView.DataBind(); 
            }
            catch (NullReferenceException nre)
            {

            }

            //refresh webpage
            Page.Response.Redirect("Default.aspx" + "?PreviousPage=SuccessDeletedMessage", true);
        }
    }
}