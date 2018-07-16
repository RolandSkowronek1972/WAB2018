<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master"  CodeBehind="biegliLista.aspx.cs" Inherits="wab2018.biegliLista"  enableEventValidation="false" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="userControls/historiaPowolanMediatirow.ascx" tagname="historiaPowolanMediatirow" tagprefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<%@ Register src="userControls/daneStatystyczne.ascx" tagname="daneStatystyczne" tagprefix="uc2" %>


<%@ Register src="userControls/cos.ascx" tagname="cos" tagprefix="uc6" %>
<%@ Register src="userControls/skargiOdczyt.ascx" tagname="skargiOdczyt" tagprefix="uc7" %>
<%@ Register src="userControls/speckiBieglych.ascx" tagname="speckiBieglych" tagprefix="uc9" %>
<%@ Register src="userControls/zawieszki.ascx" tagname="zawieszki" tagprefix="uc3" %>
<%@ Register src="userControls/zawieszkiOdczyt.ascx" tagname="zawieszkiOdczyt" tagprefix="uc8" %>
<%@ Register src="userControls/historiaPowolanMediatirowOdczyt.ascx" tagname="historiaPowolanMediatirowOdczyt" tagprefix="uc10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
       
        .auto-style3 {
            height: 21px;
        }
        .auto-style5 {
            font-size: medium;
        }
        .auto-style8 {
            width: 9%;
            font-size: medium;
        }
        .auto-style11 {
            font-size: large;
        }
        .auto-style12 {
            width: 9%;
        }
        .auto-style13 {
            width: 30%;
        }
        .auto-style14 {
            height: 21px;
            width: 30%;
        }
        .auto-style15 {
            width: 37%;
        }
        .auto-style16 {
            height: 21px;
            width: 37%;
        }
        .auto-style17 {
            width: 25px;
        }
        .auto-style18 {
            width: 8%;
        }
        .auto-style19 {
            width: 8%;
            font-size: medium;
        }
        .auto-style20 {
            height: 21px;
            font-size: large;
            font-weight: bold;
        }
        .auto-style21 {
            width: 15%;
            font-size: medium;
        }
        .auto-style22 {
            width: 36%;
        }
        .auto-style23 {
            height: 21px;
            width: 36%;
        }
        .auto-style24 {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script src="Scripts/jquerry-1.9.1.js"></script>
    <script type="text/javascript">
        var index = -1;
       
        function grid_RowClick(s, e) {
            if (tabelaSpecjalizacji.IsEditing() == true) {
                index = e.visibleIndex;
                                                
                s.UpdateEdit();                           
            }
            else{
                s.SetFocusedRowIndex(e.visibleIndex); // for better visual appearence                                
                s.StartEditRow(e.visibleIndex);  
            }
        }
        
        function grid_EndCallback(s, e) {
           if (index != -1) {
               var _index = index;
               index = -1;
               
               s.SetFocusedRowIndex(_index); // for better visual appearence
               s.StartEditRow(_index);
            }
        }
    </script>

    <div id ="mainWindow" style="background-color:white;" onload="ShowHideDivX()">
   
        <h2>          &nbsp; Wykaz BIEGŁYCH sądowych</h2>   <br />
        <asp:SqlDataSource ID="daneSpecjalizacji" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT id_, nazwa FROM glo_specjalizacje WHERE (grupa < 1000) ORDER BY nazwa"></asp:SqlDataSource>
        <table style="width:100%;">
            <tr>
                <td style="width: 10px; " class="przesuniecie">
                    <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="zminaArchiwum" Text="Archiwum" Theme="Moderno">
                    </dx:ASPxCheckBox>
                </td>
                <td style="width: 10px; vertical-align: middle;" class="przesuniecie">&nbsp;<dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" Height="16px" OnCheckedChanged="ASPxCheckBox2_CheckedChanged" AutoPostBack="True" Theme="Moderno" Text="Specjalizacje:  ">
                    </dx:ASPxCheckBox>&nbsp;&nbsp;&nbsp;
                </td>
                <td style="width: 10px; " class="przesuniecie">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="daneSpecjalizacji" DataTextField="nazwa" DataValueField="id_" Enabled="False" Height="40px" OnSelectedIndexChanged="poSpecjalizacji" ViewStateMode="Enabled" Width="300px">
                    </asp:DropDownList>
                </td>
                <td style="vertical-align: middle; ">
                    <asp:Button ID="Button1" runat="server" OnClick="_print" Text="Drukuj" CssClass="button_" />
                &nbsp;
               <asp:LinkButton ID="LinkButton14" runat="server" CssClass="button_" OnClick="twórzZestawienie" meta:resourcekey="LinkButton14Resource1" Text="Zestawienie"></asp:LinkButton>
                &nbsp;
                    <asp:LinkButton ID="LinkButton6" runat="server" Text="Excel" CssClass="button_" OnClick="makeExcell" meta:resourcekey="LinkButton6Resource1" ></asp:LinkButton>

                </td>
                <td style="vertical-align: middle;">
                    &nbsp;</td>
                <td style="vertical-align: middle;">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="mediatorzy" KeyFieldName="ident" Width="100%" EnableRowsCache="False" OnRowUpdating="updateMediatora" OnInitNewRow="InsertData" OnStartRowEditing="grid_StartRowEditing" OnRowInserting="grid_RowInserting" OnCancelRowEditing="grid_CancelRowEditing" OnRowValidating="grid_RowValidating" ValidationGroup = 'MyGroup' ViewStateMode="Enabled" AutoGenerateColumns="False" OnBeforePerformDataSelect="grid_BeforePerformDataSelect">
        <Settings ShowFilterRow="True" />
        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
        <SettingsDataSecurity AllowDelete="False" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True" Width="5%" />
            
                     <dx:GridViewDataTextColumn Caption="Tytuł" FieldName="tytul" ShowInCustomizationForm="True" VisibleIndex="1" Width="10%">
                     </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Powołanie od" FieldName="data_poczatkowa" ShowInCustomizationForm="True" VisibleIndex="4" Width="7%">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn Caption="Imie" FieldName="imie" ShowInCustomizationForm="True" VisibleIndex="2" Width="16%">
                         <PropertiesTextEdit>
                             <ValidationSettings CausesValidation="True" Display="Dynamic">
                                 <RequiredField ErrorText="Pole musi być wypełnione" IsRequired="True" />
                             </ValidationSettings>
                         </PropertiesTextEdit>
                     </dx:GridViewDataTextColumn>
                      <dx:GridViewDataDateColumn Caption="Powołanie do" FieldName="data_koncowa" ShowInCustomizationForm="True" VisibleIndex="5" Width="7%">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn Caption="Nazwisko" FieldName="nazwisko" ShowInCustomizationForm="True" VisibleIndex="3" Width="16%">
                         <PropertiesTextEdit>
                             <ValidationSettings>
                                 <RequiredField ErrorText="Pole musi być wypełnione" IsRequired="True" />
                             </ValidationSettings>
                         </PropertiesTextEdit>
                     </dx:GridViewDataTextColumn>
                   
                  
                     <dx:GridViewDataCheckColumn Caption="Z" FieldName="czy_zaw" VisibleIndex="7" meta:resourcekey="GridViewDataCheckColumnResource1" ShowInCustomizationForm="True" Width="5%">
                         </dx:GridViewDataCheckColumn>
                     <dx:GridViewDataTextColumn Caption="Specjalizacje" FieldName="specjalizacja_opis" ShowInCustomizationForm="True" VisibleIndex="15" Width="13%">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Uwagi" FieldName="uwagi" ShowInCustomizationForm="True" VisibleIndex="14" Width="13%">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Telefon" FieldName="tel1" ShowInCustomizationForm="True" VisibleIndex="8" Width="8%">
                     </dx:GridViewDataTextColumn>
         
           
            <dx:GridViewDataTextColumn FieldName="specjalizacja_opis" Visible="False" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
         
           
        </Columns>
           
        <SettingsPager AlwaysShowPager="True" PageSize="200" />
        
        
         <ClientSideEvents RowExpanding="function(s, e) {
	}" SelectionChanged="function(s, e) {
	

}" />
        
        
         <Templates >
            <EditForm>
                 
                  <div style="padding: 4px 3px 4px" >
                    <dx:ASPxPageControl runat="server" ID="ASPxPageControl1" Width="100%">
                        <TabPages>
                         
                            <dx:TabPage Text="Dane osobowe" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
      <table class="auto-style24" >
        <tr>
            <td class="auto-style21" >Tytuł</td>
            <td >
                <dx:ASPxTextBox ID="txTytul" runat="server" Width="90%"  Theme="Moderno"  Text='<%# Eval("tytul")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="auto-style5" >Specjalizacja opis</td>
        </tr>
        <tr>
            <td class="auto-style21">Imie</td>
            <td>
                <dx:ASPxTextBox ID="txImie" runat="server" Width="90%"  Theme="Moderno"  Text='<%# Eval("imie")%>' >
                    <ValidationSettings>
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="prc50 normal " rowspan="9">
                <dx:ASPxMemo ID="txSpecjalizacjeOpis" runat="server" Height="100%"  Theme="Moderno"  Width="99%" Text='<%# Eval("specjalizacja_opis")%>'>
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">Nazwisko</td>
            <td>
                <dx:ASPxTextBox ID="txNazwisko" runat="server" Width="90%"  Theme="Moderno"  Text='<%# Eval("nazwisko")%>'  >
                    <ValidationSettings>
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>


                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class="auto-style21">PESEL</td>
            <td>
                <dx:ASPxTextBox ID="txPESEL" runat="server" Width="150px"  Theme="Moderno"  Text='<%# Eval("Pesel")%>' >
                </dx:ASPxTextBox>
            </td>
            <td class="col_20">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21">Data powołania od: </td>
            <td class="auto-style22">
              
                         <dx:ASPxDateEdit ID="txPoczatekPowolania" runat="server"  Theme="Moderno"  Value='<%# (Convert.ToDateTime(Eval("data_poczatkowa")) == DateTime.MinValue) ? Eval("now"): Eval("data_poczatkowa") %>' Width="150px"> 
                </dx:ASPxDateEdit>
                    
                 
               
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class="auto-style21">Data powołania do: </td>
            <td class="auto-style23">
                <dx:ASPxDateEdit ID="txDataKoncaPowolania" runat="server"  Theme="Moderno"  Value='<%# (Convert.ToDateTime(Eval("data_koncowa")) == DateTime.MinValue) ?Eval( ( "now.AddYear(5).Year"+":"+"DateTime.Now.Month"+":30")): Eval("data_koncowa") %>' Width="150px"> 
                </dx:ASPxDateEdit>
            </td>
            <td class="col_20"></td>
        </tr>
            <tr>
            <td  colspan="2">  
               <uc3:zawieszki ID="zawieszki1" runat="server" /> 
            </td>
            <td class="col_20"></td>
        </tr>                                                        
                                                               
        
    </table>
                                         
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                               <dx:TabPage Text="Dane kontaktowe" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                 <table style="width:100%;">
        <tr>
            <td colspan="2" class="auto-style20">Adres</td>
            <td class="auto-style17"></td>
            <td colspan="2" class="auto-style3"><b>Adres prywatny</b></td>
        </tr>
        <tr>
            <td class="auto-style5" style="width: 10%">Instytucja</td>
            <td class="auto-style15">
                <dx:ASPxTextBox ID="txInstytucja" runat="server" Width="90%" Text='<%# Eval("instytucja")%>' Theme="Moderno">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style19">Adres</td>
            <td style="width: 40%">
                <dx:ASPxTextBox ID="txAdresKorespondencyjny" runat="server" Width="90%" Text='<%# Eval("adr_kores")%>' Theme="Moderno">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="width: 10%">Adres</td>
            <td class="auto-style15">
                <dx:ASPxTextBox ID="txAdres" runat="server" Width="90%" Text='<%# Eval("ulica")%>' Theme="Moderno">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style19">Kod pocztowy</td>
            <td style="width: 40%">
                <dx:ASPxTextBox ID="txKodPocztowyKorespondencyjny" runat="server" Width="90%" Text='<%# Eval("kod_poczt_kor")%>' Theme="Moderno">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="width: 10%">Kod pocztowy</td>
            <td class="auto-style16">
                <dx:ASPxTextBox ID="txKodPocztowy" runat="server" Width="90%" Text='<%# Eval("kod_poczt")%>' Theme="Moderno">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17"></td>
            <td class="auto-style19">Miejscowosc</td>
            <td class="dxflEmptyItem" style="width: 40%">
                <dx:ASPxTextBox ID="txMiejscowoscKorespondencyjny" runat="server" Width="90%" Text='<%# Eval("miejscowosc_kor")%>' Theme="Moderno">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="width: 10%">Miejscowosc</td>
            <td class="auto-style15">
                <dx:ASPxTextBox ID="txMiejscowosc" runat="server" Width="90%" Text='<%# Eval("miejscowosc")%>' Theme="Moderno">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17"></td>
            <td class="auto-style19">Telefon</td>
            <td class="prc25" style="width: 40%">
                <dx:ASPxTextBox ID="txTelefon2" runat="server" Width="90%" Text='<%# Eval("tel2")%>' Theme="Moderno">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="width: 10%">Telefon </td>
            <td class="auto-style15">
                <dx:ASPxTextBox ID="txTelefon1" runat="server" Width="90%" Text='<%# Eval("tel1")%>' Theme="Moderno">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td class="prc25 normal" style="width: 40%">  &nbsp;</td>
        </tr>
       
        <tr>
            <td class="auto-style5" style="width: 10%">Email</td>
            <td class="auto-style16">
                <dx:ASPxTextBox ID="txEmail" runat="server" Width="90%" Text='<%# Eval("email")%>' Theme="Moderno">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17"></td>
            <td class="auto-style18">&nbsp;</td>
            <td class="prc25 normal" style="width: 40%">&nbsp;</td>
        </tr>
        </table>
                                         
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Uwagi" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                           <dx:ASPxMemo ID="txUwagi" runat="server" Height="200px" Width="99%" Text='<%# Eval("uwagi")%>'> </dx:ASPxMemo>
                                   
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                                  <dx:TabPage Text="Specjalizacje" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
     
                   <uc9:speckiBieglych ID="speckiBieglych1" runat="server" />
     
                                 
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Dane statystyczne" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                          <uc2:daneStatystyczne ID="daneStatystyczne1" runat="server" />
     
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Historia powołań" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                     <uc1:historiaPowolanMediatirow ID="historiaPowolanMediatirow1" runat="server" />
                                        <br /> 
                                        
                                
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Skargi" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
        <uc6:cos ID="cos1" runat="server" />                             
                                        <br /> 
                                        
                                
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            
                            
                        </TabPages>
                    </dx:ASPxPageControl>
                </div>
               


        
                <div style="text-align: right; padding: 2px">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server" CausesValidation="True" />
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server" />
                </div>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>
        
        
    
    <dx:ASPxGridView ID="grid0" runat="server" DataSourceID="mediatorzy" AutoGenerateColumns="False" KeyFieldName="ident" Width="100%" EnableRowsCache="False" OnRowUpdating="updateMediatora" OnInitNewRow="InsertData" OnStartRowEditing="grid_StartRowEditing" OnRowInserting="grid_RowInserting" OnCancelRowEditing="grid_CancelRowEditing" OnRowValidating="grid_RowValidating" ValidationGroup = 'MyGroup'>
        <Settings ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True" />
            
                     <dx:GridViewDataTextColumn Caption="Tytuł" FieldName="tytul" ShowInCustomizationForm="True" VisibleIndex="1">
                     </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Powołanie od" FieldName="data_poczatkowa" ShowInCustomizationForm="True" VisibleIndex="4">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn Caption="Imie" FieldName="imie" ShowInCustomizationForm="True" VisibleIndex="2">
                         <PropertiesTextEdit>
                             <ValidationSettings CausesValidation="True" Display="Dynamic">
                                 <RequiredField ErrorText="Pole musi być wypełnione" IsRequired="True" />
                             </ValidationSettings>
                         </PropertiesTextEdit>
                     </dx:GridViewDataTextColumn>
                      <dx:GridViewDataDateColumn Caption="Powołanie do" FieldName="data_koncowa" ShowInCustomizationForm="True" VisibleIndex="5">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn Caption="Nazwisko" FieldName="nazwisko" ShowInCustomizationForm="True" VisibleIndex="3">
                         <PropertiesTextEdit>
                             <ValidationSettings>
                                 <RequiredField ErrorText="Pole musi być wypełnione" IsRequired="True" />
                             </ValidationSettings>
                         </PropertiesTextEdit>
                     </dx:GridViewDataTextColumn>
                   
                  
                     <dx:GridViewDataCheckColumn Caption="Z" FieldName="czy_zaw" VisibleIndex="7" meta:resourcekey="GridViewDataCheckColumnResource1" ShowInCustomizationForm="True">
                         </dx:GridViewDataCheckColumn>
                     <dx:GridViewDataTextColumn Caption="Specjalizacje" FieldName="specjalizacja_opis" ShowInCustomizationForm="True" VisibleIndex="15">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Uwagi" FieldName="uwagi" ShowInCustomizationForm="True" VisibleIndex="14">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Telefon" FieldName="tel1" ShowInCustomizationForm="True" VisibleIndex="8">
                     </dx:GridViewDataTextColumn>
         
           
            <dx:GridViewDataTextColumn FieldName="specjalizacja_opis" Visible="False" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
         
           
        </Columns>
           
        <SettingsPager Mode="ShowAllRecords" />
        
        
         <ClientSideEvents RowExpanding="function(s, e) {
	}" SelectionChanged="function(s, e) {
	alert(&quot;Oj!&quot;);

}" />
        
        
         <Templates >
            <EditForm>
                 
                  <div style="padding: 4px 3px 4px" >
                    <dx:ASPxPageControl runat="server" ID="ASPxPageControl2" Width="100%">
                        <TabPages>
                         
                            <dx:TabPage Text="Dane osobowe" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                  <table class="auto-style24" >
        <tr>
            <td class="auto-style21" >Tytuł</td>
            <td >
                <dx:ASPxTextBox ID="txTytul" runat="server" Width="90%"  Theme="Moderno"  Text='<%# Eval("tytul")%>' ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="auto-style5" >Specjalizacja opis</td>
        </tr>
        <tr>
            <td class="auto-style21">Imie</td>
            <td>
                <dx:ASPxTextBox ID="txImie" runat="server" Width="90%"  Theme="Moderno"  Text='<%# Eval("imie")%>' ReadOnly="true">
                    <ValidationSettings>
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="prc50 normal " rowspan="9">
                <dx:ASPxMemo ID="txSpecjalizacjeOpis" runat="server" Height="100%"  Theme="Moderno"  Width="99%" Text='<%# Eval("specjalizacja_opis")%>' ReadOnly="true">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">Nazwisko</td>
            <td>
                <dx:ASPxTextBox ID="txNazwisko" runat="server" Width="90%"  Theme="Moderno"  Text='<%# Eval("nazwisko")%>'  ReadOnly="true">
                    <ValidationSettings>
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>


                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class="auto-style21">PESEL</td>
            <td>
                <dx:ASPxTextBox ID="txPESEL" runat="server" Width="150px"  Theme="Moderno"  Text='<%# Eval("Pesel")%>' ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="col_20">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21">Data powołania od: </td>
            <td class="auto-style22">
              
                         <dx:ASPxDateEdit ID="txPoczatekPowolania" runat="server"  Theme="Moderno"  Value='<%# (Convert.ToDateTime(Eval("data_poczatkowa")) == DateTime.MinValue) ? Eval("now"): Eval("data_poczatkowa") %>' Width="150px" ReadOnly="true"> 
                </dx:ASPxDateEdit>
                    
                 
               
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class="auto-style21">Data powołania do: </td>
            <td class="auto-style23">
                <dx:ASPxDateEdit ID="txDataKoncaPowolania" runat="server"  Theme="Moderno"  Value='<%# (Convert.ToDateTime(Eval("data_koncowa")) == DateTime.MinValue) ?Eval( ( "now.AddYear(5).Year"+":"+"DateTime.Now.Month"+":30")): Eval("data_koncowa") %>' Width="150px" ReadOnly="true"> 
                </dx:ASPxDateEdit>
            </td>
            <td class="col_20"></td>
        </tr>
            <tr>
            <td  colspan="2">  
                <uc8:zawieszkiOdczyt ID="zawieszkiOdczyt1" runat="server" />
            </td>
            <td class="col_20"></td>
        </tr>                                                        
                                                               
        
    </table>
   
   
