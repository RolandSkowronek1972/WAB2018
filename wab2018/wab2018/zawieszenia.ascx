﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="zawieszenia.ascx.cs" Inherits="wab2018.zawieszenia" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<table style="width:100%;">
    <tr>
        <td>
            <asp:CheckBox ID="cbZawieszenie" runat="server" OnCheckedChanged="zawieszeni" AutoPostBack="True" Text="Zawieszenie" />
        </td>
        <td>
            <asp:Panel ID="Panel1" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td>początek zawieszenia</td>
                        <td>
                            <dx:ASPxDateEdit ID="txPoczatekZawiszenia" runat="server">
                            </dx:ASPxDateEdit>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>koniec zawieszenia</td>
                        <td>
                            <dx:ASPxDateEdit ID="txKoniecZawieszenia" runat="server">
                            </dx:ASPxDateEdit>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>

