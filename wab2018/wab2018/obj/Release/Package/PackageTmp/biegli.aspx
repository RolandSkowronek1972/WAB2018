﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="biegli.aspx.cs" Inherits="wab2018.biegli" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

       <div id="tableX" style="z-index: 9999;
    top: 115px;
    position: absolute;
    width: 100%; background-color: #FFFFFF; min-height:100% " >
    
  
          <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>
    
  
        <br />
        <table style="width: 100%;">
            <tr>
                <td style="width:50px;">&nbsp;</td>
                <td>    &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; <h2>         Wykaz biegłych sądowych
                  
                    </h2>
      </td>
              
            </tr>
           
        </table>
           <br />
    
     <div style="width:95%;margin-left:auto;margin-right:auto ">

           <table style="width:100%;margin-left:auto;margin-right:auto;">
        <tr>
            <td style="width: 300px">
              
                    
                <aspxcheckbox ID="ASPxCheckBox1" runat="server" Text="Wyświetl po specjalizacji" Theme="MetropolisBlue">
                </aspxcheckbox>
            </td>
            <td style="width: 300px">
              
                    
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="specjalizacje" DataTextField="nazwa" DataValueField="id_" 
                     onselectedindexchanged="wyswietlPoSpecjalizacji" Enabled="False" meta:resourcekey="DropDownList1Resource1">
                </asp:DropDownList>
                <asp:SqlDataSource ID="specjalizacje" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT [id_], [nazwa] FROM [glo_specjalizacje] ORDER BY [nazwa]"></asp:SqlDataSource>
            </td>
            <td>
              
                    
                <aspxcheckbox ID="ASPxCheckBox2" runat="server" Text="Archiwum" Theme="MetropolisBlue">
                </aspxcheckbox>
            </td>
           <td align="right" style="width: 400px" >
               <asp:LinkButton ID="LinkButton4" runat="server" Text="Drukuj" CssClass="button_" OnClick="print_" meta:resourcekey="LinkButton4Resource1"></asp:LinkButton>
               <asp:LinkButton ID="LinkButton14" runat="server" CssClass="button_" OnClick="drukujZestawienie" meta:resourcekey="LinkButton14Resource1">zestawienie</asp:LinkButton>
               <asp:LinkButton ID="LinkButton6" runat="server" Text="Excel" CssClass="button_" OnClick="makeExcell" meta:resourcekey="LinkButton6Resource1" ></asp:LinkButton>
           </td>
         </tr>   

        </table>

         aaa
           <aspxpanel ID="ASPxPanel1" runat="server" Theme="MetropolisBlue" Width="100%">
               <PanelCollection>
           <br />
           <br />
           <br />
           <dx:ASPxGridView ID="ASPxGridView7" runat="server">
           </dx:ASPxGridView>
           <br />
