﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="datyZawieszenia.ascx.cs" Inherits="wab2018.userControls.WebUserControl1" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<script>
    function onClickHandler() {
        var chk = document.getElementById("box").value;

       
        var x = document.getElementById("ramka");

        if (x.style.display == "none") {
            alert("Block");
            x.style.display = "block";
        } else {
            x.style.display = "none";
            alert("none");
 
        }

    }
</script>
<input type="checkbox" onchange="onClickHandler()" id="box" />
<div id="ramka" style="display:none">
    <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server">
</dx:ASPxDateEdit>
        <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server">
</dx:ASPxDateEdit>

</div>