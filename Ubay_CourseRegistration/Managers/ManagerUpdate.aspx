﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Managers/ManagerMaster.Master" AutoEventWireup="true" CodeBehind="ManagerUpdate.aspx.cs" Inherits="Ubay_CourseRegistration.Managers.ManagerInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <h1 style="margin: 0,auto; left: 165%; position: relative;">管理人資料維護</h1>
        <br />
        <div style="margin: 0,auto; left: 160%; position: relative;">
            <div>姓氏：<asp:TextBox runat="server" ID="txtFirstname"></asp:TextBox></div>
            <br />
            <div>名字：<asp:TextBox runat="server" ID="txtLastname"></asp:TextBox></div>
            <br/>
            <div>單位：<asp:TextBox runat="server" ID="txtDepartment"></asp:TextBox></div>
            <br />
            <div>舊密碼：<asp:TextBox runat="server" ID="txtAccount"></asp:TextBox></div>
            <br />
            <div>新密碼：<asp:TextBox runat="server" TextMode="Password" ID="txtPassword"></asp:TextBox></div>
            <br />
            <div style="margin-left: -65px;">
                再次確認新密碼：<asp:TextBox runat="server" TextMode="Password" ID="txtPwdcheck"></asp:TextBox><br />
            </div>
            <br />
            <br />

            <asp:Button ID="Button1" runat="server" Text="確認更改" Style="margin: 0,auto; left: 25%; position: relative;" OnClick="UpdateAdmin_Click" /><br />
            <br />
            <asp:Label ID="WarningMsg" runat="server" style="color:red;font-size:20px;"></asp:Label>
            <br />
            <br />

        </div>
    </div>
</asp:Content>