<dx:panelcontent runat="server">
    <br />
    <asp:SqlDataSource ID="DaneBieglych" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT View_listaBieglych.ident, View_listaBieglych.imie, View_listaBieglych.uwagi, View_listaBieglych.nazwisko, View_listaBieglych.adres, View_listaBieglych.tel1 AS telefon, View_listaBieglych.specjalizacja_opis AS opis, View_listaBieglych.data_poczatkowa, View_listaBieglych.data_koncowa, View_listaBieglych.adres2, View_listaBieglych.zawieszony, CAST(COALESCE (View_listaBieglych.zawieszony, 1) AS BIT) AS zawieszenie, View_listaBieglych.specjalizacjeWidok, View_listaBieglych.pesel, View_listaBieglych.adr_kores, View_listaBieglych.kod_poczt_kor, View_listaBieglych.miejscowosc_kor, tbl_osoby.imie AS Expr1, tbl_osoby.nazwisko AS Expr2, tbl_osoby.kod_poczt, tbl_osoby.miejscowosc, View_listaBieglych.tytul, tbl_osoby.tel2, tbl_osoby.email, tbl_osoby.d_zawieszenia FROM View_listaBieglych INNER JOIN tbl_osoby ON View_listaBieglych.pesel = tbl_osoby.pesel AND View_listaBieglych.imie = tbl_osoby.imie AND View_listaBieglych.nazwisko = tbl_osoby.nazwisko AND View_listaBieglych.tytul = tbl_osoby.tytul LEFT OUTER JOIN tbl_specjalizacje_osob ON View_listaBieglych.ident = tbl_specjalizacje_osob.id_osoby WHERE (View_listaBieglych.data_koncowa &gt;= GETDATE()) ORDER BY View_listaBieglych.nazwisko"></asp:SqlDataSource>
                   <dx:aspxgridview ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DaneBieglych" EnableCallbackAnimation="True" KeyFieldName="ident" EnableTheming="True" OnStartRowEditing="ASPxGridView1_StartRowEditing" Theme="Glass" Width="100%" OnRowUpdating="ASPxGridView1_RowUpdating" OnCustomCallback="ASPxGridView1_CustomCallback" OnSelectionChanged="ASPxGridView1_SelectionChanged">
                       <SettingsEditing Mode="EditForm">
                       </SettingsEditing>
                       <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                       <SettingsCommandButton>
                           <ShowAdaptiveDetailButton ButtonType="Image">
                           </ShowAdaptiveDetailButton>
                           <HideAdaptiveDetailButton ButtonType="Image">
                           </HideAdaptiveDetailButton>
                       </SettingsCommandButton>
                       <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                       <Columns>
                           <dx:gridviewcommandcolumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                           </dx:GridViewCommandColumn>
                           <dx:gridviewdatatextcolumn FieldName="tytul" ShowInCustomizationForm="True" VisibleIndex="2">
                           </dx:GridViewDataTextColumn>
                           <dx:gridviewdatatextcolumn FieldName="imie" ShowInCustomizationForm="True" VisibleIndex="3">
                           </dx:GridViewDataTextColumn>
                         
                           <dx:gridviewdatatextcolumn FieldName="nazwisko" ShowInCustomizationForm="True" VisibleIndex="4">
                           </dx:GridViewDataTextColumn>
                         
                         
                           <dx:gridviewdatadatecolumn FieldName="data_poczatkowa" ShowInCustomizationForm="True" VisibleIndex="5">
                           </dx:GridViewDataDateColumn>
                           <dx:gridviewdatadatecolumn FieldName="data_koncowa" ShowInCustomizationForm="True" VisibleIndex="7">
                           </dx:GridViewDataDateColumn>
                            <dx:gridviewdatatextcolumn FieldName="uwagi" ShowInCustomizationForm="True" VisibleIndex="10">
                           </dx:GridViewDataTextColumn>
                          
                           <dx:gridviewdatatextcolumn FieldName="specjalizacjeWidok" VisibleIndex="12" Caption="Specjalizacja " ReadOnly="True" Width="21%" meta:resourcekey="GridViewDataTextColumnResource6" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
                     <dx:gridviewdatacheckcolumn Caption="Z" FieldName="zawieszony" VisibleIndex="8" meta:resourcekey="GridViewDataCheckColumnResource1" ShowInCustomizationForm="True">
                     </dx:GridViewDataCheckColumn>
                                 <dx:gridviewdatacolumn Caption="Adres z telefonem" VisibleIndex="9" Width="15%" meta:resourcekey="GridViewDataColumnResource1" ShowInCustomizationForm="True">
                      <Settings AllowAutoFilter="True" AllowHeaderFilter="True" />
                <DataItemTemplate>

                  <div style="padding: 5px">
                    <table class="templateTable">
                        
                        <tr>
                           
                            <td class="value">
                                <dx:aspxlabel ID="lblBirthDate" runat="server" Text='<%# Eval("adres") %>' meta:resourcekey="lblBirthDateResource1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="value">
                                <dx:aspxlabel ID="lblHireDate" runat="server" Text='<%# Eval("telefon", "{0:d}") %>' meta:resourcekey="lblHireDateResource1" />
                            </td>
                        </tr>
                        
                       
                    </table>

                </DataItemTemplate>
            </dx:GridViewDataColumn>
           
                           <dx:gridviewdatadatecolumn FieldName="ident" ShowInCustomizationForm="True" VisibleIndex="1" Width="0px">
                           </dx:GridViewDataDateColumn>
           
                       </Columns>
                        <SettingsPager Mode="ShowAllRecords" />
        <SettingsPopup>
           
            
        </SettingsPopup>
        <Templates >
            <EditForm >
                <div style="padding: 4px 3px 4px">
                    <dx:aspxpagecontrol runat="server" ID="pageControl" Width="100%">
                        <TabPages>
                            <dx:tabpage Text="Dane osobowe" Visible="true">
                                <ContentCollection>
                                    <dx:contentcontrol runat="server">
                                        <table style="width:100%;">
                    <tr>
                        <td style="width: 15%">Tytuł</td>
                        <td>
                            <asp:TextBox ID="txTytul" runat="server" Text='<%# Eval("tytul")%>' Width="95%"></asp:TextBox>
                        </td>
                        <td style="width: 50%">Specjalizacja opis (doprecyzowanie)</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">Imię</td>
                        <td>
                            <asp:TextBox ID="txImie" runat="server" Text='<%# Eval("imie")%>' Width="95%"></asp:TextBox>
                        </td>
                        <td class="auto-style1" rowspan="6" style="display: block">
                            <asp:TextBox ID="txOpis" runat="server" Height="95%" Text='<%# Eval("zawieszony")%>' TextMode="MultiLine" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">Nazwisko</td>
                        <td>
                            <asp:TextBox ID="txNazwisko" Text='<%# Eval("nazwisko")%>' runat="server" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">PESEL</td>
                        <td>
                            <asp:TextBox ID="txPESEL" runat="server" Text='<%# Eval("pesel")%>' Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">Data powołania od</td>
                        <td>
                            <dx:aspxdateedit ID="txPowolanieOd" runat="server" Date='<%# Eval("data_poczatkowa")%>' Theme="MetropolisBlue">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">Data powołania do</td>
                        <td>
                            <dx:aspxdateedit ID="txPowolanieDo" runat="server" Date ='<%# Eval("data_koncowa")%>' Theme="MetropolisBlue">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                               <p>
            <dx:aspxcheckbox ID="ASPxCheckBox4" runat="server" CheckState="Unchecked">
                <ClientSideEvents CheckedChanged="function(s, e) {
	&nbsp;var checkstate = s.GetChecked();
