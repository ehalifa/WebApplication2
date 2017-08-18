<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bureau.aspx.cs" Inherits="WebApplication2.Bureau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="DsEtage" runat="server" ConnectionString="<%$ ConnectionStrings: DB_PROJET %>"
        SelectCommand="SELECT IdEtage,LibEtage From Etages"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DsBureau" runat="server" ConnectionString="<%$ ConnectionStrings:DB_PROJET %>"
        SelectCommand="select * from Bureau where IdEtage = @IdEtagex"
        UpdateCommand="UPDATE bureau set numbureau=@NumBureau, LibBureau=@LibBureau where idbureau=@idbureau">
        <SelectParameters>
            <asp:ControlParameter ControlID="DpListeEtage" Name="IdEtagex" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NumBureau" Type=String />            
            <asp:Parameter Name="LibBureau" Type="String" />
        </UpdateParameters>


    </asp:SqlDataSource>

    

    <div>
        Liste des etages
            <asp:DropDownList ID="DpListeEtage" runat="server" AutoPostBack="true"
                DataTextField="LibEtage" DataValueField="IdEtage" DataSourceID="DsEtage">
            </asp:DropDownList>

        <table border="0">
            <td colspan="2">
                <asp:GridView ID="GdListProject" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="IdBureau" DataSourceID="DsBureau" GridLines="None" Width="750">
                    <HeaderStyle BackColor="#5D7B9D" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        
                        <asp:BoundField DataField="IdBureau" HeaderText="IdBureau" SortExpression="IdBureau" ReadOnly="true"/>
                        <asp:BoundField DataField="LibBureau" HeaderText="Libelle Bureau" SortExpression="LibBureau" />
                        <asp:BoundField DataField="NumBureau" HeaderText="NumBureau" SortExpression="NumBureau" />
                    

                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </table>
    </div>

    <div>

    </div>


</asp:Content>
