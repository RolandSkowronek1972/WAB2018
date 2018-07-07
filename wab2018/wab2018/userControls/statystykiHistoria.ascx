﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="statystykiHistoria.ascx.cs" Inherits="wab2018.userControls.statystykiHistoria" %>

        
        
  
        <%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

        
        
  
        <asp:Panel ID="Panel1" runat="server" Height="150px" ScrollBars="Vertical">
            <asp:SqlDataSource ID="daneStatystyczneOsob" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT [Nazwa], [kwerenda] FROM [dane_statystyczne] ORDER BY [Nazwa]"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="daneStatystyczneOsob" DataTextField="Nazwa" DataValueField="kwerenda" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="22px" Width="175px">
            </asp:DropDownList>
            <br />
            <br />
           <dx:ASPxGridView ID="gridDaneStatystyczne" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="Moderno"><Columns><dx:GridViewDataTextColumn FieldName="id_" ReadOnly="True" VisibleIndex="0"><EditFormSettings Visible="False" /></dx:GridViewDataTextColumn><dx:GridViewDataTextColumn FieldName="Nazwa" VisibleIndex="1"></dx:GridViewDataTextColumn><dx:GridViewDataTextColumn FieldName="kwerenda" VisibleIndex="2"></dx:GridViewDataTextColumn><dx:GridViewDataTextColumn FieldName="kreator" VisibleIndex="3"></dx:GridViewDataTextColumn><dx:GridViewDataDateColumn FieldName="d_kreacji" VisibleIndex="4"></dx:GridViewDataDateColumn><dx:GridViewDataTextColumn FieldName="modyfikator" VisibleIndex="5"></dx:GridViewDataTextColumn><dx:GridViewDataDateColumn FieldName="d_modyfikacji" VisibleIndex="6"></dx:GridViewDataDateColumn><dx:GridViewDataTextColumn FieldName="czy_us" VisibleIndex="7"></dx:GridViewDataTextColumn></Columns></dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT id_, Nazwa, kwerenda, kreator, d_kreacji, modyfikator, d_modyfikacji, czy_us FROM dane_statystyczne WHERE (id_ = - 100)"></asp:SqlDataSource>
            <br />
        </asp:Panel>
        
        
        

        
        
        