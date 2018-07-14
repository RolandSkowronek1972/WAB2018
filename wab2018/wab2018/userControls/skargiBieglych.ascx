<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="skargiBieglych.ascx.cs" Inherits="wab2018.userControls.skargiBieglych" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type="text/css">


a:link, a:visited {
    color: #3a4f63;
}

</style>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="skargiSQL" AutoGenerateColumns="False" EnableTheming="True" Theme="Moderno" Width="100%" KeyFieldName="idSkargi" OnInitNewRow="startDodawanianowejSkargi" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize">
            <Settings ShowFilterRow="True" />
                                                            
            <SettingsDataSecurity AllowDelete="False" />

            <Columns>
                <dx:GridViewDataTextColumn Caption="Numer" FieldName="numer" ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Rok" FieldName="rok" ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Data wpływu" FieldName="dataWplywu" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Data pisma" FieldName="dataPisma" ShowInCustomizationForm="True" VisibleIndex="7">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Sygnatura" FieldName="Sygnatura" ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Biegły" FieldName="Biegly" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Wizytator" FieldName="wizytator" ShowInCustomizationForm="True" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn Caption="Zakreślono" FieldName="zakreslono" VisibleIndex="10" meta:resourcekey="GridViewDataCheckColumnResource1" ShowInCustomizationForm="True">
                         </dx:GridViewDataCheckColumn>
                 
                <dx:GridViewDataTextColumn Caption="Uwagi" FieldName="uwagi" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowNewButtonInHeader="True">
                </dx:GridViewCommandColumn>
            </Columns>
               <SettingsEditing Mode="Inline">
    </SettingsEditing>
     <EditFormLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
        </EditFormLayoutProperties>

        <SettingsPopup>
         
        </SettingsPopup>            
        </dx:ASPxGridView>
     
      
        <asp:SqlDataSource ID="skargiSQL" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT numer, rok, dataWplywu, dataPisma, Sygnatura, wizytator, zakreslono, uwagi, ident AS idSkargi FROM tbl_skargi WHERE (ident = @idBieglego) AND (czyus = 0) ORDER BY numer, rok" UpdateCommand="UPDATE tbl_skargi SET numer = @numer, rok = @rok, dataWplywu = @dataWplywu, dataPisma = @dataPisma, Sygnatura = @Sygnatura, wizytator = @wizytator, zakreslono = @zakreslono, dataZakreslenia = @dataZakreslenia, uwagi = @uwagi WHERE (ident = @idSkargi)" DeleteCommand="UPDATE tbl_skargi SET czyus = 1 WHERE (ident = @idSkargi)" InsertCommand="INSERT INTO tbl_skargi(numer, rok, dataWplywu, dataPisma, Sygnatura, wizytator, dataZakreslenia, uwagi, czyus, idBieglego) VALUES (@numer, @rok, @dataWplywu, @dataPisma, @Sygnatura, @wizytator, @dataZakreslenia, @uwagi, 0, @idBieglego)">
            <DeleteParameters>
                <asp:Parameter Name="idSkargi" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="numer" />
                <asp:Parameter Name="rok" />
                <asp:Parameter Name="dataWplywu" />
                <asp:Parameter Name="dataPisma" />
                <asp:Parameter Name="Sygnatura" />
                <asp:Parameter Name="wizytator" />
                <asp:Parameter Name="dataZakreslenia" />
                <asp:Parameter Name="uwagi" />
                <asp:Parameter Name="idBieglego" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="idBieglego" SessionField="id_osoby" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="numer" />
                <asp:Parameter Name="rok" />
                <asp:Parameter Name="dataWplywu" />
                <asp:Parameter Name="dataPisma" />
                <asp:Parameter Name="Sygnatura" />
                <asp:Parameter Name="wizytator" />
                <asp:Parameter Name="zakreslono" />
                <asp:Parameter Name="dataZakreslenia" />
                <asp:Parameter Name="uwagi" />
                <asp:Parameter Name="idSkargi" />
            </UpdateParameters>
        </asp:SqlDataSource>
     
      
