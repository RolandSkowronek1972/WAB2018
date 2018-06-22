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


  <Templates>
            <EditForm>

                   <% if(!grid.IsNewRowEditing) { %>
                        <td rowspan="4" style="vertical-align: top">
                            <div style="border: solid 1px #c0c0c0; padding: 2px;">
                             
                            </div>
                        </td>
                        <% } %>

                         <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Theme="Office2010Blue"  meta:resourcekey="ASPxPageControl1Resource1">
            <TabPages >
                      <dx:TabPage Text="Dane osobowe" meta:resourcekey="TabPageResource8">
                       <ContentCollection>
                        <dx:ContentControl ID="ContentControl7" runat="server" meta:resourcekey="ContentControl7Resource1">




                            <table style="width:100%;">
                                <tr>
                                    <td>Tytuł</td>
                                    <td>
                                            <dx:ASPxTextBox runat="server" ID="TxBTytul" Text='<%# Bind("tytul") %>' Width="100%" />
                                    </td>
                                    <td style="width: 50%">Specjalizacja&nbsp; opis (doprecyzowanie) </td>
                                </tr>
                                <tr>
                                    <td>Imie</td>
                                    <td>
                                     <dx:ASPxTextBox runat="server" ID="txImie" Text='<%# Bind("imie") %>' Width="100%" />
                                    </td>
                                    <td align="center" rowspan="4" valign="top">
                           <dx:ASPxTextBox runat="server" ID="txspecjalizacja_opis" Text='<%# Bind("specjalizacja_opis") %>' Width="100%" Height="99%" TextMode="MultiLine" />

                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nazwisko</td>
                                    <td>
                                             <dx:ASPxTextBox runat="server" ID="TxNazwisko" Text='<%# Bind("nazwisko") %>' Width="100%" Height="99%" TextMode="MultiLine" />

                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>PESEL</td>
                                    <td>
                                             <dx:ASPxTextBox runat="server" ID="txPesel" Text='<%# Bind("pesel") %>' Width="100%" Height="99%" TextMode="MultiLine" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Data powołania od</td>
                                    <td>
                                   <dx:ASPxDateEdit runat="server" ID="txDataPoczatkuPowolania" Value='<%# Bind("data_poczatkowa") %>' Width="100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Data powołania do</td>
                                    <td>
                                   <dx:ASPxDateEdit runat="server" ID="txdatzKoncaPowolania" Value='<%# Bind("data_koncowa") %>' Width="100%" />
                                    </td>
                                    <td style="width: 50%">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlZawiszenie" runat="server" AutoPostBack="True"  meta:resourcekey="DropDownList4Resource1">
                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource1">Brak zawieszenia</asp:ListItem>
                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">Zawieszenie</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPoczatekZawieszenia" runat="server" Text="Początek zawieszenia" Visible="False"></asp:Label>
                                    </td>
                                    <td style="width: 50%">
                                        <dx:ASPxDateEdit ID="poczatekZawieszeniaData" runat="server" meta:resourceKey="zawieszenieDataResource1" >
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Label ID="lblKoniecZawieszenia" runat="server" Text="Koniec zawieszenia" Visible="true"></asp:Label>
                                    </td>
                                    <td style="width: 50%">
                                        <dx:ASPxDateEdit ID="koniecZawieszeniaData" runat="server" meta:resourceKey="zawieszenieDataResource1"  Visible="true">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                            </table>
                            <br />
                      


                            </dx:ContentControl>
                            </ContentCollection>
                      </dx:TabPage>

                      <dx:TabPage Text="Dane kontaktowe" meta:resourcekey="TabPageResource9">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl8" runat="server" meta:resourcekey="ContentControl8Resource1">
                                

                                   <br />
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                      <dx:TabPage Text="Specjalizacje" meta:resourcekey="TabPageResource10">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl9" runat="server" meta:resourcekey="ContentControl9Resource1">
                             <table style="width: 100%;">
                                 <tr>
                                     <td style="vertical-align: top;width:50%" width="100%">
                                         Specjalizacje biegłego</td><td style="vertical-align: top;width:50%">
                                             Dostępne specjalizacje</td></tr>
                                 <tr>
                                     <td style="vertical-align: top;width:50%" width="100%">
                                         <asp:Panel ID="Panel4" runat="server" Height="240px" ScrollBars="Vertical" meta:resourcekey="Panel4Resource1">

                                        
                                         </asp:Panel>
                                     </td>
                                     <td style="vertical-align: top;width:50%">
                                             <asp:Panel ID="Panel9" runat="server" ScrollBars="Vertical" Height="250px" meta:resourcekey="Panel9Resource1">
                                             </asp:Panel>
                                         
                                     </td>
                                 </tr>
                             </table>                            <br />
                         <asp:SqlDataSource ID="SqlDataSource1f" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:wap %>" 
                                    
                                    SelectCommand="SELECT DISTINCT id_,nazwa FROM [glo_specjalizacje] ORDER BY [nazwa]">
                                </asp:SqlDataSource>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                      <dx:TabPage Text="uwagi" meta:resourcekey="TabPageResource11">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl10" runat="server" meta:resourcekey="ContentControl10Resource1">
                            <div style="min-height:275px;"><table style="width: 100%;"><tr><td>Uwagi</td></tr><tr><td><asp:TextBox ID="TxUwagi" runat="server" TextMode="MultiLine" Width="100%" Height="100%" Rows="12" meta:resourcekey="TxUwagiResource1"></asp:TextBox></td></tr></table></div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                      <dx:TabPage Text="Dane statystyczne" meta:resourcekey="TabPageResource12">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl11" runat="server" meta:resourcekey="ContentControl11Resource1">
                            <div style="min-height:275px;">
                                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="kwerendyStatystyczne" DataTextField="Nazwa" DataValueField="kwerenda">
                                </asp:DropDownList>
                                
                                <asp:SqlDataSource ID="kwerendyStatystyczne" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT Nazwa, kwerenda, id_ FROM dane_statystyczne WHERE (czy_us &lt;&gt; 1) ORDER BY Nazwa">
                                </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server"  meta:resourcekey="GridView2Resource2" Width="100%"></asp:GridView></div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                      <dx:TabPage Text="Historia powołań" meta:resourcekey="TabPageResource13">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl12" runat="server" meta:resourcekey="ContentControl12Resource1">
                              <div style="min-height:275px;">
                                  <table style="width: 100%;">
                                      <tr>
                                          <td style="width: 160px" valign="top">
                                              <table style="width:100%;"><tr><td>od:</td><td>
                                                  <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" meta:resourcekey="ASPxDateEdit1Resource1">
                                                  </dx:ASPxDateEdit>
                                                  </td></tr><tr><td>do </td><td>
                                                      <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" meta:resourcekey="ASPxDateEdit2Resource1" AllowNull="False">
                                                      </dx:ASPxDateEdit>
                                                      </td></tr><tr><td  colspan="2">
                                                      <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" CssClass="button_"  Width="100%" meta:resourcekey="LinkButton5Resource1">Dodaj</asp:LinkButton>
                                                      </td></tr><tr><td  colspan="2">
                                                      <asp:LinkButton ID="LinkButton8" runat="server" CausesValidation="False" CssClass="button_"  Width="100%" meta:resourcekey="LinkButton8Resource1">Zmień</asp:LinkButton>
                                                  </td></tr><tr><td  colspan="2">
                                                      <asp:LinkButton ID="LinkButton9" runat="server" CausesValidation="False" CssClass="button_"  Width="100%" meta:resourcekey="LinkButton9Resource1">Usuń</asp:LinkButton>
                                                      </td></tr></table><br />
                                              <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1"></asp:Label>
                                              <br /><br /></td><td style="width: 60%" valign="top"><asp:Panel ID="Panel3" runat="server" Height="200px" ScrollBars="Vertical" meta:resourcekey="Panel3Resource1">
                                              <asp:SqlDataSource ID="powolania" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT ident, data_od, data_do, czyus, id_bieglego FROM tbl_powolania WHERE (czyus = 0) AND (id_bieglego = @id_bieglego)">
                                                  <SelectParameters>
                                                      <asp:SessionParameter Name="id_bieglego" SessionField="id_osoby" Type="Int32" />
                                                  </SelectParameters>
                                              </asp:SqlDataSource>
                                              <asp:GridView ID="GridView25" runat="server" AutoGenerateColumns="False" CellPadding="0" DataKeyNames="ident,data_od,data_do" DataSourceID="powolania" ForeColor="#333333" GridLines="None"  Width="100%" meta:resourcekey="GridView25Resource1">
                                                  <AlternatingRowStyle BackColor="White" />
                                                  <Columns>
                                                      <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                                                      <asp:BoundField DataField="data_od" DataFormatString="{0:d}" HeaderText="od" SortExpression="data_od" ReadOnly="True" meta:resourcekey="BoundFieldResource1" />
                                                      <asp:BoundField DataField="data_do" DataFormatString="{0:d}" HeaderText="do" SortExpression="data_do" ReadOnly="True" meta:resourcekey="BoundFieldResource2" />
                                                  </Columns>
                                                  <EditRowStyle BackColor="#2461BF" />
                                                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                  <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                  <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                  <RowStyle BackColor="#EFF3FB" />
                                                  <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                  <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                  <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                  <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                  <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                              </asp:GridView>
                                              </asp:Panel></td></tr></table></div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
             
            </TabPages>
        </dx:ASPxPageControl>
                <div style="text-align: right; padding: 2px">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server" />
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server" />
                </div>
       
            </EditForm>
        </Templates>