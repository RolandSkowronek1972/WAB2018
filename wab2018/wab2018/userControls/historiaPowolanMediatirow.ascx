<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="historiaPowolanMediatirow.ascx.cs"  Inherits="wab2018.historiaPowolanMediatirow" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<div style="z-index:99999;">



<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ListaPowolanMediatorow" KeyFieldName="id_bieglego" OnCustomCallback="ASPxGridView1_CustomCallback" OnInitNewRow="ASPxGridView1_InitNewRow" OnRowInserted="ASPxGridView1_RowInserted">
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataDateColumn FieldName="data_od" ReadOnly="True" VisibleIndex="4" Caption="Początek powołania ">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="data_do" ReadOnly="True" VisibleIndex="5" Caption="Koniec powołania">
        </dx:GridViewDataDateColumn>
    </Columns>
     <EditFormLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
        </EditFormLayoutProperties>

        <SettingsPopup>
         
        </SettingsPopup>
</dx:ASPxGridView>
<asp:SqlDataSource ID="ListaPowolanMediatorow" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" DeleteCommand="DELETE FROM [tbl_powolania] WHERE [id_bieglego] = @id_bieglego AND [data_od] = @data_od AND [data_do] = @data_do" InsertCommand="INSERT INTO [tbl_powolania] ([id_bieglego], [data_od], [data_do], [d_kreacji],  [kreator],  [czyus]) VALUES (@id_bieglego, @data_od, @data_do, @d_kreacji, @kreator, @czyus)" SelectCommand="SELECT [ident], [id_bieglego], [id_powolania], [data_od], [data_do], [d_kreacji], [d_modyfikacji], [kreator], [modyfikator], [czyus] FROM [tbl_powolania] WHERE (([id_bieglego] = @id_bieglego) AND ([czyus] = @czyus))" UpdateCommand="UPDATE [tbl_powolania] SET [ident] = @ident, [id_powolania] = @id_powolania, [d_kreacji] = @d_kreacji, [d_modyfikacji] = @d_modyfikacji, [kreator] = @kreator, [modyfikator] = @modyfikator, [czyus] = @czyus WHERE [id_bieglego] = @id_bieglego AND [data_od] = @data_od AND [data_do] = @data_do">
    <DeleteParameters>
        <asp:Parameter Name="id_bieglego" Type="Int32" />
        <asp:Parameter Name="data_od" Type="DateTime" />
        <asp:Parameter Name="data_do" Type="DateTime" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="id_bieglego" Type="Int32" />
        <asp:Parameter Name="data_od" Type="DateTime" />
        <asp:Parameter Name="data_do" Type="DateTime" />
        <asp:Parameter Name="d_kreacji" Type="DateTime" />
       
        <asp:Parameter Name="kreator" Type="Int32" />
        <asp:Parameter Name="czyus" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="id_bieglego" SessionField="idMediatora" Type="Int32" />
        <asp:SessionParameter DefaultValue="0" Name="czyus" SessionField="czyUs" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ident" Type="Int32" />
        <asp:Parameter Name="id_powolania" Type="Int32" />
        <asp:Parameter Name="d_kreacji" Type="DateTime" />
        <asp:Parameter Name="d_modyfikacji" Type="DateTime" />
        <asp:Parameter Name="kreator" Type="Int32" />
        <asp:Parameter Name="modyfikator" Type="Int32" />
        <asp:Parameter Name="czyus" Type="Int32" />
        <asp:Parameter Name="id_bieglego" Type="Int32" />
        <asp:Parameter Name="data_od" Type="DateTime" />
        <asp:Parameter Name="data_do" Type="DateTime" />
    </UpdateParameters>
</asp:SqlDataSource>
    <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server">
    </dx:ASPxDateEdit>
    aaa<dx:ASPxTextBox ID="ASPxTextBox1" runat="server" OnTextChanged="ASPxTextBox1_TextChanged" Width="170px">
    </dx:ASPxTextBox>
    <br />
    <br />
    </div>

