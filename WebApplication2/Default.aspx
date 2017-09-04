<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <ul>
        <%-- Ancien menu

        <asp:HyperLink ID="HyperListEtage" runat="server" NavigateUrl="~/Etage.aspx" Text="<li>Etage</li>"></asp:HyperLink>
        <asp:HyperLink ID="HyperListAnalitique" runat="server" NavigateUrl="~/Analytique.aspx" Text="<li>Analytique</li>"></asp:HyperLink>
        <asp:HyperLink ID="HyperListBureau" runat="server" NavigateUrl="~/Bureau.aspx" Text="<li>Bureau</li>"></asp:HyperLink>
        <asp:HyperLink ID="HyperListOccupation" runat="server" NavigateUrl="~/Occupation.aspx" Text="<li>Occupation Bureau</li>"></asp:HyperLink>--%>
        
        <asp:HyperLink ID="HyperListAnalitique" runat="server" NavigateUrl="~/Analytique.aspx" Text="<li>Analytique</li>"></asp:HyperLink>
    </ul>

</asp:Content>
