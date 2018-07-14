<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="zawieszenia.ascx.cs" Inherits="wab2018.userControls.zawieszenia" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type="text/css">
    .auto-style1 {
        font-size: medium;
    }
</style>

<p>
    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
            <td style="width: 50%">

<dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="zmieńStanZawieszenia" Text="Zawieszenie" TextAlign="Left" Theme="Moderno">
</dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</p>
<asp:Panel ID="Panel1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">Data początku zawieszenia</td>
            <td style="width: 50%">
                <dx:ASPxDateEdit ID="txPoczatek" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Data końca zawieszenia</td>
            <td style="width: 50%">
                <dx:ASPxDateEdit ID="txKoniec" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit>
            </td>
        </tr>
    </table>
</asp:Panel>
<p>
    <br />
</p>

