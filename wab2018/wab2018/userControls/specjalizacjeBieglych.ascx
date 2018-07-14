<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="specjalizacjeBieglych.ascx.cs"  Inherits="wab2018.specjalizacjeBieglych" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<div style="z-index:99999;">



<asp:SqlDataSource ID="ListaPowolanMediatorow" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" DeleteCommand="DELETE FROM tbl_specjalizacje_osob WHERE (id_ = @ident)" InsertCommand="INSERT INTO tbl_skargi(numer, rok, dataWplywu, dataPisma, Sygnatura, wizytator, zakreslono, dataZakreslenia, uwagi, czyus, idBieglego) VALUES (@numer, @rok, @dataWplywu, @dataPisma, @Sygnatura, @wizytator, @zakreslono, @dataZakreslenia, @uwagi, 0, @idBieglego)" SelectCommand="SELECT tbl_specjalizacje_osob.opis, glo_specjalizacje.nazwa, glo_specjalizacje.id_, tbl_specjalizacje_osob.id_ AS ident FROM tbl_specjalizacje_osob LEFT OUTER JOIN glo_specjalizacje ON tbl_specjalizacje_osob.id_specjalizacji = glo_specjalizacje.id_ WHERE (tbl_specjalizacje_osob.id_osoby = @idOsoby)" UpdateCommand="UPDATE tbl_specjalizacje_osob SET opis = @opis WHERE (id_ = @ident)">
    <DeleteParameters>
        <asp:Parameter Name="ident" />

    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="numer" />
        <asp:Parameter Name="rok" />
        <asp:Parameter Name="dataWplywu" />
       
        <asp:Parameter Name="dataPisma" />
        <asp:Parameter Name="Sygnatura" />
        <asp:Parameter Name="wizytator" />
        <asp:Parameter Name="zakreslono" />
        <asp:Parameter Name="dataZakreslenia" />
        <asp:Parameter Name="uwagi" />
        <asp:Parameter Name="idBieglego" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="idOsoby" SessionField="id_osoby" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="opis" />
        <asp:Parameter Name="ident" />
    </UpdateParameters>
</asp:SqlDataSource>




            <asp:SqlDataSource ID="SpecjalizacjeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT id_, nazwa FROM glo_specjalizacje WHERE (grupa &lt; 1000) ORDER BY nazwa" DeleteCommand="DELETE FROM tbl_specjalizacje_osob where id=@id">
                <DeleteParameters>
                    <asp:Parameter Name="id" />
                </DeleteParameters>
</asp:SqlDataSource>




<table class="dxflInternalEditorTable_Moderno">
    <tr>
        <td class="auto-style1">Specjalizacja</td>
        <td class="auto-style1">
            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SpecjalizacjeSQL" Theme="Moderno" DropDownRows="10" SelectedIndex="0" Width="400px" ValueField="id_" >
                <Columns>
                    <dx:ListBoxColumn FieldName="nazwa" Name="Specjalizacja">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn FieldName="id_" Visible="False">
                    </dx:ListBoxColumn>
                </Columns>
                <Items>
                    <dx:ListEditItem Text="ListEditItem" Value="1" />
                    <dx:ListEditItem Text="ListEditItem" Value="0" />
                </Items>
            </dx:ASPxComboBox>
        </td>
        <td class="auto-style1">
            <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="dodajSpecjalizacje" Text="Dodaj specjalizacje" Theme="Moderno">
            </dx:ASPxButton>
        </td>
    </tr>
    </table>


<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ListaPowolanMediatorow" KeyFieldName="ident" OnInitNewRow="ASPxGridView1_InitNewRow" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize" OnRowUpdating="ASPxGridView1_RowUpdating" Theme="Moderno" Width="100%" EnableTheming="True" OnRowDeleting="ASPxGridView1_RowDeleting">
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" Caption="  " ShowClearFilterButton="True">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="ident" Visible="False" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="nazwa" VisibleIndex="1" Width="30%" ReadOnly="True" Caption="Nazwa specjalizacji" ShowInCustomizationForm="True">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Opis dodatkowy" FieldName="opis" VisibleIndex="3" Width="70%" ShowInCustomizationForm="True">
        </dx:GridViewDataTextColumn>
    </Columns>
     <SettingsPager Visible="False">
    </SettingsPager>
     <SettingsEditing Mode="Inline">
    </SettingsEditing>
     <Settings ShowFilterRow="True" />
     <SettingsDataSecurity AllowInsert="False" />
     <EditFormLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
        </EditFormLayoutProperties>

        <SettingsPopup>
         
        </SettingsPopup>
</dx:ASPxGridView>
    <br />
    <br />
    </div>

