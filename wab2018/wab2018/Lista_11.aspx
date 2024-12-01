﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Lista_11.aspx.cs" Inherits="wab2018.Lista_11" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <style type="text/css">
        .InfoTable td
        {
            padding: 0 4px;
            vertical-align: top;
        }
         .auto-style1 {
             width: 229px;
         }
                
         </style>
    <script type="text/javascript">
        var keyValue;
        function OnMoreInfoClick(element, key) {
            callbackPanel.SetContentHtml("");
            popup.ShowAtElement(element);
            
            keyValue = key;
        }
        function popup_Shown(s, e) {
            callbackPanel.PerformCallback(keyValue);
        }
    

        var keySpec;
        function OnAddClick(element, key) {
            callbackPanel.SetContentHtml("");
            alert(key);
            //popup.ShowAtElement(element);
            
            keySpec = key;
        }
        function popup_Shown(s, e) {
            callbackPanel.PerformCallback(keyValue);
        }
    </script>
  
        <script type="text/javascript">
        function UpdateDetailGrid(s, e) {
            detailGridView.PerformCallback(masterGridView.GetFocusedRowIndex());
        }
    </script>
      <div id="tableX" style="z-index: 9999;
    top: 115px;
    position: absolute;
    width: 100%; background-color: #FFFFFF; min-height:100% " >
    
    
        <br />
        <table style="width: 100%;">
            <tr>
                <td style="width:50px;">&nbsp;</td>
                <td>    &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; <h2>         Wykaz biegłych sądowych</h2>
      </td>
              
            </tr>
           
        </table>
           <br />
    
     <div style="width:95%;margin-left:auto;margin-right:auto ">

           <table style="margin-left:auto;margin-right:auto;" class="dxflInternalEditorTable_Aqua">
        <tr>
            <td style="width: 300px">
              
                    
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Wyświetl po specjalizacji" 
                    AutoPostBack="True" oncheckedchanged="CheckBox1_CheckedChanged" TabIndex="1" meta:resourcekey="CheckBox1Resource1" />
            &nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="specjalizacje" DataTextField="nazwa" DataValueField="id_" 
                     onselectedindexchanged="wyswietlPoSpecjalizacji" Enabled="False" meta:resourcekey="DropDownList1Resource1">
                </asp:DropDownList>
                <asp:SqlDataSource ID="specjalizacje" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT [id_], [nazwa] FROM [glo_specjalizacje] ORDER BY [nazwa]"></asp:SqlDataSource>
            </td>
            <td>
              
                    
                <asp:CheckBox ID="CheckBox4" runat="server" Text="Archiwum" AutoPostBack="True" OnCheckedChanged="CheckBox4_CheckedChanged" meta:resourcekey="CheckBox4Resource1" />
            </td>
           <td align="right" style="width: 400px" >
               <asp:LinkButton ID="LinkButton4" runat="server" Text="Drukuj" CssClass="button_" OnClick="print_" meta:resourcekey="LinkButton4Resource1"></asp:LinkButton>
               <asp:LinkButton ID="LinkButton14" runat="server" CssClass="button_" OnClick="LinkButton14_Click" meta:resourcekey="LinkButton14Resource1" Text="zestawienie"></asp:LinkButton>
               <asp:LinkButton ID="LinkButton6" runat="server" Text="Excel" CssClass="button_" OnClick="makeExcell" meta:resourcekey="LinkButton6Resource1" ></asp:LinkButton>
           </td>
         </tr>   

        </table>


         <asp:Panel ID="normalny" runat="server" meta:resourcekey="normalnyResource1">


            <dx:ASPxGridView ID="ASPxGridView2" ClientInstanceName="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnCustomErrorText="ASPxGridView1_CustomErrorText" Width="100%" Theme="Office2003Silver" EnableTheming="True" OnHeaderFilterFillItems="ASPxGridView2_HeaderFilterFillItems" meta:resourcekey="ASPxGridView2Resource1">
                <ClientSideEvents BatchEditStartEditing="onStartEdit" />
                <SettingsPager PageSize="15">
<PageSizeItemSettings ShowAllItem="True" Items="10, 20, 50"></PageSizeItemSettings>
                </SettingsPager>
                <SettingsEditing Mode="Batch"></SettingsEditing>

                <Settings ShowFilterRow="True" ShowFilterBar="Visible" ShowFilterRowMenu="True" ShowHeaderFilterBlankItems="False" />

