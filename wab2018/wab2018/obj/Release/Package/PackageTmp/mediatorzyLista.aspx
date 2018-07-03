<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master"  CodeBehind="mediatorzyLista.aspx.cs" Inherits="wab2018.mediatorzyLista"  enableEventValidation="false" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="userControls/historiaPowolanMediatirow.ascx" tagname="historiaPowolanMediatirow" tagprefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<%@ Register src="userControls/daneStatystyczne.ascx" tagname="daneStatystyczne" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 39px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
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

    <div id ="mainWindow" class="newPage" onload="ShowHideDivX()">
    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="mediatorzy" AutoGenerateColumns="False" KeyFieldName="ident" Width="100%" EnableRowsCache="False" OnRowUpdating="updateMediatora" OnInitNewRow="InsertData" OnStartRowEditing="grid_StartRowEditing" OnBatchUpdate="grid_BatchUpdate">
        <Settings ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true" VisibleIndex="0" ShowClearFilterButton="True" />
            
                     <dx:GridViewDataTextColumn Caption="Tytuł" FieldName="tytul" ShowInCustomizationForm="True" VisibleIndex="1">
                     </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Powołanie od" FieldName="data_poczatkowa" ShowInCustomizationForm="True" VisibleIndex="2">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn Caption="Imie" FieldName="imie" ShowInCustomizationForm="True" VisibleIndex="3">
                     </dx:GridViewDataTextColumn>
                      <dx:GridViewDataDateColumn Caption="Powołanie do" FieldName="data_koncowa" ShowInCustomizationForm="True" VisibleIndex="4">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn Caption="Nazwisko" FieldName="nazwisko" ShowInCustomizationForm="True" VisibleIndex="5">
                     </dx:GridViewDataTextColumn>
                   
                  
                     <dx:GridViewDataCheckColumn Caption="Z" FieldName="czy_zaw" VisibleIndex="7" meta:resourcekey="GridViewDataCheckColumnResource1" ShowInCustomizationForm="True">
                         </dx:GridViewDataCheckColumn>
                     <dx:GridViewDataTextColumn Caption="Specjalizacje" FieldName="specjalizacjeWidok" ShowInCustomizationForm="True" VisibleIndex="15">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Uwagi" FieldName="uwagi" ShowInCustomizationForm="True" VisibleIndex="14">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Telefon" FieldName="tel1" ShowInCustomizationForm="True" VisibleIndex="8">
                     </dx:GridViewDataTextColumn>
         
           
            <dx:GridViewDataTextColumn FieldName="specjalizacja_opis" Visible="False" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
         
           
        </Columns>
           
        <SettingsPager Mode="ShowAllRecords" />
        
        
         <Templates>
            <EditForm>
                 
                  <div style="padding: 4px 3px 4px" >
                    <dx:ASPxPageControl runat="server" ID="ASPxPageControl1" Width="100%">
                        <TabPages>
                         
                            <dx:TabPage Text="Dane osobowe" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                 <table style="width:100%;">
        <tr>
            <td class="auto-style1">Tytuł</td>
            <td class="auto-style1">
                <dx:ASPxTextBox ID="txTytul" runat="server" Width="170px" Text='<%# Eval("tytul")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="auto-style1">Specjalizacja opis</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Imie</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txImie" runat="server" Width="170px" Text='<%# Eval("imie")%>' required>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="prc50 normal " rowspan="8">
                <dx:ASPxMemo ID="txSpecjalizacjeOpis" runat="server" Height="100%" Width="99%" Text='<%# Eval("specjalizacja_opis")%>'>
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Nazwisko</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txNazwisko" runat="server" Width="170px" Text='<%# Eval("nazwisko")%>' required>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">PESEL</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txPESEL" runat="server" Width="170px" Text='<%# Eval("Pesel")%>' >
                </dx:ASPxTextBox>
            </td>
            <td class="col_20">&nbsp;</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Data powołania od: </td>
            <td class="prc25">
              
                         <dx:ASPxDateEdit ID="txPoczatekPowolania" runat="server" Date='<%# Eval("data_poczatkowa")%>'>
                </dx:ASPxDateEdit>
                    
                 
               
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Data powołania do: </td>
            <td class="dxflEmptyItem">
                <dx:ASPxDateEdit ID="txDataKoncaPowolania" runat="server" Date ='<%# Eval("data_koncowa")%>'>
                </dx:ASPxDateEdit>
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25"> 
      <dx:ASPxCheckBox ID="cbZawieszenie" runat="server"   Checked='<%# Eval("czy_zaw")%>'  Text="Zawieszenie" Theme="Moderno"> 
            <ClientSideEvents CheckedChanged="function(s, e) {
	         var dvPassport = document.getElementById(&quot;dvPassport&quot;);
              
                    if (s.GetCheckState() ==&quot;Checked&quot;)
                    {
                        
                        dvPassport.style.display = &quot;block&quot; ;
                    }
                    else
                    {
                         dvPassport.style.display = &quot;none&quot; ;
                    }
                }" />
        </dx:ASPxCheckBox>
            </td>
            <td class="dxflEmptyItem">
                &nbsp;</td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td colspan="2" class=" normal przesuniecie prc25"> 
                <div id="dvPassport" style="display: none">
                     <table style="width:100%;">
                <tr>
                    <td  class="prc50">Data początku zawieszenia</td>
                    <td>
                        <dx:ASPxDateEdit ID="txPoczatekZawieszenia" runat="server" Theme="Moderno"  Value='<%# (Convert.ToDateTime(Eval("d_zawieszenia")) == DateTime.MinValue) ? null: Eval("now") %>'> 
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>Data końca zawieszenia</td>
                    <td>
                        <dx:ASPxDateEdit ID="txKoniecZawieszenia" runat="server" Theme="Moderno"  Value='<%# (Convert.ToDateTime(Eval("dataKoncaZawieszenia")) == DateTime.MinValue) ? null: Eval("now") %>'> 
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
                </div>
        
            </td>
       
      
            <td class="col_20">
                
       
               
                </td>
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
            <td colspan="2">Adres zameldowania</td>
            <td class="col_20">&nbsp;</td>
            <td colspan="2">Adres korespondencyjny</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Adres</td>
            <td>
                <dx:ASPxTextBox ID="txAdres" runat="server" Width="170px" Text='<%# Eval("ulica")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20">&nbsp;</td>
            <td class=" normal przesuniecie prc25">Adres</td>
            <td>
                <dx:ASPxTextBox ID="txAdresKorespondencyjny" runat="server" Width="170px" Text='<%# Eval("adr_kores")%>'>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Kod pocztowy</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txKodPocztowy" runat="server" Width="170px" Text='<%# Eval("kod_poczt")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class=" normal przesuniecie prc25">Kod pocztowy</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txKodPocztowyKorespondencyjny" runat="server" Width="170px" Text='<%# Eval("kod_poczt_kor")%>'>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Miejscowosc</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txMiejscowosc" runat="server" Width="170px" Text='<%# Eval("miejscowosc")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class=" normal przesuniecie prc25">Miejscowosc</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txMiejscowoscKorespondencyjny" runat="server" Width="170px" Text='<%# Eval("miejscowosc_kor")%>'>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Telefon </td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txTelefon1" runat="server" Width="170px" Text='<%# Eval("tel1")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20">&nbsp;</td>
            <td class="prc25 normal">&nbsp;</td>
            <td class="prc25 normal">&nbsp;</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Telefon</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txTelefon2" runat="server" Width="170px" Text='<%# Eval("tel2")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="prc25 normal">&nbsp;</td>
            <td class="prc25 normal">&nbsp;</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Email</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txEmail" runat="server" Width="170px" Text='<%# Eval("email")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="prc25 normal">&nbsp;</td>
            <td class="prc25 normal">&nbsp;</td>
        </tr>
        </table>
                                         
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Uwagi" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                     <table style="width:100%;">
       
        <tr>
            <td class=" normal przesuniecie prc25">Uwagi</td>
            <td class="col_20">&nbsp;</td>
            <td>
                <dx:ASPxMemo ID="txUwagi" runat="server" Height="99%" Width="99%" Text='<%# Eval("uwagi")%>'>
        </dx:ASPxMemo>
               
            </td>
          
        </tr>
      
        </table>
                                         
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Specjalizacje" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
   <table style="width:100%;">
            <tr>
                <td>
                    <dx:ASPxCheckBox ID="cbSpecjalizacjaCywilne" runat="server" Text="Cywilne" Theme="Moderno">
                    </dx:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxCheckBox ID="cbSpecjalizacjaRodzinne" runat="server" Text="Rodzinne" Theme="Moderno">
                    </dx:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxCheckBox ID="cbSpecjalizacjaGospodarcze" runat="server" Text="Gospodarcze" Theme="Moderno">
                    </dx:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxCheckBox ID="cbSpecjalizacjaKarne" runat="server" Text="Karne" Theme="Moderno">
                    </dx:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxCheckBox ID="cbSpecjalizacjaPracy" runat="server" Text="Pracy" Theme="Moderno">
                    </dx:ASPxCheckBox>
                </td>
            </tr>
        </table>
     
                                 
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
                                         
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            
                            
                        </TabPages>
                    </dx:ASPxPageControl>
                </div>
               


        
                <div style="text-align: right; padding: 2px">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server" />
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server" />
                </div>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>
        
      <br />
    
        
    
    <br />
      <asp:SqlDataSource ID="mediatorzy" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT View_ListaMediatorow.ident, View_ListaMediatorow.tytul, View_ListaMediatorow.imie, View_ListaMediatorow.nazwisko, View_ListaMediatorow.adres, View_ListaMediatorow.data_poczatkowa, View_ListaMediatorow.data_koncowa, View_ListaMediatorow.pesel, View_ListaMediatorow.zawieszony, View_ListaMediatorow.adres2, View_ListaMediatorow.adr_kores, View_ListaMediatorow.kod_poczt_kor, View_ListaMediatorow.miejscowosc_kor, View_ListaMediatorow.specjalizacjeWidok, View_ListaMediatorow.uwagi, View_ListaMediatorow.specjalizacja_opis, View_ListaMediatorow.tel1, View_ListaMediatorow.typ, tbl_osoby.imie AS Expr1, tbl_osoby.nazwisko AS Expr2, tbl_osoby.ulica, tbl_osoby.kod_poczt, tbl_osoby.miejscowosc, tbl_osoby.data_koncowa AS Expr3, tbl_osoby.pesel AS Expr4, tbl_osoby.d_usuniecia, tbl_osoby.id_usuwajacego, tbl_osoby.czy_zaw, tbl_osoby.tel1 AS Expr6, tbl_osoby.tel2, tbl_osoby.email, tbl_osoby.adr_kores AS Expr7, tbl_osoby.kod_poczt_kor AS Expr8, tbl_osoby.miejscowosc_kor AS Expr9, tbl_osoby.uwagi AS Expr10, tbl_osoby.d_zawieszenia, tbl_osoby.dataKoncaZawieszenia, tbl_osoby.specjalizacja_opis AS Expr11, GETDATE() AS now FROM View_ListaMediatorow LEFT OUTER JOIN tbl_osoby ON View_ListaMediatorow.ident = tbl_osoby.ident WHERE (View_ListaMediatorow.data_koncowa &gt;= GETDATE())" DeleteCommand="UPDATE tbl_osoby SET czyus = 1, d_usuniecia = GETDATE(), id_usuwajacego = @id_usuwajacego WHERE (ident = @ident)" UpdateCommand="UPDATE tbl_osoby SET imie = @imie, nazwisko = @nazwisko, ulica = @ulica, kod_poczt = @kod_poczt, miejscowosc = @miejscowosc, data_poczatkowa = @data_poczatkowa, data_koncowa = @data_koncowa, pesel = @pesel, tytul = @tytul, czy_zaw = @czy_zaw, tel1 = @tel1, tel2 = @tel2, email = @email, adr_kores = @adr_kores, kod_poczt_kor = @kod_poczt_kor, miejscowosc_kor = @miejscowosc_kor, uwagi = @uwagi, d_zawieszenia = @d_zawieszenia, specjalizacjeWidok = @specjalizacjeWidok, specjalizacja_opis = @specjalizacja_opis, dataKoncaZawieszenia = @dataKoncaZawieszenia WHERE (ident = @ident)">
          <DeleteParameters>
              <asp:SessionParameter Name="id_usuwajacego" SessionField="id_usuwajacego"/>
              <asp:SessionParameter Name="ident" SessionField="ident"/>
          </DeleteParameters>
         
          <UpdateParameters>
              <asp:Parameter Name="imie"   />
              <asp:Parameter Name="nazwisko"  />
              <asp:Parameter Name="ulica"  />
              <asp:Parameter Name="kod_poczt"   />
              <asp:Parameter Name="miejscowosc"  />
              <asp:Parameter Name="data_poczatkowa"   />
              <asp:Parameter Name="data_koncowa"  />
              <asp:Parameter Name="pesel"  />
              <asp:Parameter Name="tytul"  />
              <asp:Parameter Name="czy_zaw"  />
              <asp:Parameter Name="tel1"  />
              <asp:Parameter Name="tel2"  />
              <asp:Parameter Name="email"  />
              <asp:Parameter Name="adr_kores"  />
              <asp:Parameter Name="kod_poczt_kor"  />
              <asp:Parameter Name="miejscowosc_kor"  />
              <asp:Parameter Name="uwagi"   />
              <asp:Parameter Name="d_zawieszenia"  />
              <asp:Parameter Name="specjalizacjeWidok"   />
              <asp:Parameter Name="specjalizacja_opis"   />
              <asp:Parameter Name="dataKoncaZawieszenia"   />
              <asp:Parameter Name="ident"  />
          </UpdateParameters>
    </asp:SqlDataSource>
        
        
        
        
       
        
        
       
        
        
        
        
        
        
       
        
        
        
        
        
        
       
        
        
        
        
        
        
  
        
        <br />
        
        <asp:EntityDataSource ID="dsEntity" runat="server"
    DefaultContainerName="wapEntities" ConnectionString="name=wapEntities" EntitySetName="tbl_osoby" EnableFlattening="False" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:EntityDataSource>
        
        
        <br />
        <br />
     
             
                                     
        
     </div>
</asp:Content>