<hr />

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                               <dx:TabPage Text="Dane kontaktowe" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                       <table style="width:100%;">
        <tr>
            <td colspan="2" class="auto-style20">Adres</td>
            <td class="auto-style17"></td>
            <td colspan="2" class="auto-style3"><b>Adres prywatny</b></td>
        </tr>
        <tr>
            <td class="auto-style5" style="width: 10%">Instytucja</td>
            <td class="auto-style15">
                <dx:ASPxTextBox ID="txInstytucja0" runat="server" Width="90%" Text='<%# Eval("instytucja")%>' Theme="Moderno" ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style19">Adres</td>
            <td style="width: 40%">
                <dx:ASPxTextBox ID="txAdresKorespondencyjny0" runat="server" Width="90%" Text='<%# Eval("adr_kores")%>' Theme="Moderno" ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="width: 10%">Adres</td>
            <td class="auto-style15">
                <dx:ASPxTextBox ID="txAdres" runat="server" Width="90%" Text='<%# Eval("ulica")%>' Theme="Moderno"  ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style19">Kod pocztowy</td>
            <td style="width: 40%">
                <dx:ASPxTextBox ID="txKodPocztowyKorespondencyjny0" runat="server" Width="90%" Text='<%# Eval("kod_poczt_kor")%>' Theme="Moderno" ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="width: 10%">Kod pocztowy</td>
            <td class="auto-style16">
                <dx:ASPxTextBox ID="txKodPocztowy0" runat="server" Width="90%" Text='<%# Eval("kod_poczt")%>' Theme="Moderno" ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17"></td>
            <td class="auto-style19">Miejscowosc</td>
            <td class="dxflEmptyItem" style="width: 40%">
                <dx:ASPxTextBox ID="txMiejscowoscKorespondencyjny0" runat="server" Width="90%" Text='<%# Eval("miejscowosc_kor")%>' Theme="Moderno" ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="width: 10%">Miejscowosc</td>
            <td class="auto-style15">
                <dx:ASPxTextBox ID="txMiejscowosc0" runat="server" Width="90%" Text='<%# Eval("miejscowosc")%>' Theme="Moderno" ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17"></td>
            <td class="auto-style19">Telefon</td>
            <td class="prc25" style="width: 40%">
                <dx:ASPxTextBox ID="txTelefon2" runat="server" Width="90%" Text='<%# Eval("tel2")%>' Theme="Moderno" ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="width: 10%">Telefon </td>
            <td class="auto-style15">
                <dx:ASPxTextBox ID="txTelefon1" runat="server" Width="90%" Text='<%# Eval("tel1")%>' Theme="Moderno" ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td class="prc25 normal" style="width: 40%">  &nbsp;</td>
        </tr>
       
        <tr>
            <td class="auto-style5" style="width: 10%">Email</td>
            <td class="auto-style16">
                <dx:ASPxTextBox ID="txEmail0" runat="server" Width="90%" Text='<%# Eval("email")%>' Theme="Moderno" ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style17"></td>
            <td class="auto-style18">&nbsp;</td>
            <td class="prc25 normal" style="width: 40%">&nbsp;</td>
        </tr>
        </table>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Uwagi" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                         <dx:ASPxMemo ID="txUwagi0" runat="server" Height="99%" Width="99%" Text='<%# Eval("uwagi")%>' ReadOnly="true">
                                               </dx:ASPxMemo>
                                   
                                         
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Specjalizacje" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
          
      <asp:SqlDataSource ID="specjalizacjeOsob1" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT ROW_NUMBER() OVER(ORDER BY View_SpecjalizacjeIOsoby.id_ ASC) AS Row, View_SpecjalizacjeIOsoby.Expr1 as stab, View_SpecjalizacjeIOsoby.nazwa, View_SpecjalizacjeIOsoby.id_ as idSpecjalizacji, View_SpecjalizacjeIOsoby.ident as idOsoby FROM View_SpecjalizacjeIOsoby INNER JOIN glo_specjalizacje ON View_SpecjalizacjeIOsoby.id_ = glo_specjalizacje.id_ WHERE (View_SpecjalizacjeIOsoby.ident = @ident) AND (glo_specjalizacje.grupa < 1000) ORDER BY View_SpecjalizacjeIOsoby.nazwa" UpdateCommand="UPDATE tbl_specjalizacje_osob SET id_osoby = 0 WHERE (id_osoby = 0)">
            <SelectParameters>
              
                <asp:SessionParameter Name="ident" SessionField="id_osoby" />
              
            </SelectParameters>
           
        </asp:SqlDataSource>    
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="specjalizacjeOsob1" KeyFieldName="idSpecjalizacji" Theme="Moderno" EnableTheming="True">
    <SettingsDataSecurity AllowDelete="False" AllowInsert="False" AllowEdit="False" />
    <Columns>
        <dx:GridViewDataTextColumn FieldName="Row" ReadOnly="True" Visible="False" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn FieldName="stab" VisibleIndex="0">
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="idSpecjalizacji" Visible="False" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="idOsoby" Visible="False" VisibleIndex="4">
          
        </dx:GridViewDataTextColumn>
    </Columns>
   

