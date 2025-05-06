﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tabelaSpecjalizacji.ascx.cs" Inherits="wab2018.userControls.tabelaSpecjalizacji" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="tabelaSpecjalizacjoSQL">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="Column1" ReadOnly="True" VisibleIndex="0">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Column2" ReadOnly="True" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
    </Columns>
</dx:ASPxGridView>
<asp:SqlDataSource ID="tabelaSpecjalizacjoSQL" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="select upper (COALESCE( rtrim(glo_specjalizacje.nazwa),'')),  COALESCE (rtrim(tbl_specjalizacje_osob.opis),'') 
FROM            tbl_specjalizacje_osob LEFT OUTER JOIN
                         glo_specjalizacje ON tbl_specjalizacje_osob.id_specjalizacji = glo_specjalizacje.id_
WHERE        (tbl_specjalizacje_osob.id_osoby = @idOsoby) and glo_specjalizacje.nazwa &lt;&gt;'' ">
    <SelectParameters>
        <asp:SessionParameter Name="idOsoby" SessionField="idOsoby" />
    </SelectParameters>
</asp:SqlDataSource>

