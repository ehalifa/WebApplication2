<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Analytique.aspx.cs" Inherits="WebApplication2.Analitique1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="DsAnalytique" runat="server" ConnectionString="<%$ ConnectionStrings: DB_PROJET %>"
        SelectCommand="SELECT ID_CODE, CODE_TITLE From CodeAnalytique order by CODE_TITLE ASC"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DsBureau" runat="server" ConnectionString="<%$ ConnectionStrings: DB_PROJET %>"
        SelectCommand="select Bureau.NumBureau, Bureau.LibBureau, NAME + ' ' + FIRSTNAME as Fullname, Surface                    
                            from Personne inner join Occupation on Occupation.ID_PERSON=Personne.ID_PERSON
                            inner join Bureau on Bureau.IdBureau=Occupation.IdBureau
                            inner join Surface on Surface.IdBureau=Bureau.IdBureau
                            inner join Affectation on Personne.ID_PERSON=Affectation.ID_PERSON					
                            inner join CodeAnalytique on Affectation.ID_CODE=CodeAnalytique.ID_CODE					
                            where  CodeAnalytique.id_Code = @Codex">
        <SelectParameters>
            <asp:ControlParameter ControlID="DpListeAnalytique" Name="Codex" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div>
        Liste des code analytique
        <asp:DropDownList ID="DpListeAnalytique" runat="server" AutoPostBack="true"
            DataTextField="CODE_TITLE" DataValueField="ID_CODE" DataSourceID="DsAnalytique">
        </asp:DropDownList>

        <table border="0">
            <td colspan="2">
                <asp:GridView ID="GdListProject" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="NumBureau" DataSourceID="DsBureau" GridLines="None" Width="750">
                    <HeaderStyle BackColor="#5D7B9D" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>


                        <asp:BoundField DataField="NumBureau" HeaderText="NumBureau" SortExpression="NumBureau" />
                        <asp:BoundField DataField="LibBureau" HeaderText="Libelle Bureau" SortExpression="LibBureau" />
                        <asp:BoundField DataField="Fullname" HeaderText="Nom" SortExpression="Fullname" />
                        <asp:BoundField DataField="Surface" HeaderText="Surface" SortExpression="Surface" />

                    </Columns>
                </asp:GridView>
            </td>
        </table>

    </div>
</asp:Content>