</dx:ASPxGridView>                            

        
                   
     
                                 
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Dane statystyczne" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                          <uc2:daneStatystyczne ID="daneStatystyczne1" runat="server" />
     
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Historia powołań" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                    <uc10:historiaPowolanMediatirowOdczyt ID="historiaPowolanMediatirowOdczyt1" runat="server" />
                                        <br /> 
                                        
                                
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Skargi" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                     
                 <uc7:skargiOdczyt ID="skargiOdczyt1" runat="server" />                       <br /> 
                                        
                                
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            
                        </TabPages>
                    </dx:ASPxPageControl>
                </div>
              

        
                <div style="text-align: right; padding: 2px">
                   
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton0" ReplacementType="EditFormCancelButton" runat="server" />
                </div>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>
        
        
    
    <br />
      <asp:SqlDataSource ID="mediatorzy" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT ulica, kod_poczt, miejscowosc, COALESCE (czy_zaw, 0) AS czy_zaw, tel2, email, COALESCE (d_zawieszenia, '1900-01-01') AS d_zawieszenia, COALESCE (dataKoncaZawieszenia, '1900-01-01') AS dataKoncaZawieszenia, GETDATE() AS now, tytul, uwagi, specjalizacja_opis, specjalizacjeWidok, miejscowosc_kor, kod_poczt_kor, adr_kores, imie, ident, data_poczatkowa, data_koncowa, pesel, tel1, typ, nazwisko, instytucja FROM tbl_osoby WHERE (czyus = 0) AND (typ &lt; 2) AND (data_koncowa &gt;= GETDATE()) ORDER BY nazwisko" DeleteCommand="UPDATE tbl_osoby SET czyus = 1, d_usuniecia = GETDATE(), id_usuwajacego = @id_usuwajacego WHERE (ident = @ident)" UpdateCommand="UPDATE tbl_osoby SET imie = @imie, nazwisko = @nazwisko, ulica = @ulica, kod_poczt = @kod_poczt, miejscowosc = @miejscowosc, data_poczatkowa = @data_poczatkowa, data_koncowa = @data_koncowa, pesel = @pesel, tytul = @tytul, czy_zaw = @czy_zaw, tel1 = @tel1, tel2 = @tel2, email = @email, adr_kores = @adr_kores, kod_poczt_kor = @kod_poczt_kor, miejscowosc_kor = @miejscowosc_kor, uwagi = @uwagi, d_zawieszenia = @d_zawieszenia, specjalizacjeWidok = @specjalizacjeWidok, specjalizacja_opis = @specjalizacja_opis, dataKoncaZawieszenia = @dataKoncaZawieszenia, ostatniaAktualizacja = GETDATE(), instytucja = @instytucja WHERE (ident = @ident)" InsertCommand="UPDATE tbl_osoby SET imie = @imie, nazwisko = @nazwisko, ulica = @ulica, kod_poczt = @kod_poczt, miejscowosc = @miejscowosc, data_poczatkowa = @data_poczatkowa, data_koncowa = @data_koncowa, pesel = (SELECT CASE WHEN COALESCE (@pesel , '') = '' THEN 0 ELSE @pesel END AS IsNullOrEmpty), tytul = @tytul, czy_zaw = @czy_zaw, tel1 = @tel1, tel2 = @tel2, email = @email, adr_kores = @adr_kores, kod_poczt_kor = @kod_poczt_kor, miejscowosc_kor = @miejscowosc_kor, uwagi = @uwagi, d_zawieszenia = @d_zawieszenia, specjalizacjeWidok = @specjalizacjeWidok, specjalizacja_opis = @specjalizacja_opis, dataKoncaZawieszenia = @dataKoncaZawieszenia, instytucja = @instytucja WHERE (ident = @ident)">
          <DeleteParameters>
              <asp:SessionParameter Name="id_usuwajacego" SessionField="id_usuwajacego"/>
              <asp:SessionParameter Name="ident" SessionField="ident"/>
          </DeleteParameters>
         
          <InsertParameters>
              <asp:Parameter Name="imie" />
              <asp:Parameter Name="nazwisko" />
              <asp:Parameter Name="ulica" />
              <asp:Parameter Name="kod_poczt" />
              <asp:Parameter Name="miejscowosc" />
              <asp:Parameter Name="data_poczatkowa" />
              <asp:Parameter Name="data_koncowa" />
              <asp:Parameter Name="pesel" />
              <asp:Parameter Name="tytul" />
              <asp:Parameter Name="czy_zaw" />
              <asp:Parameter Name="tel1" />
              <asp:Parameter Name="tel2" />
              <asp:Parameter Name="email" />
              <asp:Parameter Name="adr_kores" />
              <asp:Parameter Name="kod_poczt_kor" />
              <asp:Parameter Name="miejscowosc_kor" />
              <asp:Parameter Name="uwagi" />
              <asp:Parameter Name="d_zawieszenia" />
              <asp:Parameter Name="specjalizacjeWidok" />
              <asp:Parameter Name="specjalizacja_opis" />
              <asp:Parameter Name="dataKoncaZawieszenia" />
               <asp:Parameter Name="instytucja" />
               <asp:SessionParameter Name="ident" SessionField="id_osoby"/>
          </InsertParameters>
         
          <UpdateParameters>
              <asp:Parameter Name="imie" />
              <asp:Parameter Name="nazwisko" />
              <asp:Parameter Name="ulica" />
              <asp:Parameter Name="kod_poczt" />
              <asp:Parameter Name="miejscowosc" />
              <asp:Parameter Name="data_poczatkowa" />
              <asp:Parameter Name="data_koncowa" />
              <asp:Parameter Name="pesel" />
              <asp:Parameter Name="tytul"  />
              <asp:Parameter Name="czy_zaw"  />
              <asp:Parameter Name="tel1"   />
              <asp:Parameter Name="tel2"   />
              <asp:Parameter Name="email"  />
              <asp:Parameter Name="adr_kores"  />
              <asp:Parameter Name="kod_poczt_kor" />
              <asp:Parameter Name="miejscowosc_kor" />
              <asp:Parameter Name="uwagi" />
              <asp:Parameter Name="d_zawieszenia" />
              <asp:Parameter Name="specjalizacjeWidok" />
              <asp:Parameter Name="specjalizacja_opis" />
              <asp:Parameter Name="dataKoncaZawieszenia" />
                 <asp:Parameter Name="instytucja"  />
              <asp:Parameter Name="ident" />
          </UpdateParameters>
    </asp:SqlDataSource>
        
        
        
        
       
        
        
                                     

        
          
        
        
        
        
       
       
                 
        
        
        
        
       
        
        
                                     

        
          
        
        
        
        
       
       
                 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
        
        
        
        
       
        
        
                                     

        
          
        
        
        
        
       
       
                 
        
        
        
        
       
        
        
                                     

        
          
        
        
        
        
            
       
                 
        
        
        
        
       
        
        
                                     

        
          
        
        
        
        
       
       
                 
        
        
        
        
        
        
        
        
        
        
        
       
        
        
                                     

        
          
        
        
        
        
       
       
                 
        
        
        
        
       
        
        
                                     

        
          
        
        
        
        
            
       
                 
        
        
        
        
       
        
        
                                     

        
          
        
        
        
        
       
       
                 
        
        
        
        
        
        
        <br />
        
        
        
        
       
        
        
                                     

        
           
        
             
        
        
       
        
        
            
<div id="dvPassport" style="display:none">
   aaaaaa

</div>


        
        
        
        
        
  
        
       
        
        
                                     

        
          
        
        
        
        
       
        
        
        
        
        
               
       
                    
                                         
        
     
        
        
        
        
        
       
        
        
        
         
        
        
        
        
        
        
        
        
       
        
        
                                     

        
           
        
             
        
        
       
        
        
        
        
        
        
       
        
        
        
        
        
        
  
        
        
        
        
        
        
       
        
        
        
        
        
        
  
        
       
        
        
                                     

        
          
        
                                         
        
     </div>
</asp:Content>