<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <SettingsPopup>
                    <HeaderFilter CloseOnEscape="True" />
                </SettingsPopup>
                <SettingsSearchPanel Visible="True" />
                <Columns>
                     <dx:GridViewDataTextColumn VisibleIndex="0" meta:resourcekey="GridViewDataTextColumnResource1" ShowInCustomizationForm="True">
                           <Settings AllowAutoFilter="True" />
                           <SettingsHeaderFilter>
                               <DateRangeCalendarSettings TodayButtonText="Dzisiaj" />
                           </SettingsHeaderFilter>
                           <DataItemTemplate>
                                <a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Eval("ident") %>')">
                               <asp:Image ID="Image1" runat="server" ImageUrl="~/img/button_edycja.png" meta:resourcekey="Image1Resource1" />
                              </a>
                               </DataItemTemplate>
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="tytul" Caption="Tytuł" Width="7%" meta:resourcekey="GridViewDataTextColumnResource2" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>

                   

                    <dx:GridViewDataTextColumn FieldName="imie" VisibleIndex="2" Caption="Imię" Width="7%" meta:resourcekey="GridViewDataTextColumnResource3" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="nazwisko" VisibleIndex="3" Caption="Nazwisko" Width="23%" meta:resourcekey="GridViewDataTextColumnResource4" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="data_poczatkowa" VisibleIndex="4" Caption="Powołanie od" Width="5%" meta:resourcekey="GridViewDataDateColumnResource1" ShowInCustomizationForm="True">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="data_koncowa" VisibleIndex="5" Caption="Powołania do:" Width="5%" meta:resourcekey="GridViewDataDateColumnResource2" ShowInCustomizationForm="True">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="uwagi" VisibleIndex="10" Caption="Uwagi" Width="14%" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource5" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="specjalizacjeWidok" VisibleIndex="11" Caption="Specjalizacja " ReadOnly="True" Width="21%" meta:resourcekey="GridViewDataTextColumnResource6" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
                   
                   

                     <dx:GridViewDataCheckColumn Caption="Z" FieldName="zawieszony" VisibleIndex="6" meta:resourcekey="GridViewDataCheckColumnResource1" ShowInCustomizationForm="True">
                     </dx:GridViewDataCheckColumn>
                     <dx:GridViewDataTextColumn Caption="Telefon" FieldName="telefon" Name="Telefon" VisibleIndex="9">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Adres" FieldName="adres" Name="Adres" VisibleIndex="7">
                     </dx:GridViewDataTextColumn>
                   

                </Columns>
              






            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID"
                InsertCommand="INSERT INTO [Employees] ([FirstName], [LastName], [Address]) VALUES (@FirstName, @LastName, @Address)"
                SelectCommand="SELECT DISTINCT View_listaBieglych.tytul as tytul, View_listaBieglych.imie as imie,  View_listaBieglych.uwagi as uwagi, View_listaBieglych.nazwisko as nazwisko, View_listaBieglych.adres as adres,View_listaBieglych.tel1 as telefon, View_listaBieglych.specjalizacja_opis as opis , View_listaBieglych.data_poczatkowa as data_poczatkowa, View_listaBieglych.data_koncowa as data_koncowa,View_listaBieglych.ident as ident, View_listaBieglych.adres2 as adres2, View_listaBieglych.zawieszony as zawieszony, View_listaBieglych.specjalizacjeWidok as specjalizacjeWidok FROM  View_listaBieglych LEFT OUTER JOIN tbl_specjalizacje_osob ON View_listaBieglych.ident = tbl_specjalizacje_osob.id_osoby where  View_listaBieglych.data_koncowa &gt;= getdate() order by nazwisko"
                UpdateCommand="UPDATE [Employees] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address WHERE [EmployeeID] = @EmployeeID">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
              <asp:SqlDataSource ID="kwerendyStatystyczne" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT Nazwa, kwerenda FROM dane_statystyczne WHERE (czy_us &lt;&gt; 1) ORDER BY Nazwa"></asp:SqlDataSource>


            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView2" ExportedRowType="All">
            </dx:ASPxGridViewExporter>


            <br />
        </asp:Panel>
        
            <asp:Panel ID="archiwum" runat="server" meta:resourcekey="archiwumResource1">


            <dx:ASPxGridView ID="ASPxGridView8" ClientInstanceName="grid" runat="server" DataSourceID="archiwum1" AutoGenerateColumns="False" OnCustomErrorText="ASPxGridView1_CustomErrorText" Width="100%" Theme="Office2003Silver" EnableTheming="True" OnHeaderFilterFillItems="ASPxGridView2_HeaderFilterFillItems" meta:resourcekey="ASPxGridView8Resource1">
                <ClientSideEvents BatchEditStartEditing="onStartEdit" />
                <SettingsPager PageSize="15">
<PageSizeItemSettings ShowAllItem="True" Items="10, 20, 50"></PageSizeItemSettings>
                </SettingsPager>
                <SettingsEditing Mode="Batch"></SettingsEditing>

                <Settings ShowFilterRow="True" ShowFilterBar="Visible" ShowFilterRowMenu="True" ShowHeaderFilterBlankItems="False" />

