<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="mediatorzyLista.aspx.cs" Inherits="wab2018.mediatorzyLista" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="mediatorzy" AutoGenerateColumns="False" KeyFieldName="ident" Width="100%" EnableRowsCache="False">
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true" VisibleIndex="0" />
            
                     <dx:GridViewDataTextColumn Caption="Tytuł" FieldName="tytul" ShowInCustomizationForm="True" VisibleIndex="1">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Imie" FieldName="imie" ShowInCustomizationForm="True" VisibleIndex="2">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Nazwisko" FieldName="nazwisko" ShowInCustomizationForm="True" VisibleIndex="3">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Adres" FieldName="adres" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataDateColumn Caption="Powołanie od" FieldName="data_poczatkowa" ShowInCustomizationForm="True" VisibleIndex="4">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataDateColumn Caption="Powołanie do" FieldName="data_koncowa" ShowInCustomizationForm="True" VisibleIndex="5">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataCheckColumn Caption="Z" FieldName="zawieszony" VisibleIndex="6" meta:resourcekey="GridViewDataCheckColumnResource1" ShowInCustomizationForm="True">
                         </dx:GridViewDataCheckColumn>
                     <dx:GridViewDataTextColumn Caption="Specjalizacje" FieldName="specjalizacjeWidok" ShowInCustomizationForm="True" VisibleIndex="16">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Uwagi" FieldName="uwagi" ShowInCustomizationForm="True" VisibleIndex="15">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Telefon" FieldName="tel1" ShowInCustomizationForm="True" VisibleIndex="7">
                     </dx:GridViewDataTextColumn>
         
           
        </Columns>
        <SettingsPager Mode="ShowAllRecords" />
        <Templates>
            <EditForm>



                <table class="OptionsTable" style="width: 100%">
                    <tr>
                        <% if(!grid.IsNewRowEditing) { %>
                        <td rowspan="4" style="vertical-align: top">
                            <div style="border: solid 1px #c0c0c0; padding: 2px;">
                             
                            </div>
                        </td>
                        <% } %>
                        <td style="white-space: nowrap">
                            First Name
                        </td>
                        <td style="width: 50%">
                            <dx:ASPxTextBox runat="server" ID="edFirst" Text='<%# Bind("imie") %>' Width="100%" />
                        </td>
                        <td style="white-space: nowrap">
                            Last Name
                        </td>
                        <td style="width: 50%">
                            <dx:ASPxTextBox runat="server" ID="edLast" Text='<%# Bind("nazwisko") %>' Width="100%" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Title
                        </td>
                        <td style="width: 100%" colspan="3">
                            <dx:ASPxTextBox runat="server" ID="edTitle" Text='<%# Bind("tytul") %>' Width="100%" />
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            Birth Date
                        </td>
                        <td style="width: 50%">
                            <dx:ASPxDateEdit runat="server" ID="edBirth" Value='<%# Bind("data_poczatkowa") %>' Width="100%" />
                        </td>
                        <td style="white-space: nowrap">
                            Hire Date
                        </td>
                        <td style="width: 50%">
                            <dx:ASPxDateEdit runat="server" ID="edHire" Value='<%# Bind("data_koncowa") %>' Width="100%" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <dx:ASPxMemo runat="server" ID="edNotes" Text='<%# Bind("uwagi")%>' Width="100%" Height="100px" />
                        </td>
                    </tr>
                </table>
                <div style="text-align: right; padding: 2px">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server" />
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server" />
                </div>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>
      <asp:SqlDataSource ID="mediatorzy" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT View_ListaMediatorow.ident, View_ListaMediatorow.tytul, View_ListaMediatorow.imie, View_ListaMediatorow.nazwisko, View_ListaMediatorow.adres, View_ListaMediatorow.data_poczatkowa, View_ListaMediatorow.data_koncowa, View_ListaMediatorow.pesel, View_ListaMediatorow.zawieszony, View_ListaMediatorow.adres2, View_ListaMediatorow.adr_kores, View_ListaMediatorow.kod_poczt_kor, View_ListaMediatorow.miejscowosc_kor, View_ListaMediatorow.specjalizacjeWidok, View_ListaMediatorow.uwagi, View_ListaMediatorow.specjalizacja_opis, View_ListaMediatorow.tel1, View_ListaMediatorow.typ, tbl_osoby.imie AS Expr1, tbl_osoby.nazwisko AS Expr2, tbl_osoby.ulica, tbl_osoby.kod_poczt, tbl_osoby.miejscowosc, tbl_osoby.data_koncowa AS Expr3, tbl_osoby.pesel AS Expr4, tbl_osoby.d_usuniecia, tbl_osoby.id_usuwajacego, tbl_osoby.tytul AS Expr5, tbl_osoby.czy_zaw, tbl_osoby.tel1 AS Expr6, tbl_osoby.tel2, tbl_osoby.email, tbl_osoby.adr_kores AS Expr7, tbl_osoby.kod_poczt_kor AS Expr8, tbl_osoby.miejscowosc_kor AS Expr9, tbl_osoby.uwagi AS Expr10, tbl_osoby.d_zawieszenia, tbl_osoby.dataKoncaZawieszenia, tbl_osoby.specjalizacja_opis AS Expr11 FROM View_ListaMediatorow LEFT OUTER JOIN tbl_osoby ON View_ListaMediatorow.ident = tbl_osoby.ident WHERE (View_ListaMediatorow.data_koncowa &gt;= GETDATE())"></asp:SqlDataSource>
    
</asp:Content>
