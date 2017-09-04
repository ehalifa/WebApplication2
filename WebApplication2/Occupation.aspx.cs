using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Occupation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btInsert_Click(object sender, EventArgs e)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DB_PROJET"].ConnectionString;

            // GET THE ACTIVE GRIDVIEW ROW.
            Button bt = (Button)sender;
            GridViewRow grdRow = (GridViewRow)bt.Parent.Parent;

            // NOW GET VALUES FROM FIELDS FROM THE ACTIVE ROW.


            DropDownList DpBureau = (DropDownList)grdRow.Cells[0].FindControl("DpBureau");
            DropDownList DpPerson = (DropDownList)grdRow.Cells[0].FindControl("DpPerson");

            TextBox tbBookName = (TextBox)grdRow.Cells[0].FindControl("Lb");
            TextBox tbDate = (TextBox)grdRow.Cells[0].FindControl("tbIssueDate");
            TextBox tbDate2 = (TextBox)grdRow.Cells[0].FindControl("tbIssueDate2");

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // FINALLY INSERT ROW VALUES IN THE TABLE.

                    SqlCommand cmd = new SqlCommand();

                    cmd.Connection = con;
                    con.Open();

                    cmd.CommandText = "INSERT INTO dbo.Occupation (IdBureau,ID_PERSON, DateStart, DateEnd) " +
                                      "VALUES(@IdBureau, @id_person, convert(datetime,@DateStart , 103) , convert(datetime,@DateEnd , 103))";

                    cmd.Parameters.AddWithValue("@IdBureau", DpBureau.SelectedValue);
                    cmd.Parameters.AddWithValue("@Id_Person", DpPerson.SelectedValue);
                    cmd.Parameters.AddWithValue("@DateStart", tbDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@DateEnd", tbDate2.Text.Trim());

                    cmd.ExecuteNonQuery();
             
            }

            GdListProject.DataBind();



        }
        
    }
}