<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <SettingsPopup>
                    <HeaderFilter CloseOnEscape="True" />
                </SettingsPopup>
                <SettingsSearchPanel Visible="True" />
                <Columns>
                     <dx:GridViewDataTextColumn VisibleIndex="0" meta:resourcekey="GridViewDataTextColumnResource7" ShowInCustomizationForm="True">
                           <Settings AllowAutoFilter="True" />
                           <DataItemTemplate>
                                <a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Eval("ident") %>')">
                               <asp:Image ID="Image2" runat="server" ImageUrl="~/img/button_edycja.png" meta:resourcekey="Image1Resource2" />
                              </a>
                               </DataItemTemplate>
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="tytul" Caption="Tytuł" Width="7%" meta:resourcekey="GridViewDataTextColumnResource8" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>

                   

                    <dx:GridViewDataTextColumn FieldName="imie" VisibleIndex="2" Caption="Imię" Width="7%" meta:resourcekey="GridViewDataTextColumnResource9" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="nazwisko" VisibleIndex="3" Caption="Nazwisko" Width="23%" meta:resourcekey="GridViewDataTextColumnResource10" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="data_poczatkowa" VisibleIndex="5" Caption="Powołanie od" Width="5%" meta:resourcekey="GridViewDataDateColumnResource3" ShowInCustomizationForm="True">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="data_koncowa" VisibleIndex="6" Caption="Powołania do:" Width="5%" meta:resourcekey="GridViewDataDateColumnResource4" ShowInCustomizationForm="True">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="uwagi" VisibleIndex="10" Caption="Uwagi" Width="14%" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource11" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="specjalizacjeWidok" VisibleIndex="11" Caption="Specjalizacja " ReadOnly="True" Width="21%" meta:resourcekey="GridViewDataTextColumnResource12" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
                   
                   

                     <dx:GridViewDataCheckColumn Caption="Z" FieldName="zawieszony" VisibleIndex="7" meta:resourcekey="GridViewDataCheckColumnResource2" ShowInCustomizationForm="True">
                     </dx:GridViewDataCheckColumn>
                  <dx:GridViewDataColumn Caption="Adres z telefonem" VisibleIndex="9" Width="15%" meta:resourcekey="GridViewDataColumnResource2" ShowInCustomizationForm="True">
                      <Settings AllowAutoFilter="True" AllowHeaderFilter="True" />
                <DataItemTemplate>

                  <div style="padding: 5px">
                    <table class="templateTable">
                        
                        <tr>
                           
                            <td class="value">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text='<%# Eval("adres") %>' meta:resourcekey="lblBirthDateResource2" />
                            </td>
                        </tr>
                        <tr>
                            <td class="value">
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text='<%# Eval("telefon", "{0:d}") %>' meta:resourcekey="lblHireDateResource2" />
                            </td>
                        </tr>
                        
                       
                    </table>

                </DataItemTemplate>
            </dx:GridViewDataColumn>
                   

                </Columns>
              






            </dx:ASPxGridView>
            <asp:SqlDataSource ID="archiwum1" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID"
                InsertCommand="INSERT INTO [Employees] ([FirstName], [LastName], [Address]) VALUES (@FirstName, @LastName, @Address)"
                SelectCommand="SELECT DISTINCT View_listaBieglych.tytul as tytul, View_listaBieglych.imie as imie,  View_listaBieglych.uwagi as uwagi, View_listaBieglych.nazwisko as nazwisko, View_listaBieglych.adres as adres,View_listaBieglych.tel1 as telefon, View_listaBieglych.specjalizacja_opis as opis , View_listaBieglych.data_poczatkowa as data_poczatkowa, View_listaBieglych.data_koncowa as data_koncowa,View_listaBieglych.ident as ident, View_listaBieglych.adres2 as adres2, View_listaBieglych.zawieszony as zawieszony, View_listaBieglych.specjalizacjeWidok as specjalizacjeWidok FROM  View_listaBieglych LEFT OUTER JOIN tbl_specjalizacje_osob ON View_listaBieglych.ident = tbl_specjalizacje_osob.id_osoby where  View_listaBieglych.data_koncowa &lt; getdate() order by nazwisko"
                UpdateCommand="UPDATE [Employees] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address WHERE [EmployeeID] = @EmployeeID">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT Nazwa, kwerenda FROM dane_statystyczne WHERE (czy_us &lt;&gt; 1) ORDER BY Nazwa"></asp:SqlDataSource>


            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" GridViewID="ASPxGridView2" ExportedRowType="All">
            </dx:ASPxGridViewExporter>


            <br />
        </asp:Panel>
         
        </div>

      <dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" AllowDragging="True"
        PopupHorizontalAlign="OutsideRight" HeaderText="Dane biegłego" Theme="Aqua" MinHeight="300px" MinWidth="550px" OnWindowCallback ="popup_WindowCallback" CloseAction="CloseButton" OnPopupElementResolve="popup_PopupElementResolve" OnUnload="popup_Unload" meta:resourcekey="popupResource1">
        <ContentCollection>

             
            <dx:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource1" >
                
 <dx:ASPxCallbackPanel ID="callbackPanel" ClientInstanceName="callbackPanel" runat="server"
                    Width="450px" Height="120px" OnCallback="callbackPanel_Callback" RenderMode="Table" meta:resourcekey="callbackPanelResource1">
                    <PanelCollection>
                        <dx:PanelContent runat="server" meta:resourcekey="PanelContentResource1">
                            <asp:Panel ID="Panel1" runat="server" Visible="False" meta:resourcekey="Panel1Resource1">

                                  <dx:ASPxPageControl ID="carTabPage" runat="server" ActiveTabIndex="2" EnableHierarchyRecreation="True" Theme="Office2010Blue" meta:resourcekey="carTabPageResource1" OnActiveTabChanged="carTabPage_ActiveTabChanged">
            <TabPages >
                  <dx:TabPage Text="Dane osobowe" meta:resourcekey="TabPageResource1">
                       <ContentCollection>
                        <dx:ContentControl ID="ContentControl6" runat="server" meta:resourcekey="ContentControl6Resource1">



                            <asp:SqlDataSource ID="daneBieglego" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT ident, imie, nazwisko, pesel, tytul, data_poczatkowa, data_koncowa, czy_zaw,specjalizacja_opis FROM tbl_osoby WHERE (ident = @idBieglego)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idBieglego" SessionField="id_osoby" />
                                </SelectParameters>
                            </asp:SqlDataSource>




                            <dx:ASPxVerticalGrid ID="ASPxVerticalGrid1" runat="server" AutoGenerateRows="False" DataSourceID="daneBieglego" EnableTheming="True" KeyFieldName="ident" Theme="Office2010Blue" Width="700px" meta:resourcekey="ASPxVerticalGrid1Resource1">
                                <Rows>
                                    <dx:VerticalGridTextRow Caption="Imię" FieldName="imie" VisibleIndex="1" meta:resourcekey="VerticalGridTextRowResource1">
                                    </dx:VerticalGridTextRow>
                                    <dx:VerticalGridTextRow Caption="Nazwisko" FieldName="nazwisko" VisibleIndex="2" meta:resourcekey="VerticalGridTextRowResource2">
                                    </dx:VerticalGridTextRow>
                                    <dx:VerticalGridTextRow Caption="PESEL" FieldName="pesel" ReadOnly="True" VisibleIndex="3" meta:resourcekey="VerticalGridTextRowResource3">
                                    </dx:VerticalGridTextRow>
                                    <dx:VerticalGridTextRow Caption="Tytuł" FieldName="tytul" VisibleIndex="0" meta:resourcekey="VerticalGridTextRowResource4">
                                    </dx:VerticalGridTextRow>
                                    <dx:VerticalGridDateRow Caption="Powołanie od:" FieldName="data_poczatkowa" UnboundType="DateTime" VisibleIndex="4" meta:resourcekey="VerticalGridDateRowResource1">
                                    </dx:VerticalGridDateRow>
                                    <dx:VerticalGridDateRow Caption="Powołanie do:" FieldName="data_koncowa" UnboundType="DateTime" VisibleIndex="5" meta:resourcekey="VerticalGridDateRowResource2">
                                    </dx:VerticalGridDateRow>
                                    <dx:VerticalGridCheckRow Caption="Zawieszenie" FieldName="czy_zaw" VisibleIndex="6" meta:resourcekey="VerticalGridCheckRowResource1">
                                    </dx:VerticalGridCheckRow>
                                    <dx:VerticalGridTextRow Caption="Specjalizacja opis" FieldName="specjalizacja_opis" Height="2" VisibleIndex="7" meta:resourcekey="VerticalGridTextRowResource5">
                                    </dx:VerticalGridTextRow>
                                </Rows>
                                <Settings ShowCategoryIndents="False" />
                                <SettingsPager Mode="ShowPager" Visible="False">
                                </SettingsPager>
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                            </dx:ASPxVerticalGrid>

                          </dx:ContentControl>
                            </ContentCollection>
                      </dx:TabPage>

                <dx:TabPage Text="Dane kontaktowe" meta:resourcekey="TabPageResource2">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl1" runat="server" meta:resourcekey="ContentControl1Resource1">


                                   <asp:SqlDataSource ID="DaneKontaktowe" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT distinct ulica as Adres, kod_poczt as [kod pocztowy], miejscowosc as [Miejscowość], tel1, tel2, email, adr_kores, kod_poczt_kor, miejscowosc_kor, ident FROM tbl_osoby WHERE (ident = @idBieglego)">
                                       <SelectParameters>
                                           <asp:SessionParameter Name="idBieglego" SessionField="id_osoby" />
                                       </SelectParameters>
                                   </asp:SqlDataSource>
                                <dx:ASPxVerticalGrid ID="ASPxVerticalGrid2" runat="server" AutoGenerateRows="False" DataSourceID="DaneKontaktowe" EnableTheming="True" Theme="Office2010Blue" Width="700px" meta:resourcekey="ASPxVerticalGrid2Resource1">
                                    <Rows>
                                        <dx:VerticalGridTextRow FieldName="Adres" VisibleIndex="0" meta:resourcekey="VerticalGridTextRowResource6">
                                        </dx:VerticalGridTextRow>
                                        <dx:VerticalGridTextRow Caption="Kod pocztowy" FieldName="kod pocztowy" VisibleIndex="1" meta:resourcekey="VerticalGridTextRowResource7">
                                        </dx:VerticalGridTextRow>
                                        <dx:VerticalGridTextRow FieldName="Miejscowość" VisibleIndex="2" meta:resourcekey="VerticalGridTextRowResource8">
                                        </dx:VerticalGridTextRow>
                                        <dx:VerticalGridTextRow Caption="Telefon" FieldName="tel1" VisibleIndex="3" meta:resourcekey="VerticalGridTextRowResource9">
                                        </dx:VerticalGridTextRow>
                                        <dx:VerticalGridTextRow Caption="Telefon" FieldName="tel2" VisibleIndex="4" meta:resourcekey="VerticalGridTextRowResource10">
                                        </dx:VerticalGridTextRow>
                                        <dx:VerticalGridTextRow Caption="Email" FieldName="email" VisibleIndex="5" meta:resourcekey="VerticalGridTextRowResource11">
                                        </dx:VerticalGridTextRow>
                                        <dx:VerticalGridTextRow Caption="Adres korespondecyjny" FieldName="adr_kores" VisibleIndex="7" meta:resourcekey="VerticalGridTextRowResource12">
                                        </dx:VerticalGridTextRow>
                                        <dx:VerticalGridTextRow Caption="Kod pocztowy" FieldName="kod_poczt_kor" VisibleIndex="8" meta:resourcekey="VerticalGridTextRowResource13">
                                        </dx:VerticalGridTextRow>
                                        <dx:VerticalGridTextRow Caption="Miejscowość" FieldName="miejscowosc_kor" VisibleIndex="9" meta:resourcekey="VerticalGridTextRowResource14">
                                        </dx:VerticalGridTextRow>
                                        <dx:VerticalGridTextRow Caption="Dane korespondencyjne" VisibleIndex="6" meta:resourcekey="VerticalGridTextRowResource15">
                                            <PropertiesTextEdit>
                                                <Style Font-Bold="True">
                                                </Style>
                                            </PropertiesTextEdit>
                                            <HeaderStyle Font-Bold="True" />
                                        </dx:VerticalGridTextRow>
                                    </Rows>
                                    <Settings ShowCategoryIndents="False" />
                                    <SettingsPager Mode="ShowPager" Visible="False">
                                    </SettingsPager>
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                </dx:ASPxVerticalGrid>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Specjalizacje" meta:resourcekey="TabPageResource3">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl2" runat="server" meta:resourcekey="ContentControl2Resource1">
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT nazwa FROM View_pozycje_specjalizacji WHERE (id_osoby = @id_biegłego) ORDER BY nazwa">
                         <SelectParameters>
                             <asp:SessionParameter Name="id_biegłego" SessionField="id_osoby" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                              <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Theme="Office2010Blue" Width="100%" meta:resourcekey="ASPxGridView3Resource1">
                                  <SettingsCommandButton>
                                      <ShowAdaptiveDetailButton ButtonType="Image">
                                      </ShowAdaptiveDetailButton>
                                      <HideAdaptiveDetailButton ButtonType="Image">
                                      </HideAdaptiveDetailButton>
                                  </SettingsCommandButton>
                                  <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                  <Columns>
                                      <dx:GridViewDataTextColumn Caption="Specjalizacje biegłego" FieldName="nazwa" ShowInCustomizationForm="True" VisibleIndex="0" meta:resourcekey="GridViewDataTextColumnResource13">
                                          <PropertiesTextEdit NullText="Brak danych">
                                          </PropertiesTextEdit>
                                      </dx:GridViewDataTextColumn>
                                  </Columns>
                              </dx:ASPxGridView>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="uwagi" meta:resourcekey="TabPageResource4">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl3" runat="server" meta:resourcekey="ContentControl3Resource1">
                            <div style="min-height:275px;"><table style="width: 100%;"><tr><td>Uwagi</td></tr><tr><td><asp:TextBox ID="TextBox9" runat="server" TextMode="MultiLine" Width="100%" Height="100%" Rows="12" meta:resourcekey="TextBox9Resource1"></asp:TextBox></td></tr></table></div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Dane statystyczne" meta:resourcekey="TabPageResource5">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl4" runat="server" meta:resourcekey="ContentControl4Resource1">
                            <div style="min-height:275px;"><asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="changeQuerry" DataSourceID="kwerendyStatystyczne" DataTextField="Nazwa" DataValueField="kwerenda" meta:resourcekey="DropDownList3Resource1"></asp:DropDownList>
                    <asp:GridView ID="GridView1" runat="server" Css meta:resourcekey="GridView1Resource1"></asp:GridView></div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                  <dx:TabPage Text="Historia powołań" meta:resourcekey="TabPageResource6">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl5" runat="server" meta:resourcekey="ContentControl5Resource1">
                              <div style="min-height:275px;">
                                  <table style="width: 100%;">
                                      <tr>
                                          <td style="width: 60%" valign="top"><asp:Panel ID="Panel8" runat="server" Height="200px" ScrollBars="Vertical" meta:resourcekey="Panel8Resource1">
                                              <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>"  SelectCommand="SELECT DISTINCT View_powolania.ident, View_powolania.id_powolania, tbl_powolania.data_od, tbl_powolania.data_do, tbl_powolania.czyus, tbl_powolania.id_bieglego FROM            View_powolania INNER JOIN      tbl_powolania ON View_powolania.ident = tbl_powolania.ident GROUP BY View_powolania.ident, View_powolania.id_powolania, tbl_powolania.data_od, tbl_powolania.data_do, tbl_powolania.czyus, tbl_powolania.id_bieglego HAVING        (tbl_powolania.czyus = 0) AND (tbl_powolania.id_bieglego = @id_bieglego)">
                                                  <SelectParameters>
                                                      <asp:SessionParameter Name="id_bieglego" SessionField="id_osoby" Type="Int32" />
                                                  </SelectParameters>
                                              </asp:SqlDataSource>
                                              <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" EnableTheming="True" KeyFieldName="data_od" Theme="Office2010Blue" Width="100%" meta:resourcekey="ASPxGridView4Resource1">
                                                  <SettingsCommandButton>
                                                      <ShowAdaptiveDetailButton ButtonType="Image">
                                                      </ShowAdaptiveDetailButton>
                                                      <HideAdaptiveDetailButton ButtonType="Image">
                                                      </HideAdaptiveDetailButton>
                                                  </SettingsCommandButton>
                                                  <Columns>
                                                      <dx:GridViewDataDateColumn Caption="Powołanie od:" FieldName="data_od" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" meta:resourcekey="GridViewDataDateColumnResource5">
                                                      </dx:GridViewDataDateColumn>
                                                      <dx:GridViewDataDateColumn Caption="Powołanie do:" FieldName="data_do" ReadOnly="True" ShowInCustomizationForm="True" UnboundType="DateTime" VisibleIndex="3" meta:resourcekey="GridViewDataDateColumnResource6">
                                                      </dx:GridViewDataDateColumn>
                                                  </Columns>
                                              </dx:ASPxGridView>
                                              </asp:Panel></td></tr></table></div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                  <dx:TabPage Text="Skargi" meta:resourcekey="TabPageResource7">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl13" runat="server" meta:resourcekey="ContentControl13Resource1">
                              <div style="min-height:275px;">
                                  <table style="width: 100%;">
                                      <tr>
                                          <td style="width: 60%" valign="top"><asp:Panel ID="Panel5" runat="server" Height="200px" ScrollBars="Vertical" meta:resourcekey="Panel5Resource1">
                                              <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSkargi" EnableTheming="True" Theme="Office2010Blue" Width="100%" meta:resourcekey="ASPxGridView1Resource1">
                                                  <SettingsCommandButton>
                                                      <ShowAdaptiveDetailButton ButtonType="Image">
                                                      </ShowAdaptiveDetailButton>
                                                      <HideAdaptiveDetailButton ButtonType="Image">
                                                      </HideAdaptiveDetailButton>
                                                  </SettingsCommandButton>
                                                  <Columns>
                                                      <dx:GridViewDataTextColumn Caption="Numer" FieldName="numer" ShowInCustomizationForm="True" VisibleIndex="0" meta:resourcekey="GridViewDataTextColumnResource14">
                                                      </dx:GridViewDataTextColumn>
                                                      <dx:GridViewDataTextColumn Caption="Rok" FieldName="rok" ShowInCustomizationForm="True" VisibleIndex="1" meta:resourcekey="GridViewDataTextColumnResource15">
                                                      </dx:GridViewDataTextColumn>
                                                      <dx:GridViewDataDateColumn Caption="Data wpływu" FieldName="dataWplywu" ShowInCustomizationForm="True" VisibleIndex="2" meta:resourcekey="GridViewDataDateColumnResource7">
                                                      </dx:GridViewDataDateColumn>
                                                      <dx:GridViewDataDateColumn Caption="Data pisma" FieldName="dataPisma" ShowInCustomizationForm="True" VisibleIndex="3" meta:resourcekey="GridViewDataDateColumnResource8">
                                                      </dx:GridViewDataDateColumn>
                                                      <dx:GridViewDataTextColumn Caption="Sygnatura" FieldName="Sygnatura" ShowInCustomizationForm="True" VisibleIndex="4" meta:resourcekey="GridViewDataTextColumnResource16">
                                                      </dx:GridViewDataTextColumn>
                                                      <dx:GridViewDataTextColumn Caption="Wizytator" FieldName="wizytator" ShowInCustomizationForm="True" VisibleIndex="5" meta:resourcekey="GridViewDataTextColumnResource17">
                                                      </dx:GridViewDataTextColumn>
                                                      <dx:GridViewDataCheckColumn Caption="Zakreślono" FieldName="zakreslono" ShowInCustomizationForm="True" VisibleIndex="6" meta:resourcekey="GridViewDataCheckColumnResource3">
                                                      </dx:GridViewDataCheckColumn>
                                                      <dx:GridViewDataTextColumn Caption="Uwagi" FieldName="uwagi" ShowInCustomizationForm="True" VisibleIndex="8" meta:resourcekey="GridViewDataTextColumnResource18">
                                                      </dx:GridViewDataTextColumn>
                                                  </Columns>
                                              </dx:ASPxGridView>
                                              <asp:SqlDataSource ID="SqlDataSkargi" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>"  SelectCommand="SELECT ident, numer, rok, dataWplywu, dataPisma, Sygnatura, wizytator, zakreslono, dataZakreslenia, uwagi FROM tbl_skargi WHERE (idBieglego = @idBieglego) AND (czyUs = 0)">
                                                  <SelectParameters>
                                                      <asp:SessionParameter Name="idBieglego" SessionField="id_osoby" DefaultValue="" />
                                                  </SelectParameters>
                                              </asp:SqlDataSource>
                                              </asp:Panel></td></tr></table></div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>
