﻿using CoreProject.Managers;
using CoreProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ubay_CourseRegistration.Courses
{
    public partial class CourseDetail : System.Web.UI.Page
    {
        StudentManagers _studentManagers = new StudentManagers();
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _studentManagers.ReadTeacherTable(ref tcList);
            }
            if (this.IsUpdateMode())
            {
                string temp = Request.QueryString["Course_ID"];
                this.Startdate.Enabled = false;
                this.Startdate.BackColor = System.Drawing.Color.DarkGray;
                this.Starttime.Enabled = false;
                this.Starttime.BackColor = System.Drawing.Color.DarkGray;
                this.Price.Enabled = false;
                this.Price.BackColor = System.Drawing.Color.DarkGray;
                this.LoadCourse(temp);
            }
            else
            {

                this.Course_title.Text = "新增課程";
                this.btn_Course.Text = "確認新增";
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        private bool IsUpdateMode()
        {
            string qsID = Request.QueryString["Course_ID"];
            if (qsID != null)
                return true;

            return false;
        }

        private void LoadCourse(string id)
        {
            var manager = new CourseManagers();
            var model = manager.GetCourse(id);
            if (model == null)
                Response.Redirect("~/Courses/CourseList.aspx");


            this.txtCourseID.Text = model.Course_ID;
            this.txtCourseName.Text = model.C_Name;
            this.tcList.Text = model.Teacher_ID.ToString();
            this.Startdate.Text = model.StartDate.ToString("yyyy-MM-dd");
            this.Starttime.Text = model.StartTime.ToString();
            this.Enddate.Text = model.EndDate.ToString("yyyy-MM-dd");
            this.maxNum.Text = model.MaxNumEnrolled.ToString();
            this.Place.Text = model.Place_ID.ToString();
            this.txtCourseIntroduction.Text = model.CourseIntroduction;
            this.Price.Text = model.Price.ToString("0");
            //this.saveMinnum.Text = model.MinNumEnrolled.ToString();

        }

        protected void btn_Course_Click(object sender, EventArgs e)
        {
            var manager = new CourseManagers();
            CourseModel model = new CourseModel();

            if (this.IsUpdateMode())
            {
                string qsID = Request.QueryString["Course_ID"];

                manager.GetCourse(qsID);
            }
            else
            {
                model = new CourseModel();
            }



            if (this.txtCourseID.Text != string.Empty &&
                this.txtCourseName.Text != string.Empty &&
                this.tcList.SelectedIndex != 0 &&
                this.Startdate.Text != string.Empty &&
                this.Starttime.Text != string.Empty &&
                this.Enddate.Text != string.Empty &&
                this.maxNum.Text != string.Empty &&
                this.Place.Text != string.Empty &&
                this.txtCourseIntroduction.Text != string.Empty &&
                this.Price.Text != string.Empty)
            {
                model.Course_ID = this.txtCourseID.Text.Trim();
                model.C_Name = this.txtCourseName.Text.Trim();
                model.Teacher_ID = Convert.ToInt32(this.tcList.SelectedValue);
                if (Convert.ToDateTime(this.Enddate.Text) <= Convert.ToDateTime(this.Startdate.Text) ||
                    Convert.ToDateTime(this.Startdate.Text) >= Convert.ToDateTime(this.Enddate.Text))
                {
                    this.lbMsg.Text = "開課日期與結訓日期衝突，請重新輸入";
                    return;
                }
                else
                {
                    model.StartDate = Convert.ToDateTime(this.Startdate.Text);
                    model.EndDate = Convert.ToDateTime(this.Enddate.Text);
                }
                model.StartTime = TimeSpan.Parse(this.Starttime.Text);
                model.MaxNumEnrolled = Convert.ToInt32(this.maxNum.Text);
                model.Place_ID = Convert.ToInt32(this.Place.Text);
                model.CourseIntroduction = this.txtCourseIntroduction.Text;
                model.Price = Convert.ToInt32(this.Price.Text);


            }
            else
            {
                this.lbMsg.Text = "所有欄位必填";
                this.lbMsg.Visible = true;

                return;
            }

            if (this.IsUpdateMode())
            {
                //model.MinNumEnrolled = Convert.ToInt32(this.saveMinnum.Text);
                model.e_empno = (Guid)Session["Acc_sum_ID"];
                manager.UpdateCourse(model);
                this.lbMsg.Text = "修改成功";
                this.lbMsg.Visible = true;
            }
            else
            {
                model.MinNumEnrolled = 0;
                model.b_empno = (Guid)Session["Acc_sum_ID"];
                manager.CreatCourse(model);
                this.lbMsg.Text = "新增成功";
                this.lbMsg.Visible = true;

            }

        }






    }
}