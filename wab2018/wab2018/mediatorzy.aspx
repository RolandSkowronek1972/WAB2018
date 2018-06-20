<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="mediatorzy.aspx.cs" Inherits="wab2018.mediatorzy" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id ="mainWindow" class="newPage">  <h2>         Wykaz biegłych sądowych</h2>
        <br />
       
    <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="tytul" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="imie" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="nazwisko" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="adres" ReadOnly="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="data_poczatkowa" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="data_koncowa" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="ident" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="pesel" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="zawieszony" ReadOnly="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="adres2" ReadOnly="True" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="adr_kores" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="kod_poczt_kor" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="miejscowosc_kor" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="specjalizacjeWidok" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="uwagi" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="specjalizacja_opis" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="tel1" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="typ" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
            </Columns>
             <Templates>
            <DetailRow>
                <div style="padding: 3px 3px 2px 3px">
                    <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%" EnableCallBacks="true">
                        <TabPages>
                            <dx:TabPage Text="Products" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
<dx:ASPxVerticalGrid ID="ASPxVerticalGrid1" runat="server" AutoGenerateRows="False" DataSourceID="DaneOsoboweSQL" KeyFieldName="ident" Width="700px">
            <Rows>
                <dx:VerticalGridTextRow FieldName="ident" VisibleIndex="0">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="imie" VisibleIndex="1">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="nazwisko" VisibleIndex="2">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="ulica" VisibleIndex="3">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="kod_poczt" VisibleIndex="4">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="miejscowosc" VisibleIndex="5">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow FieldName="data_poczatkowa" VisibleIndex="6">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridDateRow FieldName="data_koncowa" VisibleIndex="7">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridTextRow FieldName="pesel" ReadOnly="True" VisibleIndex="8">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="czyus" VisibleIndex="9">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="tytul" VisibleIndex="10">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridCheckRow FieldName="czy_zaw" VisibleIndex="11">
                </dx:VerticalGridCheckRow>
                <dx:VerticalGridTextRow FieldName="tel1" VisibleIndex="12">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="tel2" VisibleIndex="13">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="email" VisibleIndex="14">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="adr_kores" VisibleIndex="15">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="kod_poczt_kor" VisibleIndex="16">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="miejscowosc_kor" VisibleIndex="17">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="uwagi" VisibleIndex="18">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow FieldName="d_zawieszenia" VisibleIndex="19">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridTextRow FieldName="specjalizacja_opis" VisibleIndex="20">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="typ" VisibleIndex="21">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow FieldName="dataKoncaZawieszenia" VisibleIndex="22">
                </dx:VerticalGridDateRow>
            </Rows>
<SettingsPager Mode="ShowPager"></SettingsPager>
        </dx:ASPxVerticalGrid>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Categories" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        AAAA
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Address" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxFormLayout runat="server" ColCount="2" Width="100%">
                                            <Items>
                                                <dx:LayoutItem FieldName="Address" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel runat="server" Text='<%# Eval("ulica") %>' />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem FieldName="PostalCode">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel runat="server" Text='<%# Eval("kod_poczt") %>' />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                               
                                                <dx:LayoutItem FieldName="City">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel runat="server" Text='<%# Eval("miejscowosc") %>' />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem FieldName="Country">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel runat="server" Text='<%# Eval("email") %>' />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                               
                                                <dx:LayoutItem FieldName="Fax">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel runat="server" Text='<%# Eval("tel1") %>' />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                            <Styles>
                                                <LayoutItem CaptionCell-CssClass="captionCell" />
                                            </Styles>
                                        </dx:ASPxFormLayout>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                </div>
            </DetailRow>
        </Templates>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT tytul, imie, nazwisko, adres, data_poczatkowa, data_koncowa, ident, pesel, zawieszony, adres2, adr_kores, kod_poczt_kor, miejscowosc_kor, specjalizacjeWidok, uwagi, specjalizacja_opis, tel1, typ FROM View_ListaMediatorow WHERE (data_koncowa &gt;= GETDATE()) ORDER BY nazwisko"></asp:SqlDataSource>
    <br />
        <dx:ASPxVerticalGrid ID="ASPxVerticalGrid1" runat="server" AutoGenerateRows="False" DataSourceID="DaneOsoboweSQL" KeyFieldName="ident" Width="700px">
            <Rows>
                <dx:VerticalGridTextRow FieldName="ident" VisibleIndex="0">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="imie" VisibleIndex="1">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="nazwisko" VisibleIndex="2">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="ulica" VisibleIndex="3">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="kod_poczt" VisibleIndex="4">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="miejscowosc" VisibleIndex="5">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow FieldName="data_poczatkowa" VisibleIndex="6">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridDateRow FieldName="data_koncowa" VisibleIndex="7">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridTextRow FieldName="pesel" ReadOnly="True" VisibleIndex="8">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="czyus" VisibleIndex="9">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="tytul" VisibleIndex="10">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridCheckRow FieldName="czy_zaw" VisibleIndex="11">
                </dx:VerticalGridCheckRow>
                <dx:VerticalGridTextRow FieldName="tel1" VisibleIndex="12">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="tel2" VisibleIndex="13">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="email" VisibleIndex="14">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="adr_kores" VisibleIndex="15">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="kod_poczt_kor" VisibleIndex="16">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="miejscowosc_kor" VisibleIndex="17">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="uwagi" VisibleIndex="18">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow FieldName="d_zawieszenia" VisibleIndex="19">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridTextRow FieldName="specjalizacja_opis" VisibleIndex="20">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="typ" VisibleIndex="21">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow FieldName="dataKoncaZawieszenia" VisibleIndex="22">
                </dx:VerticalGridDateRow>
            </Rows>
<SettingsPager Mode="ShowPager"></SettingsPager>
        </dx:ASPxVerticalGrid>
        <asp:SqlDataSource ID="DaneOsoboweSQL" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT ident, imie, nazwisko, ulica, kod_poczt, miejscowosc, data_poczatkowa, data_koncowa, pesel, czyus, tytul, czy_zaw, tel1, tel2, email, adr_kores, kod_poczt_kor, miejscowosc_kor, uwagi, d_zawieszenia, specjalizacja_opis, typ, dataKoncaZawieszenia FROM tbl_osoby WHERE (typ = 2) AND (ident = @idMediatora)">
            <SelectParameters>
                <asp:SessionParameter Name="idMediatora" SessionField="idMediatora" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br />
    <br />
&nbsp;
        </div>
</asp:Content>
