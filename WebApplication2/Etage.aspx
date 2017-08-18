<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Etage.aspx.cs" Inherits="WebApplication2.Etage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="DsEtage" runat="server" ConnectionString="<%$ ConnectionStrings: DB_PROJET %>"
        SelectCommand="SELECT IdEtage,LibEtage From Etages"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DsPerson" runat="server" ConnectionString="<%$ ConnectionStrings: DB_PROJET %>"
        SelectCommand="SELECT *, NAME + ' ' + FIRSTNAME as Fullname from Personne order by name"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DsOccupation" runat="server" ConnectionString="<%$ ConnectionStrings:DB_PROJET %>"
        SelectCommand="select IdOccupation, Bureau.IdBureau, LibBureau, NumBureau, 
                                NAME + ' ' + FIRSTNAME as Fullname, personne.id_person
                                , Occupation.DateStart, Occupation.DateEnd
                                from occupation inner join Bureau on bureau.idbureau =occupation.IdBureau								
								inner join Personne on Occupation.ID_PERSON = Personne.ID_PERSON
                                where Occupation.ID_PERSON = Personne.ID_PERSON and IdEtage = @IdEtagex order by numbureau"
        
        UpdateCommand="Update occupation set id_person = @id_person where IdOccupation=@IdOccupation"
        
        InsertCommand="">


        
        <SelectParameters>
            <asp:ControlParameter ControlID="DpListeEtage" Name="IdEtagex" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="IdOccupation" Type=Int32 />            
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
                    DataKeyNames="IdOccupation" DataSourceID="DsOccupation" GridLines="None" Width="750">
                    <HeaderStyle BackColor="#5D7B9D" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>

                        <asp:BoundField DataField="NumBureau" HeaderText="NumBureau" SortExpression="NumBureau" ReadOnly="true" />
                        <asp:BoundField DataField="LibBureau" HeaderText="Libelle Bureau" SortExpression="LibBureau" ReadOnly="true"  />
                       
                        <asp:TemplateField HeaderText="Nom">
                            <ItemTemplate>
                                <asp:Label id="Lb" text='<%# DataBinder.Eval(Container.DataItem, "FullName")%>' runat="server" />                
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList  id="DpPerson" DataSourceID="DsPerson" DataValueField="Id_Person" 
                                    SelectedValue='<%# Bind("Id_Person") %>' DataTextField="Fullname" runat="server"></asp:DropDownList>			                
                            </EditItemTemplate>                                        
                        </asp:TemplateField>	         


                                                
                        <asp:BoundField DataField="DateStart" HeaderText="Date début" SortExpression="DateStart" />
                        <asp:BoundField DataField="DateEnd" HeaderText="Date fin" SortExpression="DateEnd" />

                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </table>
    </div>

    <div>

    </div>


</asp:Content>
