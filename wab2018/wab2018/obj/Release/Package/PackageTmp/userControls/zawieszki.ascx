﻿
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="zawieszki.ascx.cs" Inherits="wab2018.userControls.zawieszki" %>


<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<style type="text/css">
    .auto-style1 {
        font-size: medium;
    }
</style>



<table style="width:100%;">
    <tr>
        <td style="width: 15%">&nbsp;</td>
        <td style="width: 50%">



<dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Theme="Moderno" AutoPostBack="True" CheckState="Unchecked" OnCheckedChanged="ASPxCheckBox1_CheckedChanged" Text="Zawieszenie">
    <ClientSideEvents CheckedChanged="function(s, e) {
}" />
</dx:ASPxCheckBox>
        </td>
    </tr>
    <tr>
        <td style="width: 15%"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Początek zawieszenia" CssClass="auto-style1">
            </dx:ASPxLabel>
        </td>
        <td style="width: 50%">
            <div id="data1" style="display:block">
<dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" Theme="Moderno" AutoPostBack="True" OnDateChanged="ASPxDateEdit1_DateChanged">
</dx:ASPxDateEdit>
            </div>
        </td>
    </tr>
    <tr>
        <td style="width: 15%">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Koniec zawieszenia" CssClass="auto-style1">
            </dx:ASPxLabel>
        </td>
        <td style="width: 50%">
            <div id="data2" style="display:block">
<dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" Theme="Moderno" AutoPostBack="True" OnDateChanged="ASPxDateEdit2_DateChanged">
</dx:ASPxDateEdit>
                </div>


        </td>
    </tr>
</table>




