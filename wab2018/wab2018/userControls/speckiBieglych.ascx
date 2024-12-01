﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="speckiBieglych.ascx.cs" Inherits="wab2018.userControls.speckiBieglych" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="specjalizacjeOsob" Width="100%" KeyFieldName="id_" OnRowInserting="ASPxGridView1_RowInserting" EnableTheming="True" Theme="Moderno" OnRowUpdating="ASPxGridView1_RowUpdating" OnStartRowEditing="ASPxGridView1_StartRowEditing" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize" OnCustomCallback="ASPxGridView1_CustomCallback" OnInitNewRow="initNewRow">
    <SettingsPager Visible="False">
    </SettingsPager>
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="0px">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="opis" VisibleIndex="3" Width="70%" Caption="Opis dodatkowy">
            <EditItemTemplate>
                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Text='<%# Bind("opis") %>' Width="100%" Theme="Moderno">
                </dx:ASPxTextBox>
            </EditItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="nazwa" VisibleIndex="2" Width="30%" Caption="Nazwa specjalizacji" ReadOnly="True" Name="nazwaSpecjalizacji">
            <EditItemTemplate>
                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Text='<%# Bind("nazwa") %>' Width="100%" Theme="Moderno" ReadOnly="True"></dx:ASPxTextBox>
           <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SpecjalizacjeSQL" DropDownRows="10" SelectedIndex="0" Text='<%# Bind("nazwa") %>' Theme="Moderno" Value='<%# Bind("id_specjalizacji") %>' ValueField="id_" Width="100%" AutoPostBack="False"  Visible="False">
                 
               <Columns>
                        <dx:ListBoxColumn FieldName="nazwa" Name="Specjalizacja">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="id_" Visible="False">
                        </dx:ListBoxColumn>
                    </Columns>
                    <Items>
                        <dx:ListEditItem Text="ListEditItem" Value="1" />
                        <dx:ListEditItem Text="ListEditItem" Value="0" />
                    </Items>
                </dx:ASPxComboBox>
            </EditItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="id_" Visible="False" VisibleIndex="4" ShowInCustomizationForm="True">
        </dx:GridViewDataTextColumn>
    </Columns>
</dx:ASPxGridView>
<asp:SqlDataSource ID="specjalizacjeOsob" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" DeleteCommand="DELETE FROM tbl_specjalizacje_osob WHERE (id_ = @id_)" InsertCommand="INSERT INTO tbl_specjalizacje_osob(id_osoby, id_specjalizacji, opis) VALUES (@id_osoby, @id_specjalizacji, @opis)" SelectCommand="SELECT tbl_specjalizacje_osob.id_, tbl_specjalizacje_osob.id_osoby, tbl_specjalizacje_osob.opis, tbl_specjalizacje_osob.id_specjalizacji, glo_specjalizacje.nazwa FROM tbl_specjalizacje_osob LEFT OUTER JOIN glo_specjalizacje ON tbl_specjalizacje_osob.id_specjalizacji = glo_specjalizacje.id_ WHERE (tbl_specjalizacje_osob.id_osoby = @idOsoby) ORDER BY glo_specjalizacje.nazwa" UpdateCommand="UPDATE tbl_specjalizacje_osob SET opis = @opis WHERE (id_ = @id)">
    <DeleteParameters>
        <asp:Parameter Name="id_" />
    </DeleteParameters>
    <InsertParameters>
        <asp:SessionParameter Name="id_osoby"  SessionField="id_osoby"/>
        <asp:Parameter Name="id_specjalizacji" />
        <asp:Parameter Name="opis" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="idOsoby" SessionField="id_osoby" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="opis" />
        <asp:Parameter Name="id" />
    </UpdateParameters>
</asp:SqlDataSource>
     



            <asp:SqlDataSource ID="SpecjalizacjeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT id_, nazwa FROM glo_specjalizacje WHERE (grupa &lt; 1000) ORDER BY nazwa" DeleteCommand="DELETE FROM tbl_specjalizacje_osob where id=@id">
                <DeleteParameters>
                    <asp:Parameter Name="id" />
                </DeleteParameters>
</asp:SqlDataSource>


 



