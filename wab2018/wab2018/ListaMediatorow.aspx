<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaMediatorow.aspx.cs" Inherits="wab2018.ListaMediatorow" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <dx:ASPxGridView ID="Grid" runat="server" DataSourceID="mediatorzy" EnableRowsCache="False" Width="100%" AutoGenerateColumns="False" Theme="Moderno" KeyFieldName="ident" OnRowUpdating="Grid_RowUpdating">
        <Columns>
             <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowDeleteButton="true" Width="50" />
            <dx:GridViewDataTextColumn FieldName="tytul" VisibleIndex="1" />
            <dx:GridViewDataTextColumn FieldName="imie" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nazwisko" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="adres" ReadOnly="True" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="data_poczatkowa" VisibleIndex="4">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="data_koncowa" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="zawieszony" ReadOnly="True" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="adres2" VisibleIndex="8" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="specjalizacjeWidok" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="uwagi" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="specjalizacja_opis" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="tel1" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsEditing Mode="Batch" />
           <Templates>
            <EditForm>
                <table class="OptionsTable" style="width: 100%">
                    <tr>
                        <% if(!Grid.IsNewRowEditing) { %>
                        <td rowspan="4" style="vertical-align: top">
                            <div style="border: solid 1px #c0c0c0; padding: 2px;">
                              nothing
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
                            <dx:ASPxMemo runat="server" ID="edNotes" Text='<%# Bind("adres2")%>' Width="100%" Height="100px" />
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
      <asp:SqlDataSource ID="mediatorzy" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT ident, tytul, imie, nazwisko, adres, data_poczatkowa, data_koncowa, pesel, zawieszony, adres2, adr_kores, kod_poczt_kor, miejscowosc_kor, specjalizacjeWidok, uwagi, specjalizacja_opis, tel1, typ FROM View_ListaMediatorow WHERE (data_koncowa &gt;= GETDATE())"></asp:SqlDataSource>
      <br />
</asp:Content>
