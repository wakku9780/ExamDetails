<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ExamDetails.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        }
        h1 {
            color: #343a40;
            margin-bottom: 30px;
        }
        label {
            font-weight: bold;
        }
        .btn {
            width: 100%;
        }
        .modal-content {
            border-radius: 10px;
        }
        .modal-header {
            background-color: #343a40;
            color: #ffffff;
        }
        .modal-footer .btn {
            width: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
          
        <div class="container">
             <h1>Criteria For Internal</h1>
            <div class="row">
                <div class="col-md-4">
                    <label for="ddlBatch">Batch</label>
                    <asp:DropDownList ID="ddlBatch" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label for="txtBranch">Degree</label>
                    <asp:DropDownList ID="ddlDegree" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label for="txtDepartment">Branch</label>
                    <asp:TextBox ID="txtBranch" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-4">
                    <label for="ddlSem">Sem</label>
                    <asp:DropDownList ID="ddlSem" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label for="txtType">Type</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" Placeholder="Theory" ></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label for="txtType">Subject</label>
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control"></asp:DropDownList>
                    
                </div>

            </div>
            <div class="row mt-3">
                <div class="col-md-4">
                     <label for="txtType">Criteria</label>
                    <asp:DropDownList ID="ddlCriteria" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnGo" runat="server" Text="Go" CssClass="btn btn-primary" OnClick="btnGo_Click" />
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table mt-3" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="SNo">
                        <ItemTemplate>
                            <asp:Label ID="lblSNo" runat="server" Text='<%# Eval("SNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Degree">
                        <ItemTemplate>
                            <asp:Label ID="lblDegree" runat="server" Text='<%# Eval("Degree") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Branch">
                        <ItemTemplate>
                            <asp:Label ID="lblBranch" runat="server" Text='<%# Eval("Branch") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sections">
                        <ItemTemplate>
                            <asp:Label ID="lblSections" runat="server" Text='<%# Eval("Sections") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Criteria">
                        <ItemTemplate>
                            <asp:Label ID="lblCriteria" runat="server" Text='<%# Eval("Criteria") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject Code">
                        <ItemTemplate>
                            <asp:Label ID="lblSubjectCode" runat="server" Text='<%# Eval("SubjectCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject Name">
                        <ItemTemplate>
                            <asp:Label ID="lblSubjectName" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Exam Date">
                        <ItemTemplate>
                            <asp:Label ID="lblExamDate" runat="server" Text='<%# Eval("ExamDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Exam Duration">
                        <ItemTemplate>
                            <asp:Label ID="lblExamDuration" runat="server" Text='<%# Eval("ExamDuration") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Lock Date">
                        <ItemTemplate>
                            <asp:Label ID="lblLockDate" runat="server" Text='<%# Eval("LockDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Min. Mark">
                        <ItemTemplate>
                            <asp:Label ID="lblMinMark" runat="server" Text='<%# Eval("MinMark") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Max. Mark">
                        <ItemTemplate>
                            <asp:Label ID="lblMaxMark" runat="server" Text='<%# Eval("MaxMark") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Start Time">
                        <ItemTemplate>
                            <asp:Label ID="lblStartTime" runat="server" Text='<%# Eval("StartTime") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Time">
                        <ItemTemplate>
                            <asp:Label ID="lblEndTime" runat="server" Text='<%# Eval("EndTime") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnDetails" runat="server" Text="Details" CommandName="Details" CommandArgument='<%# Eval("SNo") %>' CssClass="btn btn-info" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div id="actions" runat="server" visible="false" class="mt-3">
                <!-- Additional action buttons can be added here -->
            </div>
        </div>

        <div class="modal fade" id="detailsModal" tabindex="-1" role="dialog" aria-labelledby="detailsModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailsModalLabel">Exam Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Common For Selected Subject's</label>
                            <input type="checkbox" runat="server" id="chkCommonForSelectedSubjects" />
                        </div>
                        <div class="form-group">
                            <label>Common For Same Subject's</label>
                            <input type="checkbox" runat="server" id="chkCommonForSameSubjects" />
                        </div>
                        <div class="form-group">
                            <label>Subject Code</label>
                            <asp:Label ID="lblSubjectCode" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Subject Name</label>
                            <asp:Label ID="lblSubjectName" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Exam Date</label>
                            <asp:Label ID="lblExamDate" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Starting Time</label>
                            <asp:Label ID="lblStartTime" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Ending Time</label>
                            <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Exam Duration</label>
                            <asp:Label ID="lblExamDuration" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Select Sub Category</label>
                            <input type="checkbox" runat="server" id="chkSelectSubCategory" />
                        </div>
                        <div class="form-group">
                            <label>Is Lock</label>
                            <input type="checkbox" runat="server" id="chkIsLock" />
                        </div>
                        <div class="form-group">
                            <label>Lock Date</label>
                            <asp:Label ID="lblLockDate" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Min. Mark</label>
                            <asp:Label ID="lblMinMark" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Max. Mark</label>
                            <asp:Label ID="lblMaxMark" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Visibility in Part Settings (For Staff Only)</label>
                            <input type="checkbox" runat="server" id="chkVisibilityInPartSettings" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
                        <asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="btn btn-secondary" OnClick="btnExit_Click" />
                        <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-secondary" OnClick="btnClose_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>