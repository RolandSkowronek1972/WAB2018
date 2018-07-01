<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="wykazSkarg.aspx.cs" Inherits="wab2018.wykazSkarg" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="skargiSQL" AutoGenerateColumns="False" EnableTheming="True" Theme="Moderno" Width="100%" KeyFieldName="idSkargi">
            <Settings ShowFilterRow="True" />
                                                              <SettingsCommandButton>
                                                      <ShowAdaptiveDetailButton ButtonType="Image">
                                                      </ShowAdaptiveDetailButton>
                                                      <HideAdaptiveDetailButton ButtonType="Image">
                                                      </HideAdaptiveDetailButton>
                                                      <SelectButton Text="select">
                                                          <Image Url="~/img/expand.jpg">
                                                          </Image>
                                                      </SelectButton>
                                                  </SettingsCommandButton>

            <SettingsDataSecurity AllowInsert="False" />

            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Numer" FieldName="numer" ShowInCustomizationForm="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Rok" FieldName="rok" ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Data wpływu" FieldName="dataWplywu" ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Data pisma" FieldName="dataPisma" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Sygnatura" FieldName="Sygnatura" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Biegły" FieldName="Biegly" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Wizytator" FieldName="wizytator" ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn Caption="Zakreślono" FieldName="zakreslono" VisibleIndex="9" meta:resourcekey="GridViewDataCheckColumnResource1" ShowInCustomizationForm="True">
                         </dx:GridViewDataCheckColumn>
                 
                <dx:GridViewDataTextColumn Caption="Uwagi" FieldName="uwagi" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
               <SettingsEditing Mode="Batch" />
        </dx:ASPxGridView>
     
      
        <asp:SqlDataSource ID="skargiSQL" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT tbl_skargi.numer, tbl_skargi.rok, tbl_skargi.dataWplywu, tbl_skargi.dataPisma, tbl_skargi.Sygnatura, tbl_osoby.imie + ' ' + RTRIM(tbl_osoby.nazwisko) AS Biegly, tbl_skargi.wizytator, tbl_skargi.zakreslono, tbl_osoby.ident, tbl_skargi.uwagi, tbl_skargi.ident AS idSkargi FROM tbl_skargi LEFT OUTER JOIN tbl_osoby ON tbl_skargi.idBieglego = tbl_osoby.ident" UpdateCommand="UPDATE tbl_skargi SET numer = @numer, rok = @rok, dataWplywu = @dataWplywu, dataPisma = @dataPisma, Sygnatura = @Sygnatura, wizytator = @wizytator, zakreslono = @zakreslono, dataZakreslenia = @dataZakreslenia, uwagi = @uwagi WHERE (ident = @idSkargi)" DeleteCommand="UPDATE tbl_skargi SET czyus = 1 WHERE (ident = @idSkargi)" InsertCommand="INSERT INTO tbl_skargi(numer, rok, dataWplywu, dataPisma, Sygnatura, wizytator, dataZakreslenia, uwagi, czyus, idBieglego) VALUES (@numer, @rok, @dataWplywu, @dataPisma, @Sygnatura, @wizytator, @dataZakreslenia, @uwagi, 0, @idBieglego)">
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
     
      
    <p>
    </p>
</asp:Content>
