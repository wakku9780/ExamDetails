using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamDetails
{
    public partial class Default : Page
    {
        private List<ExamDetail> examDetails = new List<ExamDetail>
        {
            new ExamDetail { SNo = "1", Degree = "B Com", Branch = "Commerce", Sections = "A", Criteria = "IA1ForSem3", SubjectCode = "C001", SubjectName = "Commerce", ExamDate = "01/01/2024", ExamDuration = "2 hours", LockDate = "12/31/2024", MinMark = "35", MaxMark = "100", StartTime = "10:00 AM", EndTime = "12:00 PM" },
            new ExamDetail { SNo = "2", Degree = "B Sc", Branch = "Science", Sections = "B", Criteria = "IA1ForSem3", SubjectCode = "S001", SubjectName = "Science", ExamDate = "01/02/2024", ExamDuration = "2 hours", LockDate = "12/31/2024", MinMark = "35", MaxMark = "100", StartTime = "10:00 AM", EndTime = "12:00 PM" },
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDropDownLists();
                GridView1.Visible = false;
                actions.Visible = false;
            }
        }

        private void PopulateDropDownLists()
        {
            ddlBatch.Items.Add(new ListItem("2024", "2024"));
            ddlDegree.Items.Add(new ListItem("B Com", "B Com"));
            ddlDegree.Items.Add(new ListItem("B Sc", "B Sc"));
            ddlSem.Items.Add(new ListItem("Sem 3", "Sem 3"));
            ddlType.Items.Add(new ListItem("Subject", "Subject"));
            ddlCriteria.Items.Add(new ListItem("IA1ForSem3", "IA1ForSem3"));
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            // Filter the exam details based on the selected criteria
            string selectedBatch = ddlBatch.SelectedValue;
            string selectedDegree = ddlDegree.SelectedValue;
            string selectedBranch = txtBranch.Text;
            string selectedSem = ddlSem.SelectedValue;
            string selectedSubject = txtSubject.Text;
            string selectedType = ddlType.SelectedValue;
            string selectedCriteria = ddlCriteria.SelectedValue;

            var filteredExamDetails = examDetails.FindAll(detail =>
                detail.Criteria == selectedCriteria &&
                detail.Degree == selectedDegree &&
                detail.Branch.Contains(selectedBranch) &&
                detail.SubjectName.Contains(selectedSubject)
            );

            GridView1.DataSource = filteredExamDetails;
            GridView1.DataBind();

            // Show GridView and action controls
            GridView1.Visible = true;
            actions.Visible = true;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                ExamDetail detail = examDetails.Find(d => d.SNo == (index + 1).ToString());

                if (detail != null)
                {
                    lblSubjectCode.Text = detail.SubjectCode;
                    lblSubjectName.Text = detail.SubjectName;
                    lblExamDate.Text = detail.ExamDate;
                    lblStartTime.Text = detail.StartTime;
                    lblEndTime.Text = detail.EndTime;
                    lblExamDuration.Text = detail.ExamDuration;
                    lblLockDate.Text = detail.LockDate;
                    lblMinMark.Text = detail.MinMark;
                    lblMaxMark.Text = detail.MaxMark;

                    chkCommonForSelectedSubjects.Checked = false;
                    chkCommonForSameSubjects.Checked = false;
                    chkSelectSubCategory.Checked = false;
                    chkIsLock.Checked = true;
                    chkVisibilityInPartSettings.Checked = true;

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showDetailsModal", "$('#detailsModal').modal('show');", true);
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Save logic
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Delete logic
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            // Exit logic
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideDetailsModal", "$('#detailsModal').modal('hide');", true);
        }
    }

    public class ExamDetail
    {
        public string SNo { get; set; }
        public string Degree { get; set; }
        public string Branch { get; set; }
        public string Sections { get; set; }
        public string Criteria { get; set; }
        public string SubjectCode { get; set; }
        public string SubjectName { get; set; }
        public string ExamDate { get; set; }
        public string ExamDuration { get; set; }
        public string LockDate { get; set; }
        public string MinMark { get; set; }
        public string MaxMark { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
    }
}
