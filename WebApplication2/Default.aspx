<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <ul>
        <asp:HyperLink ID="HyperListEtage" runat="server" NavigateUrl="~/Etage.aspx" Text="<li>Etage</li>"></asp:HyperLink>
        <asp:HyperLink ID="HyperListAnalitique" runat="server" NavigateUrl="~/Analytique.aspx" Text="<li class='last'>Analytique</li>"></asp:HyperLink>
    </ul>
    

    

</asp:Content>
