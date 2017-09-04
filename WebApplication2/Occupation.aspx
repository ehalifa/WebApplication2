<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Occupation.aspx.cs" Inherits="WebApplication2.Occupation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:SqlDataSource ID="DsEtage" runat="server" ConnectionString="<%$ ConnectionStrings: DB_PROJET %>"
        SelectCommand="SELECT IdEtage,LibEtage From Etages"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DsBureau" runat="server" ConnectionString="<%$ ConnectionStrings: DB_PROJET %>"
        SelectCommand="SELECT IdBureau,NumBureau From Bureau"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DsPerson" runat="server" ConnectionString="<%$ ConnectionStrings: DB_PROJET %>"
        SelectCommand="SELECT *, NAME + ' ' + FIRSTNAME as Fullname from Personne order by name"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DsOccupation" runat="server" ConnectionString="<%$ ConnectionStrings:DB_PROJET %>"
        SelectCommand="select IdOccupation, Bureau.IdBureau, LibBureau, NumBureau, 
                                NAME + ' ' + FIRSTNAME as Fullname, personne.id_person
                                , Occupation.DateStart, Occupation.DateEnd
                                from occupation inner join Bureau on bureau.idbureau =occupation.IdBureau								
								inner join Personne on Occupation.ID_PERSON = Personne.ID_PERSON
                                where Occupation.ID_PERSON = Personne.ID_PERSON and IdEtage = @IdEtagex order by numbureau"
        DeleteCommand="Delete from Occupation where IdOccupation=@IdOccupation"
        UpdateCommand="Update occupation set id_person = @id_person where IdOccupation=@IdOccupation">



        <SelectParameters>
            <asp:ControlParameter ControlID="DpListeEtage" Name="IdEtagex" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>

        <DeleteParameters>
            <asp:Parameter Name="IdOccupation" Type="Int32" />
        </DeleteParameters>

        <UpdateParameters>
            <asp:Parameter Name="IdOccupation" Type="Int32" />
            <asp:Parameter Name="id_person" Type="Int32" />
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
                    DataKeyNames="IdOccupation" DataSourceID="DsOccupation" GridLines="None" ShowFooter="true" Width="750">
                    <HeaderStyle BackColor="#5D7B9D" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>

                        <asp:BoundField DataField="NumBureau" HeaderText="Numéro Bureau" SortExpression="NumBureau" ReadOnly="true" />

                        <asp:TemplateField HeaderText="Numéro Bureau">
                            <ItemTemplate>
                                <asp:Label ID="NumBureau" Text='<%# DataBinder.Eval(Container.DataItem, "NumBureau")%>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DpBureau" DataSourceID="DsBureau" DataValueField="IdBureau" 
                                    SelectedValue='<%# Bind("IdBureau") %>' DataTextField="IdBureau" runat="server">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="DpBureau" DataSourceID="DsBureau" DataValueField="IdBureau" DataTextField="NumBureau" runat="server" AutoPostBack="true" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="LibBureau" HeaderText="Libelle Bureau" SortExpression="LibBureau" ReadOnly="true" />

                        <asp:TemplateField HeaderText="Nom">
                            <ItemTemplate>
                                <asp:Label ID="Lb" Text='<%# DataBinder.Eval(Container.DataItem, "FullName")%>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DpPerson" DataSourceID="DsPerson" DataValueField="Id_Person"
                                    SelectedValue='<%# Bind("Id_Person") %>' DataTextField="Fullname" runat="server">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="DpPerson" DataSourceID="DsPerson" DataValueField="Id_Person" DataTextField="FullName" runat="server" AutoPostBack="True" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate><asp:Label ID="lblIsseDate" width="140px" runat="server" Text='
                                <%#Eval("DateStart")%>'></asp:Label></ItemTemplate>
                            <FooterTemplate><asp:TextBox ID="tbIssueDate" DataFormatString="{dd/MM/yyyy}"
                                CssClass="textbox" runat="server"></asp:TextBox></FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate><asp:Label ID="lblIsseDate2" width="140px" runat="server" Text='
                                <%#Eval("DateEnd")%>'></asp:Label></ItemTemplate>
                            <FooterTemplate><asp:TextBox ID="tbIssueDate2" DataFormatString="{dd/MM/yyyy}"
                                CssClass="textbox" runat="server"></asp:TextBox></FooterTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="DateStart" HeaderText="Date début" SortExpression="DateStart" />
                        <asp:BoundField DataField="DateEnd" HeaderText="Date fin" SortExpression="DateEnd" />

                        <asp:TemplateField>
                            <ItemTemplate></ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="btInsert" 
                                    Text="Enregistrer" CssClass="button" OnClick="btInsert_Click" 
                                    CommandName="Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
            </td>
        </table>
    </div>

</asp:Content>
