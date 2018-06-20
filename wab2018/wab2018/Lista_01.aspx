<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Lista_01.aspx.cs" Inherits="wab2018.Lista_01" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
     <script language=javascript>
        var xvalue
        var yvalue
        function printMousePos(event) {

            xvalue = event.pageX;
            yvalue = event.pageY;
            

        }

       document.addEventListener("click", printMousePos);


    function openPopup(strOpen)
        {
     
      
        //toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no  status=0,toolbar=0,menubar=0,location=0,
        //open(strOpen, "Info", "menubar=no,location=no,resizable=no,scrollbars=yes,status=yes, width=400, height=200, top=" + yvalue + ", left=" + xvalue);
        open(strOpen, "Dane biegłego", "toolbar=no, location=no, directories=no, status=no, menubar=0,  copyhistory=no,scrollbars=yes, width=700, height=400, top=" + yvalue + ", left=" + xvalue);
    }
    </script>

      <div id ="mainWindow" class="newPage">  Biegli 

    <h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        Wykaz biegłych sądowych</h2>
     <div class="noprint" >
    <table style="width:1150px;">
        <tr>
            <td>
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Wyświetl po specjalizacji" 
                    AutoPostBack="True" oncheckedchanged="CheckBox1_CheckedChanged" TabIndex="1" />
            &nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="nazwa" DataValueField="id_" 
                     onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
           <td>
               <asp:LinkButton ID="LinkButton4" runat="server" Text="Drukuj" CssClass="button_" OnClick="print_"></asp:LinkButton>
           </td>
             <td>
               <asp:LinkButton ID="LinkButton6" runat="server" Text="Excel" CssClass="button_" OnClick="makeExcell" ></asp:LinkButton>
           </td>
        </tr>
        </table>
         </div> 
     <asp:Panel ID="Panel1" runat="server" 
                        Width="100%" HorizontalAlign="Left">
                           <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:wap %>" 
            
            
                               
                               SelectCommand="SELECT DISTINCT View_lista_osob_z_kategoriami.imie, View_lista_osob_z_kategoriami.nazwisko, View_lista_osob_z_kategoriami.ulica, View_lista_osob_z_kategoriami.kod_poczt, View_lista_osob_z_kategoriami.miejscowosc, View_lista_osob_z_kategoriami.data_poczatkowa, View_lista_osob_z_kategoriami.data_koncowa, View_lista_osob_z_kategoriami.ident, View_lista_osob_z_kategoriami.tytul, tbl_osoby.pesel, View_lista_osob_z_kategoriami.zawieszony, COALESCE (View_lista_osob_z_kategoriami.adr_kores, '') AS adr_koresp2, COALESCE (View_lista_osob_z_kategoriami.kod_poczt_kor, '') AS kod_poczt_kor2, COALESCE (View_lista_osob_z_kategoriami.miejscowosc_kor, '') AS miejscowosc_kor2, View_lista_osob_z_kategoriami.adr_kores, View_lista_osob_z_kategoriami.kod_poczt_kor, View_lista_osob_z_kategoriami.miejscowosc_kor FROM View_lista_osob_z_kategoriami LEFT OUTER JOIN tbl_osoby ON View_lista_osob_z_kategoriami.ident = tbl_osoby.ident ORDER BY View_lista_osob_z_kategoriami.nazwisko">
        </asp:SqlDataSource>
           <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            
                               
                               
                               
                               DataKeyNames="ident,tytul,imie,nazwisko,ulica,kod_poczt,miejscowosc,data_poczatkowa,data_koncowa,pesel,zawieszony,adr_koresp2,kod_poczt_kor2,miejscowosc_kor2" DataSourceID="SqlDataSource2" 
            onrowdatabound="GridView2_RowDataBound" Width="95%" AllowSorting="True" CellPadding="2" 
                               ForeColor="#333333" GridLines="None" onrowcreated="GridView2_RowCreated" 
                               onselectedindexchanged="GridView2_SelectedIndexChanged" 
                               onsorted="GridView2_Sorted1" ShowHeader="False">
               <AlternatingRowStyle BackColor="White" />
            <Columns>
                 <asp:TemplateField>
                     <ItemTemplate>
                       
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("ident")%>')" class="noprint">  <asp:Image ID="Image2" runat="server" ImageUrl="~/img/edit.jpg" />
                           </a> 
              </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="tytul" HeaderText="Tytul" SortExpression="tytul" />
                <asp:BoundField DataField="imie" HeaderText="Imię" SortExpression="imie" />
                
                <asp:BoundField DataField="nazwisko" HeaderText="Nazwisko" 
                    SortExpression="nazwisko" />
                <asp:TemplateField HeaderText="Adres zameldowania" SortExpression="ulica">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ulica") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ulica") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("kod_poczt") %>'></asp:Label>
                        &nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Bind("miejscowosc") %>'></asp:Label>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("ident") %>' />
                        &nbsp;
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Adres korespondencyjny" SortExpression="kod_poczt">
                  
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("adr_kores") %>'></asp:Label>
                       <br />
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("kod_poczt_kor", "{0}") %>'></asp:Label>
                        &nbsp;<asp:Label ID="Label8" runat="server" Text='<%# Eval("miejscowosc_kor", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="zawieszony" ShowHeader="False" SortExpression="zawieszony">
                <ItemStyle ForeColor="#FF3300" />
                </asp:BoundField>
                <asp:BoundField DataField="data_poczatkowa" HeaderText="od" SortExpression="data_poczatkowa" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:BoundField DataField="data_koncowa" HeaderText="do" 
                    SortExpression="data_koncowa" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:TemplateField HeaderText="Specjalizacje">
                    <ItemTemplate>
                    
    <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemo" runat="Server"
        TargetControlID="Panel7"
        ExpandControlID="Image1"
        CollapseControlID="Image1" 
        CollapsedSize="28"
        Collapsed="True"
        ImageControlID="Image1"    
        ExpandedText="(Hide Details...)"
        CollapsedText="Rozwiń"
        ExpandedImage="~/img/collapse_blue.jpg"
        CollapsedImage="~/img/expand_blue.jpg"
        SuppressPostBack="true"
         />
                                        <table style="width: 100%; float:left; " border="0" 
                            cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td valign="top" align="left" width="40px">
                    <asp:ImageButton ID="Image1" runat="server" ImageUrl="~/img/expand_blue.jpg" AlternateText="(Pokaż szczegóły...)"/>
                                                </td>
                                                <td align="left" valign="top">
                                                   
                                                   <asp:Panel ID="Panel7" runat="server" CssClass="panel_top" 
                                                        HorizontalAlign="Left" Width="100%">
                                                    
                                                      <asp:GridView ID="GridView22" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="Inner_table" ShowHeader="False" BorderStyle="None" BorderWidth="0px" 
                                                           ToolTip="Specjalizacje" Width="100%">
                                                          <AlternatingRowStyle BorderStyle="None" />
                            <Columns>
                                <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" >
                                <ItemStyle BorderStyle="None" BorderWidth="0px" Font-Size="X-Small" />
                                </asp:BoundField>
                            </Columns>
                                                          <RowStyle BorderStyle="None" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="Inner_table" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:wap %>" 
                            
                                                           
                                                           SelectCommand="SELECT DISTINCT glo_specjalizacje.nazwa FROM tbl_specjalizacje_osob LEFT OUTER JOIN glo_specjalizacje ON tbl_specjalizacje_osob.id_specjalizacji = glo_specjalizacje.id_ WHERE (tbl_specjalizacje_osob.id_osoby = @id_osoby)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_osoby" SessionField="aa" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                   

                                                    </asp:Panel>

                                                </td>
                                                
                                            </tr>
                                       
                                        </table>


                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
               <EditRowStyle BackColor="#2461BF" />
               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#4B6C9E" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#EFF3FB" />
               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#F5F7FB" />
               <SortedAscendingHeaderStyle BackColor="#6D95E1" />
               <SortedDescendingCellStyle BackColor="#E9EBEF" />
               <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
                    </asp:Panel>
     
   
    <asp:Panel ID="Panel3" runat="server" CssClass="Panel_2_2" Visible="False">
        
        <br />
    </asp:Panel>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:wap %>" 
                                    
                                    SelectCommand="SELECT DISTINCT id_,nazwa FROM [glo_specjalizacje] ORDER BY [nazwa]">
                                </asp:SqlDataSource>
    <uc2:alert ID="alert1" runat="server" Visible="False" />
        <br />
        <br />
        <br />
        <br />
    <br />
        <br />
        <br />
        <br />
    <br />
        <br />
        <br />
        <br />
    <br />
        <br />
        <br />
        <asp:GridView ID="GridView24" runat="server" DataSourceID="SqlDataSource2" Visible="False" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
                <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
                <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
                <asp:BoundField DataField="kod_poczt" HeaderText="kod_poczt" SortExpression="kod_poczt" />
                <asp:BoundField DataField="miejscowosc" HeaderText="miejscowosc" SortExpression="miejscowosc" />
                <asp:BoundField DataField="data_poczatkowa" HeaderText="data_poczatkowa" SortExpression="data_poczatkowa" />
                <asp:BoundField DataField="data_koncowa" HeaderText="data_koncowa" SortExpression="data_koncowa" />
                <asp:BoundField DataField="ident" HeaderText="ident" SortExpression="ident" />
                <asp:BoundField DataField="tytul" HeaderText="tytul" SortExpression="tytul" />
                <asp:BoundField DataField="pesel" HeaderText="pesel" SortExpression="pesel" />
                <asp:BoundField DataField="zawieszony" HeaderText="zawieszony" ReadOnly="True" SortExpression="zawieszony" />
                <asp:BoundField DataField="adr_koresp2" HeaderText="adr_koresp2" ReadOnly="True" SortExpression="adr_koresp2" />
                <asp:BoundField DataField="kod_poczt_kor2" HeaderText="kod_poczt_kor2" ReadOnly="True" SortExpression="kod_poczt_kor2" />
                <asp:BoundField DataField="miejscowosc_kor2" HeaderText="miejscowosc_kor2" ReadOnly="True" SortExpression="miejscowosc_kor2" />
                <asp:BoundField DataField="adr_kores" HeaderText="adr_kores" SortExpression="adr_kores" />
                <asp:BoundField DataField="kod_poczt_kor" HeaderText="kod_poczt_kor" SortExpression="kod_poczt_kor" />
                <asp:BoundField DataField="miejscowosc_kor" HeaderText="miejscowosc_kor" SortExpression="miejscowosc_kor" />
            </Columns>
    </asp:GridView>
        <br />
                                        
                              </div>
       
</asp:Content>
