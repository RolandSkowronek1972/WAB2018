﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="specjalizacjeBiegli.ascx.cs" Inherits="wab2018.userControls.specjalizacjeBiegli" %>



        
                       <%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




     
                                 
        <asp:SqlDataSource ID="specjalizacjeOsob" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY View_SpecjalizacjeIOsoby.id_ ASC) AS Row, View_SpecjalizacjeIOsoby.Expr1 AS stab, View_SpecjalizacjeIOsoby.nazwa, View_SpecjalizacjeIOsoby.id_ AS idSpecjalizacji, View_SpecjalizacjeIOsoby.ident AS idOsoby FROM View_SpecjalizacjeIOsoby INNER JOIN glo_specjalizacje ON View_SpecjalizacjeIOsoby.id_ = glo_specjalizacje.id_ WHERE (View_SpecjalizacjeIOsoby.ident = @ident) AND (glo_specjalizacje.grupa &lt; 1000) ORDER BY View_SpecjalizacjeIOsoby.nazwa" UpdateCommand="UPDATE tbl_specjalizacje_osob SET id_osoby = 0 WHERE (id_osoby = 0)">
            <SelectParameters>
              
                <asp:SessionParameter Name="ident" SessionField="id_osoby" />
              
            </SelectParameters>
           
        </asp:SqlDataSource>    
<asp:Panel ID="Panel1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="specjalizacjeOsob" KeyFieldName="idSpecjalizacji" OnRowUpdating="ASPxGridView1_RowUpdating" Theme="Moderno" EnableTheming="True" Width="90%">
        <Settings VerticalScrollBarMode="Visible" />
        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Row" ReadOnly="True" Visible="False" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="stab" VisibleIndex="0" Caption="Posiadana specjalizacja" Width="25%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" VisibleIndex="1" Caption="Nazwa specjalizacji" Width="25%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="idSpecjalizacji" Visible="False" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="idOsoby" Visible="False" VisibleIndex="5">
                <EditItemTemplate>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text='<%# Eval("idOsoby") %>'>
                    </dx:ASPxLabel>
                </EditItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Opis" ReadOnly="True" VisibleIndex="2" Width="50%">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
    </dx:ASPxGridView>
</asp:Panel>

    
