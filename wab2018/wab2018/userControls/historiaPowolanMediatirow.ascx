﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="historiaPowolanMediatirow.ascx.cs"  Inherits="wab2018.historiaPowolanMediatirow" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<div style="z-index:99999;">



<asp:SqlDataSource ID="ListaPowolanMediatorow" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" DeleteCommand="UPDATE tbl_powolania SET d_modyfikacji = GETDATE(), czyus = 1 WHERE (ident = @ident)" InsertCommand="INSERT INTO tbl_powolania(id_bieglego, data_od, data_do, d_kreacji, kreator, czyus, id_powolania) VALUES (@id_bieglego, @data_od, @data_do, GETDATE(), @kreator, 0, 1)" SelectCommand="SELECT [ident], [id_bieglego], [id_powolania], [data_od], [data_do], [d_kreacji], [d_modyfikacji], [kreator], [modyfikator], [czyus] FROM [tbl_powolania] WHERE (([id_bieglego] = @id_bieglego) AND ([czyus] =0))" UpdateCommand="UPDATE tbl_powolania SET d_modyfikacji = GETDATE(), data_od = @data_od, data_do = @data_do WHERE (ident = @ident)">
    <DeleteParameters>
        <asp:Parameter Name="ident" />

    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="id_bieglego" Type="Int32" />
        <asp:Parameter Name="data_od" Type="DateTime" />
        <asp:Parameter Name="data_do" Type="DateTime" />
       
        <asp:Parameter Name="kreator" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="id_bieglego" SessionField="idMediatora" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="data_od" Type="DateTime" />
        <asp:Parameter Name="data_do" Type="DateTime" />
        <asp:Parameter Name="ident" />
    </UpdateParameters>
</asp:SqlDataSource>



<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ListaPowolanMediatorow" KeyFieldName="ident" OnCustomCallback="ASPxGridView1_CustomCallback" OnInitNewRow="ASPxGridView1_InitNewRow" OnRowInserted="ASPxGridView1_RowInserted" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize" OnRowUpdating="ASPxGridView1_RowUpdating" OnRowInserting="ASPxGridView1_RowInserting" Theme="Moderno">
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataDateColumn FieldName="data_od" ReadOnly="True" VisibleIndex="3" Caption="Początek powołania ">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="data_do" ReadOnly="True" VisibleIndex="5" Caption="Koniec powołania">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="ident" Visible="False" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
    </Columns>
     <SettingsEditing Mode="Inline">
    </SettingsEditing>
     <EditFormLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
        </EditFormLayoutProperties>

        <SettingsPopup>
         
        </SettingsPopup>
</dx:ASPxGridView>
    <br />
    <br />
    </div>

