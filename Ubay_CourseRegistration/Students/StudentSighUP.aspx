﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Students/StudentSubMaster.Master" AutoEventWireup="true" CodeBehind="StudentSighUP.aspx.cs" Inherits="Ubay_CourseRegistration.Students.StudentSighUP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../js/console.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1 style="margin: 0,auto; left: 45%; position: relative;">註冊帳戶</h1>
        <div style="margin: 0,auto; left: 40%; position: relative;">
            <div>
                <p style="color: red; display: inline">*</p>
                姓氏：<asp:TextBox runat="server" ID="fname" MaxLength="8" onkeyup="value=value.replace(/[^\d]/g, '').replace(/^0{1,}/g,'')"></asp:TextBox><br />
            </div>
            <br />
            <div>
                <p style="color: red; display: inline">*</p>
                名字：<asp:TextBox runat="server" ID="lname" MaxLength="8" onkeyup="value=value.replace(/[^\u4E00-\u9FA5^\u3105-\u3129\u02CA\u02C7\u02CB\u02D9]/g,'')"></asp:TextBox><br />
            </div>
            <br />
            <div>
                <p style="color: red; display: inline">*</p>
                帳號：<asp:TextBox runat="server" placeholder="請輸入身分證字號" ID="idn" MaxLength="10"></asp:TextBox><br />
            </div>
            <br />
            <div>
                <p style="color: red; display: inline">*</p>
                密碼：<asp:TextBox runat="server" TextMode="Password" ID="pwd" MaxLength="20"></asp:TextBox><br />
            </div>
            <br />
            <div style="margin-left: -65px;">
                <p style="color: red; display: inline">*</p>
                再次確認密碼：<asp:TextBox runat="server" TextMode="Password" ID="repwd" MaxLength="20"></asp:TextBox><br />
            </div>
            <br />
            <div>
                <p style="color: red; display: inline">*</p>
                性別：               
                <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Text="男" Value="False"></asp:ListItem>
                    <asp:ListItem Text="女" Value="True"></asp:ListItem>
                </asp:RadioButtonList>

            </div>
            <br />
            <div>
                <p style="color: red; display: inline">*</p>
                生日：<asp:TextBox runat="server" TextMode="Date" ID="birthday"></asp:TextBox><br />
            </div>
            <br />
            <div style="margin-left: -10px;">
                <p style="color: red; display: inline">*</p>
                E-mail：<asp:TextBox runat="server" TextMode="Email" ID="email" MaxLength="200"></asp:TextBox><br />
            </div>
            <br />
            <div>
                <p style="color: red; display: inline">*</p>
                手機：<asp:TextBox runat="server" TextMode="Number" ID="phone"  oninput="if(value.length>10)value=value.slice(0,10)" ></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="revPhone" runat="server" ForeColor="Red"
                    ErrorMessage="手機號碼格式錯誤" ControlToValidate="phone"
                    ValidationExpression="((\d{10})|(((\(\d{2}\))|(\d{2}-))?\d{4}(-)?\d{3}(\d)?))">
                </asp:RegularExpressionValidator>
            </div>
            <div>
                <p style="color: red; display: inline">*</p>
                地址：<asp:TextBox runat="server" ID="address" MaxLength="400" ></asp:TextBox><br />
            </div>
            <br />

            <div style="margin-left: -65px;">
                <p style="color: red; display: inline">*</p>
                有無程式經驗：
                <asp:RadioButtonList ID="experience" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="experience_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="無" Value="0"></asp:ListItem>
                    <asp:ListItem Text="有" Value="1"></asp:ListItem>
                </asp:RadioButtonList>
                &nbsp;&nbsp;<asp:Label ID="yearshow" Visible="false" runat="server">年數：</asp:Label>
                <asp:DropDownList ID="exyear" runat="server" RepeatLayout="Flow" Visible="false">
                    <asp:ListItem Text="請選擇" Value="0"></asp:ListItem>
                    <asp:ListItem Text="未滿一年" Value="1"></asp:ListItem>
                    <asp:ListItem Text="1年" Value="2"></asp:ListItem>
                    <asp:ListItem Text="2年" Value="3"></asp:ListItem>
                    <asp:ListItem Text="3年(含)以上" Value="4"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />

            <div style="margin-left: -33px;">
                <p style="color: red; display: inline">*</p>
                最高學歷：
                <asp:DropDownList ID="education" AutoPostBack="true" OnSelectedIndexChanged="education_SelectedIndexChanged" runat="server">
                    <asp:ListItem Text="國小" Value="0"></asp:ListItem>
                    <asp:ListItem Text="國中" Value="1"></asp:ListItem>
                    <asp:ListItem Text="高中" Value="2"></asp:ListItem>
                    <asp:ListItem Text="大學" Value="3"></asp:ListItem>
                    <asp:ListItem Text="研究所" Value="4"></asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="schoolshow" runat="server" Visible="false">學校：</asp:Label>
                <asp:DropDownList ID="school" runat="server" Visible="false">

                </asp:DropDownList>
                <br />
                <br />

            </div>
            <div style="margin-left: -33px;">
                護照號碼：<asp:TextBox ID="psn" runat="server" TextMode="Number" oninput="if(value.length>20)value=value.slice(0,20)"></asp:TextBox>
            </div>
            <br />
            <div style="margin-left: -65px;">上傳護照照片：<asp:FileUpload ID="passpic" runat="server"  /></div>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbmsg" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Button ID="region" runat="server" Text="確認註冊" Style="margin: 0,auto; left: 5%; position: relative;" OnClick="Button_StRegion" /><br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