&nbsp;&nbsp;&nbsp;&nbsp;if (checkstate == true) {
&nbsp;&nbsp;&nbsp;&nbsp;ASPxDropDownEdit1.SetVisible(true);&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;else {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ASPxDropDownEdit1.SetVisible(false);
&nbsp;&nbsp;&nbsp;&nbsp;}
}" />
            </dx:ASPxCheckBox>
        </p>
        <dx:aspxdropdownedit ID="ASPxDropDownEdit1" runat="server" EnableTheming="True" Theme="BlackGlass">
            
        </dx:ASPxDropDownEdit>
                         
                           <dx:aspxcheckbox ID="ASPxCheckBox3" runat="server" CheckState="Unchecked">
               
            </dx:ASPxCheckBox>
                        </td>
                        <td>
                            <dx:aspxdateedit ID="txDataZawieszenia" runat="server" Theme="MetropolisBlue" Visible='<%# Eval("zawieszenie")%>' Value='<%# Eval("d_zawieszenia")%>' > 
                            </dx:ASPxDateEdit>
                            
                        </td>
                    </tr>
                    </table>
                                     
                                      
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:tabpage Text="Dane adresowe" Visible="true">
                                <ContentCollection>
                                    <dx:contentcontrol runat="server">
                                         <table style="padding: 0px; width:100%;">
                    <tr>
                        <td style="background-color: #99CCFF;" class="auto-style1" rowspan="7">&nbsp;</td>
                        <td style="background-color: #99CCFF;" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dane zameldowania&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">Adres</td>
                        <td>
                            <asp:TextBox ID="txAdres1" runat="server" Text='<%# Eval("Adres")%>' Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">kod pocztowy</td>
                        <td>
                            <asp:TextBox ID="txKod1" Text='<%# Eval("kod_poczt")%>' runat="server" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">Miejscowość</td>
                        <td>
                            <asp:TextBox ID="txMiejscowosc1" runat="server" Text='<%# Eval("Miejscowosc")%>'   Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">Telefon</td>
                        <td>
                            <asp:TextBox ID="txTelefon1" Text='<%# Eval("telefon")%>' runat="server" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">Telefon</td>
                        <td>
                            <asp:TextBox ID="txTelefon2" runat="server" Text='<%# Eval("tel2")%>' Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">Email</td>
                        <td>
                            <asp:TextBox ID="txPESEL1" runat="server" Text='<%# Eval("email")%>' Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #0066FF;" class="auto-style1" rowspan="4">
                            &nbsp;</td>
                        <td style="background-color: #0066FF;" colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dane korespondencyjne</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            Adres korespondencyjny</td>
                        <td>
                            <asp:TextBox ID="txAdresKor" runat="server" Text='<%# Eval("adr_kores")%>' Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            Kod pocztowy
                        </td>
                        <td>
                            <asp:TextBox ID="txKodPocztowyKor" runat="server" Text='<%# Eval("kod_poczt_kor")%>' Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            Miejscowość</td>
                        <td>
                            <asp:TextBox ID="txMiejscowoscKor" runat="server" Text='<%# Eval("Miejscowosc_kor")%>' Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    </table>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                       
                            <dx:tabpage Text="Specjalizacje" Visible="true">
                                <ContentCollection>
                                    <dx:contentcontrol runat="server">
                                       <table style="width: 100%;">
                                 <tr>
                                     <td style="vertical-align: top;width:50%" width="100%">
                                         Specjalizacje biegłego</td><td style="vertical-align: top;width:50%">
                                             Dostępne specjalizacje</td></tr>
                                 <tr>
                                     <td style="vertical-align: top;width:50%" width="100%">
                                         <asp:Panel ID="Panel4" runat="server" Height="240px" ScrollBars="Vertical" meta:resourcekey="Panel4Resource1">

                                             <dx:aspxgridview ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" DataSourceID="Specjalizacje_temp"  Width="100%" EnableCallBacks="False" meta:resourcekey="ASPxGridView6Resource1" >

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
                                                     <dx:gridviewdatatextcolumn FieldName="nazwa" ShowInCustomizationForm="True" VisibleIndex="2" meta:resourcekey="GridViewDataTextColumnResource19">
                                                     </dx:GridViewDataTextColumn>
                                                        <dx:gridviewcommandcolumn ShowNewButton="true" VisibleIndex="0" ButtonRenderMode="Image" meta:resourcekey="GridViewCommandColumnResource1">
                                                          <CustomButtons>
                    <dx:gridviewcommandcolumncustombutton ID="Clone2" meta:resourcekey="GridViewCommandColumnCustomButtonResource1">
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
                                                 <dx:aspxgridview ID="ASPxGridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1f" KeyFieldName="nazwa" Width="100%" EnableCallbackAnimation="True" EnableCallBacks="False" meta:resourcekey="ASPxGridView5Resource1">
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
                                                        
                                                          
                                                         <dx:gridviewdatatextcolumn FieldName="nazwa" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" meta:resourcekey="GridViewDataTextColumnResource20">
                                                         </dx:GridViewDataTextColumn>

                                                          <dx:gridviewcommandcolumn ShowNewButton="true" ShowEditButton="true" VisibleIndex="0" ButtonRenderMode="Image" meta:resourcekey="GridViewCommandColumnResource2">
                                                          <CustomButtons>
                    <dx:gridviewcommandcolumncustombutton ID="Clone" meta:resourcekey="GridViewCommandColumnCustomButtonResource2">
                        <Image ToolTip="Clone Record" Url="img/plus-icon.png" />

                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
                                                               </dx:GridViewCommandColumn>
                                                     </Columns>
                                                 </dx:ASPxGridView>
                                             </asp:Panel>
                                         
                                     </td>
                                 </tr>
                             </table>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                             <dx:tabpage Text="Uwagi" Visible="true">
                                <ContentCollection>
                                    <dx:contentcontrol runat="server">
                                      Uwagi
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                         <dx:tabpage Text="Dane statystyczne" Visible="true">
                                <ContentCollection>
                                    <dx:contentcontrol runat="server">
                                     
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              
                              <dx:tabpage Text=" Historia powołań" Visible="true">
                                <ContentCollection>
                                    <dx:contentcontrol runat="server">
                                      powolania
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:tabpage Text="Skargi" Visible="true">
                                <ContentCollection>
                                    <dx:contentcontrol runat="server">
                                      skargi
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                </div>
                <div style="text-align: right; padding: 2px">
                    <dx:aspxgridviewtemplatereplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                        runat="server">
                    </dx:ASPxGridViewTemplateReplacement>
                    <dx:aspxgridviewtemplatereplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server">
                    </dx:ASPxGridViewTemplateReplacement>
                </div>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>
                   </dx:PanelContent>
</PanelCollection>
           </aspxpanel>
           <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT id_,nazwa FROM [glo_specjalizacje] ORDER BY [nazwa]" ID="SqlDataSource1f"></asp:SqlDataSource>
         <br />



        </div>


      </div>
</asp:Content>
