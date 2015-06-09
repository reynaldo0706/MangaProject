<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MangaProject._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   
    
    <asp:GridView ID="gvManga" runat="server"></asp:GridView><br />

     <br /> <br />
    <asp:Label ID="lblTitle" runat="server" Text="Title: "></asp:Label>
    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
     <br /> <br />
    <asp:Label ID="lblDescription" runat="server" Text="Description: "></asp:Label>
    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
     <br /> <br />
    <asp:Label ID="lblPubDate" runat="server" Text="Publish date: "></asp:Label>
    <asp:TextBox ID="txtPubdate" runat="server"></asp:TextBox>
     <br /> <br />
    <asp:Label ID="lblImage" runat="server" Text="Cover Image: "></asp:Label>
    <asp:TextBox ID="txtImage" runat="server"></asp:TextBox>
     <br /> <br />
    <asp:Label ID="lblVolume" runat="server" Text="Volume: "></asp:Label>
    <asp:TextBox ID="txtVolume" runat="server"></asp:TextBox>
     <br /> <br />
    <asp:Label ID="lblPub" runat="server" Text="Publisher: "></asp:Label>
    <asp:DropDownList ID="ddlPub" runat="server"></asp:DropDownList>
     <br /> <br />
    <asp:Label ID="lblLanguage" runat="server" Text="Languages: "></asp:Label>
    <asp:DropDownList ID="ddlLanguage" runat="server"></asp:DropDownList>
     <br /> <br />
       
    <br /> <br />
    <asp:Button ID="Button1" runat="server" OnClick="btnAdd_Click" Text="Add" />
    <input runat="server" id="hidId" type="hidden" />
    <asp:Button ID="btnPrev" runat="server" OnClick="btnPrev_Click" Text="Prev" />
    <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />

</asp:Content>