</dx:ASPxTabControl>
                            </asp:Panel>
                         
                              <asp:Panel ID="Panel2" runat="server" Visible="False" meta:resourcekey="Panel2Resource1">

      <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="4" EnableHierarchyRecreation="True" Theme="Office2010Blue" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged" meta:resourcekey="ASPxPageControl1Resource1">
            <TabPages >
                      <dx:TabPage Text="Dane osobowe" meta:resourcekey="TabPageResource8">
                       <ContentCollection>
                        <dx:ContentControl ID="ContentControl7" runat="server" meta:resourcekey="ContentControl7Resource1">




                            <table style="width:100%;">
                                <tr>
                                    <td>Tytuł</td>
                                    <td>
                                        <asp:TextBox ID="TxBTytul" runat="server" meta:resourcekey="TxBTytulResource1" ></asp:TextBox>
                                    </td>
                                    <td style="width: 50%">Specjalizacja&nbsp; opis (doprecyzowanie) </td>
                                </tr>
                                <tr>
                                    <td>Imie</td>
                                    <td>
                                        <asp:TextBox ID="TxbImie" runat="server" meta:resourcekey="TxbImieResource1"></asp:TextBox>
                                    </td>
                                    <td align="center" rowspan="4" valign="top">
                                        <asp:TextBox ID="txspecjalizacja_opis" runat="server" Height="99%" TextMode="MultiLine" Width="99%" meta:resourcekey="txspecjalizacja_opisResource1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nazwisko</td>
                                    <td>
                                        <asp:TextBox ID="TxBNazwisko" runat="server" meta:resourcekey="TxBNazwiskoResource1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>PESEL</td>
                                    <td>
                                        <asp:TextBox ID="TxbPesel" runat="server" meta:resourcekey="TxbPeselResource1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Data powołania od</td>
                                    <td>
                                        <dx:ASPxDateEdit ID="ASPxDateEdit3" runat="server" OnDateChanged="ASPxDateEdit3_DateChanged" meta:resourcekey="ASPxDateEdit3Resource1">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Data powołania do</td>
                                    <td>
                                        <dx:ASPxDateEdit ID="ASPxDateEdit4" runat="server" meta:resourcekey="ASPxDateEdit4Resource1">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width: 50%">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" OnSelectedIndexChanged="zmianaZawieszenia" meta:resourcekey="DropDownList4Resource1">
                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource1">Brak zawieszenia</asp:ListItem>
                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">Zawieszenie od</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <dx:ASPxDateEdit ID="zawieszenieData" runat="server" OnDateChanged="ASPxDateEdit7_DateChanged" Visible="False" meta:resourcekey="zawieszenieDataResource1">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width: 50%">&nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT ident, imie, nazwisko, pesel, tytul, data_poczatkowa, data_koncowa FROM tbl_osoby WHERE (ident = @idBieglego)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idBieglego" SessionField="id_osoby" />
                                </SelectParameters>
                            </asp:SqlDataSource>


                            </dx:ContentControl>
                            </ContentCollection>
                      </dx:TabPage>

                      <dx:TabPage Text="Dane kontaktowe" meta:resourcekey="TabPageResource9">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl8" runat="server" meta:resourcekey="ContentControl8Resource1">
                                <table class="dxeBinImgCPnlSys">
                                <tr>
                                    <td class="auto-style1">Adres</td>
                                    <td>
                                        <asp:TextBox runat="server" ID="TxAdres1" meta:resourcekey="TxAdres1Resource1"></asp:TextBox>

                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Kod pocztowy</td>
                                    <td>
                                        <asp:TextBox ID="Txkod1" runat="server" meta:resourcekey="Txkod1Resource1"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Miejscowość</td>
                                    <td>
                                        <asp:TextBox ID="TxMiejscowosc1" runat="server" meta:resourcekey="TxMiejscowosc1Resource1"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                    <tr>
                                        <td >Telefon</td>
                                        <td >
                                            <asp:TextBox ID="TxTelefon1" runat="server" meta:resourcekey="TxTelefon1Resource1"></asp:TextBox>
                                        </td>
                                        <td >&nbsp;</td>
                                    </tr>
                                <tr>
                                    <td >Telefon</td>
                                    <td >
                                        <asp:TextBox ID="TxTelefon2" runat="server" meta:resourcekey="TxTelefon2Resource1"></asp:TextBox>

                                    </td>
                                    <td >&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">email</td>
                                    <td>
                                        <asp:TextBox ID="TxEmail" runat="server" meta:resourcekey="TxEmailResource1"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td >&nbsp;</td>
                                    <td >
                                        &nbsp;</td>
                                    <td ></td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                    <tr>
                                        <td >Dane korespondencyjne</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td >Adres korespondencyjny</td>
                                        <td>
                                            <asp:TextBox ID="TxAdres2" runat="server" meta:resourcekey="TxAdres2Resource1"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Kod pocztowy</td>
                                        <td>
                                            <asp:TextBox ID="TxKod2" runat="server" meta:resourcekey="TxKod2Resource1"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Miejscowość</td>
                                        <td>
                                            <asp:TextBox ID="Txmiejscowosc2" runat="server" meta:resourcekey="Txmiejscowosc2Resource1"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                            </table>
                       

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

                                             <dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" DataSourceID="Specjalizacje_temp" OnCustomButtonCallback="ASPxGridView6_CustomButtonCallback" Width="100%" EnableCallBacks="False" meta:resourcekey="ASPxGridView6Resource1" >

                                                 <ClientSideEvents FocusedRowChanged="UpdateDetailGrid" />
                                                  <SettingsPager PageSize="8">
                                                 </SettingsPager>
                                                 <Settings ShowFilterRow="True" />
                                                  <SettingsCommandButton>
                                                     <ShowAdaptiveDetailButton ButtonType="Image">
                                                     </ShowAdaptiveDetailButton>
                                                     <HideAdaptiveDetailButton ButtonType="Image">
                                                     </HideAdaptiveDetailButton>
                                                 </SettingsCommandButton>
                                                 <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                 <Columns>
                                                     <dx:GridViewDataTextColumn FieldName="nazwa" ShowInCustomizationForm="True" VisibleIndex="2" meta:resourcekey="GridViewDataTextColumnResource19">
                                                     </dx:GridViewDataTextColumn>
                                                        <dx:GridViewCommandColumn ShowNewButton="true" VisibleIndex="0" ButtonRenderMode="Image" meta:resourcekey="GridViewCommandColumnResource1">
                                                          <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="Clone2" meta:resourcekey="GridViewCommandColumnCustomButtonResource1">
                        <Image ToolTip="Clone Record" Url="img/minus.jpg" />

                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
                                                               </dx:GridViewCommandColumn>
                                                 </Columns>
                                             </dx:ASPxGridView>
                                             
                                             
                                             <asp:SqlDataSource ID="Specjalizacje_temp" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT tbl_sprcjalizacje_temp.nr_sesji, glo_specjalizacje.nazwa, glo_specjalizacje.id_, tbl_sprcjalizacje_temp.id_ AS id_temp FROM tbl_sprcjalizacje_temp LEFT OUTER JOIN glo_specjalizacje ON tbl_sprcjalizacje_temp.id_spec = glo_specjalizacje.id_ WHERE (tbl_sprcjalizacje_temp.nr_sesji = @id_sesji)">
                                                 <SelectParameters>
                                                     <asp:SessionParameter Name="id_sesji" SessionField="sesja" />
                                                 </SelectParameters>
                                             </asp:SqlDataSource>
                                         </asp:Panel>
                                     </td>
                                     <td style="vertical-align: top;width:50%">
                                             <asp:Panel ID="Panel9" runat="server" ScrollBars="Vertical" Height="250px" meta:resourcekey="Panel9Resource1">
                                                 <dx:ASPxGridView ID="ASPxGridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1f" KeyFieldName="nazwa" Width="100%" OnCustomButtonCallback="ASPxGridView5_CustomButtonCallback" EnableCallbackAnimation="True" EnableCallBacks="False" meta:resourcekey="ASPxGridView5Resource1">
                                                     <SettingsPager PageSize="10000" Visible="False">
                                                     </SettingsPager>
                                                     <Settings ShowFilterRow="True" />
                                                     <SettingsBehavior AllowSelectByRowClick="True" ProcessSelectionChangedOnServer="True" />
                                                     <SettingsCommandButton>
                                                         <ShowAdaptiveDetailButton ButtonType="Image">
                                                         </ShowAdaptiveDetailButton>
                                                         <HideAdaptiveDetailButton ButtonType="Image">
                                                         </HideAdaptiveDetailButton>
                                                     </SettingsCommandButton>
                                                     <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                                                     <Columns>
                                                        
                                                          
                                                         <dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" meta:resourcekey="GridViewDataTextColumnResource20">
                                                         </dx:GridViewDataTextColumn>

                                                          <dx:GridViewCommandColumn ShowNewButton="true" ShowEditButton="true" VisibleIndex="0" ButtonRenderMode="Image" meta:resourcekey="GridViewCommandColumnResource2">
                                                          <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="Clone" meta:resourcekey="GridViewCommandColumnCustomButtonResource2">
                        <Image ToolTip="Clone Record" Url="img/plus-icon.png" />

                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
                                                               </dx:GridViewCommandColumn>
                                                     </Columns>
                                                 </dx:ASPxGridView>
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
                            <div style="min-height:275px;"><asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="changeQuerry" DataSourceID="kwerendyStatystyczne" DataTextField="Nazwa" DataValueField="kwerenda" meta:resourcekey="DropDownList2Resource1"></asp:DropDownList>
                    <asp:GridView ID="GridView2" runat="server" Css meta:resourcekey="GridView2Resource2" Width="100%"></asp:GridView></div>
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
                                                      <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" meta:resourcekey="ASPxDateEdit2Resource1">
                                                      </dx:ASPxDateEdit>
                                                      <br />
                                                      </td></tr><tr><td  colspan="2">
                                                      <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" CssClass="button_" OnClick="LinkButton5_Click" Width="100%" meta:resourcekey="LinkButton5Resource1">Dodaj</asp:LinkButton>
                                                      </td></tr><tr><td  colspan="2">
                                                      <asp:LinkButton ID="LinkButton8" runat="server" CausesValidation="False" CssClass="button_" OnClick="LinkButton8_Click" Width="100%" meta:resourcekey="LinkButton8Resource1">Zmień</asp:LinkButton>
                                                  </td></tr><tr><td  colspan="2">
                                                      <asp:LinkButton ID="LinkButton9" runat="server" CausesValidation="False" CssClass="button_" OnClick="LinkButton9_Click" Width="100%" meta:resourcekey="LinkButton9Resource1">Usuń</asp:LinkButton>
                                                      </td></tr></table><br />
                                              <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1"></asp:Label>
                                              <br /><br /></td><td style="width: 60%" valign="top"><asp:Panel ID="Panel3" runat="server" Height="200px" ScrollBars="Vertical" meta:resourcekey="Panel3Resource1">
                                              <asp:SqlDataSource ID="powolania" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT ident, data_od, data_do, czyus, id_bieglego FROM tbl_powolania WHERE (czyus = 0) AND (id_bieglego = @id_bieglego)">
                                                  <SelectParameters>
                                                      <asp:SessionParameter Name="id_bieglego" SessionField="id_osoby" Type="Int32" />
                                                  </SelectParameters>
                                              </asp:SqlDataSource>
                                              <asp:GridView ID="GridView25" runat="server" AutoGenerateColumns="False" CellPadding="0" DataKeyNames="ident,data_od,data_do" DataSourceID="powolania" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView25_SelectedIndexChanged" Width="100%" meta:resourcekey="GridView25Resource1">
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
                      <dx:TabPage Text="Skargi" meta:resourcekey="TabPageResource14">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl14" runat="server" meta:resourcekey="ContentControl14Resource1">
                              <div style="min-height:275px;">
                                       <asp:LinkButton ID="LinkButton10" runat="server" CssClass="button_thin" OnClick="LinkButton10_Click" meta:resourcekey="LinkButton10Resource1">Nowa skarga</asp:LinkButton>
                                  
                                              <asp:Panel ID="Panel6" runat="server" Height="100%" ScrollBars="Vertical" meta:resourcekey="Panel6Resource1">
                                              
                                              <asp:Panel ID="Panel11" runat="server" Visible="False" Height="300px" Width="100%" HorizontalAlign="Center" meta:resourcekey="Panel11Resource1">
                                                  <table style="border: thin solid #000000; width:99%; height: 250px;" cellpadding="0" cellspacing="0">
                                                      <tr>
                                                          <td colspan="3">
                                                              <strong>
                                                              <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1"></asp:Label>
                                                              <br />
                                                              </strong>
                                                          </td>
                                                          <td>&nbsp;</td>
                                                          <td>&nbsp;</td>
                                                      </tr>
                                                      <tr>
                                                          <td  style="background-color: #E1F0FF; width: 20%;">Numer</td>
                                                          <td  style="background-color: #E1F0FF">
                                                              <asp:TextBox ID="txNumer" runat="server" meta:resourcekey="txNumerResource1"></asp:TextBox>
                                                          </td>
                                                         
                                                          <td  style="background-color: #E1F0FF; width: 20%;">Rok</td>
                                                          <td  style="background-color: #E1F0FF">
                                                              <asp:TextBox ID="txRok" runat="server" meta:resourcekey="txRokResource1"></asp:TextBox>
                                                          </td>
                                                         
                                                      </tr>
                                                      <tr>
                                                          <td style="width: 20%">Data wpływu</td>
                                                          <td style="width: 30%">
                                                              <dx:ASPxDateEdit ID="ASPxDateWplyw" runat="server" meta:resourcekey="ASPxDateWplywResource1">
                                                              </dx:ASPxDateEdit>
                                                          </td>
                                                          <td style="width: 20%">Data pisma</td>
                                                          <td style="width: 30%">
                                                              <dx:ASPxDateEdit ID="ASPxDatePismo" runat="server" meta:resourcekey="ASPxDatePismoResource1">
                                                              </dx:ASPxDateEdit>
                                                          </td>
                                                      </tr>
                                                        <tr>
                                                          <td style="background-color: #E1F0FF">Sygnatura</td>
                                                          <td style="background-color: #E1F0FF">
                                                               <asp:TextBox ID="txSygnatura" runat="server" meta:resourcekey="txSygnaturaResource1"></asp:TextBox>
                                                            </td>
                                                            <td style="background-color: #E1F0FF">Wizytator</td>
                                                            <td style="background-color: #E1F0FF">
                                                                <asp:TextBox ID="txWizytator" runat="server" meta:resourcekey="txWizytatorResource1"></asp:TextBox>
                                                            </td>
                                                      </tr>
                                                       <tr>
                                                          <td style="width: 20%">Zakreślono</td>
                                                          <td style="width: 30%">
                                                              <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="True" OnCheckedChanged="pokazDateZ" meta:resourcekey="CheckBox3Resource1" />
                                                           </td>
                                                           <td style="width: 20%">
                                                               <asp:Label ID="Label7" runat="server" Text="Data zakreślenia" meta:resourcekey="Label7Resource1"></asp:Label>
                                                           </td>
                                                           <td style="width: 30%">
                                                               <dx:ASPxDateEdit ID="ASPxDateZakreslenie" runat="server" meta:resourcekey="ASPxDateZakreslenieResource1">
                                                               </dx:ASPxDateEdit>
                                                           </td>
                                                      </tr>
                                                       <tr>
                                                          <td style="background-color: #E1F0FF">Uwagi</td>
                                                          <td colspan="3" style="background-color: #E1F0FF">  <asp:TextBox ID="uwagi" runat="server" Width="100%" TextMode="MultiLine" meta:resourcekey="uwagiResource1"></asp:TextBox></td>
                                                      </tr>
                                               
                                                  </table>

                                                  <table style="width: 100%;">
                                                      <tr>
                                                          <td align="center" style="width: 33%">
                                                                
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="auto-style2" OnClick="zapiszSkarge" meta:resourcekey="LinkButton1Resource1">Zapisz</asp:LinkButton>

                                                          </td>
                                                          <td align="center">
                                                             
                                                                 <asp:LinkButton ID="LinkButton2" runat="server" CssClass="button_thin" OnClick="anulowanieSkargi" meta:resourcekey="LinkButton2Resource1">Anuluj</asp:LinkButton>
                                                         
                                                          </td>
                                                          <td align="center">
                                                                          <asp:LinkButton ID="LinkButton13" runat="server" CssClass="auto-style2" OnClick="LinkButton13_Click" style="height: 12px" meta:resourcekey="LinkButton13Resource1">Usuń</asp:LinkButton>
                                                  

                                                          </td>
                                                      </tr>
                                                     
                                                  </table>
                                                 
                                              </asp:Panel>
                                              <dx:ASPxGridView ID="ASPxGridView7" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSkargi2" EnableTheming="True" Theme="Office2010Blue" Width="100%" OnCustomButtonCallback="ASPxGridView7_CustomButtonCallback" OnCustomCallback="ASPxGridView7_CustomCallback" EnableCallbackAnimation="True" EnableCallBacks="False" EnablePagingCallbackAnimation="True" KeyFieldName="ident" ViewStateMode="Enabled" meta:resourcekey="ASPxGridView7Resource1">
                                                  <SettingsBehavior SortMode="Value" AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
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
                                                  <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                  <Columns>
                                                      <dx:GridViewDataTextColumn Caption="Numer" FieldName="numer" ShowInCustomizationForm="True" VisibleIndex="1" meta:resourcekey="GridViewDataTextColumnResource21">
                                                      </dx:GridViewDataTextColumn>
                                                      <dx:GridViewDataTextColumn Caption="Rok" FieldName="rok" ShowInCustomizationForm="True" VisibleIndex="2" meta:resourcekey="GridViewDataTextColumnResource22">
                                                      </dx:GridViewDataTextColumn>
                                                      <dx:GridViewDataDateColumn Caption="Data wpływu" FieldName="dataWplywu" ShowInCustomizationForm="True" VisibleIndex="3" meta:resourcekey="GridViewDataDateColumnResource9">
                                                      </dx:GridViewDataDateColumn>
                                                      <dx:GridViewDataDateColumn Caption="Data pisma" FieldName="dataPisma" ShowInCustomizationForm="True" VisibleIndex="4" meta:resourcekey="GridViewDataDateColumnResource10">
                                                      </dx:GridViewDataDateColumn>
                                                      <dx:GridViewDataTextColumn Caption="Sygnatura" FieldName="Sygnatura" ShowInCustomizationForm="True" VisibleIndex="5" meta:resourcekey="GridViewDataTextColumnResource23">
                                                      </dx:GridViewDataTextColumn>
                                                      <dx:GridViewDataTextColumn Caption="Wizytator" FieldName="wizytator" ShowInCustomizationForm="True" VisibleIndex="6" meta:resourcekey="GridViewDataTextColumnResource24">
                                                      </dx:GridViewDataTextColumn>
                                                      <dx:GridViewDataCheckColumn Caption="Zakreślono" FieldName="zakreslono" ShowInCustomizationForm="True" VisibleIndex="7" meta:resourcekey="GridViewDataCheckColumnResource4">
                                                      </dx:GridViewDataCheckColumn>
                                                      <dx:GridViewDataTextColumn Caption="Uwagi" FieldName="uwagi" ShowInCustomizationForm="True" VisibleIndex="8" meta:resourcekey="GridViewDataTextColumnResource25">
                                                      </dx:GridViewDataTextColumn>
                                                             <dx:GridViewCommandColumn ShowNewButton="true" VisibleIndex="0" ButtonRenderMode="Image" Caption=" " meta:resourcekey="GridViewCommandColumnResource3">
                                                          <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="wybierz" meta:resourcekey="GridViewCommandColumnCustomButtonResource3">
                        <Image ToolTip="Edytuj/usuń skagę" Url="img/button_edycja.png" />

                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
                                                               </dx:GridViewCommandColumn>
                                                  </Columns>
                                              </dx:ASPxGridView>
                                              <asp:SqlDataSource ID="SqlDataSkargi2" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>"  SelectCommand="SELECT numer, rok, dataWplywu, dataPisma, Sygnatura, wizytator, zakreslono, dataZakreslenia, uwagi, ident FROM tbl_skargi WHERE (idBieglego = @idBieglego) AND (czyUs = 0)">
                                                  <SelectParameters>
                                                      <asp:SessionParameter Name="idBieglego" SessionField="id_osoby" DefaultValue="" />
                                                  </SelectParameters>
                                              </asp:SqlDataSource>
                                              </asp:Panel>

                                          </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>

                                  <table style="width: 100%;">
                                      <tr>
                                          <td>
                                              <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1"></asp:Label>
                                              
                                          </td>
                                          <td>
                                              &nbsp;</td>
                                          <td>&nbsp;</td>
                                      </tr>
                                     
                                      <tr>
                                          <td>
                                              <asp:Button ID="Button1" runat="server" OnClick="zapiszDaneBieglego" Text="Zapisz" CssClass="button_" meta:resourcekey="Button1Resource2" />
                                          </td>
                                          <td>&nbsp;</td>
                                          <td>
                                              <asp:Button ID="Button3" runat="server" Text="Usuń" CssClass="button_" OnClick="Button3_Click" meta:resourcekey="Button3Resource1" />
                                          </td>
                                      </tr>
                                     
                                  </table>

                            </asp:Panel>
                            <table class="InfoTable">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
              
              
               
        </ContentCollection>
        <ClientSideEvents Shown="popup_Shown" CloseUp="function(s, e) { s.PerformCallback();}" />
    </dx:ASPxPopupControl>
    </div>
  
</asp:Content>
