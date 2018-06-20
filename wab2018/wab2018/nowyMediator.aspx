<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="nowyMediator.aspx.cs" Inherits="wab2018.nowyMediator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
        
        .style2
        {
            width: 123px;
        }
        .style3
        {
            height: 26px;
            width: 123px;
        }
        
        .auto-style2 {
            width: 33%;
        }
        .auto-style3 {
            height: 46px;
        }
        .auto-style4 {
            width: 123px;
            height: 46px;
        }
       
      
        
        .auto-style5 {
            height: 21px;
        }
       
      
        
    </style>
    <br />

   
     <div id ="mainWindow" class="newPage">  Nowy mediator 


    <asp:Panel ID="Panel6" runat="server" BorderStyle="Solid" BorderWidth="1px">
 <h2>
     
      
</h2>
  <hr>
        <table style="width:100%; " cellpadding="0" cellspacing="0" >
            <tr>
                <td style="vertical-align: top;" class="auto-style2">
                      <table style="width:100%;">
            <tr>
                <td >
                    <asp:Label ID="Label3" runat="server" Text="Tytuł"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    Imie</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="&lt;- Proszę uzupełnić pole"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Nazwisko</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="&lt;- Proszę uzupełnić pole"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Adres</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td class="style1" style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="&lt;- Proszę uzupełnić pole"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Kod pocztowy</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="&lt;- Proszę uzupełnić pole"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox4" 
                        ErrorMessage="Proszę wpisać poprawny kod pocztowy XX-XXX" 
                        ValidationExpression="^[0-9]{2}-[0-9]{2}[0-9]$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Miejscowość</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="&lt;- Proszę uzupełnić pole"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Powołanie od:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox6" runat="server" AutoPostBack="True" CausesValidation="True" OnTextChanged="TextBox6_TextChanged"></asp:TextBox>
                  
                </td>
                <td class="style1" style="width: 40%">
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                        Height="20px" ImageUrl="~/img/cal_1.jpg" />
                </td>
            </tr>
            <tr>
                <td>
                    Powołanie do:</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                        Height="20px" ImageUrl="~/img/cal_1.jpg" />
                </td>
            </tr>
            <tr>
                <td abbr="0" align="center" class="auto-style3">
                    Nr PESEL</td>
                <td class="auto-style4" abbr="0" align="center">
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                </td>
                <td abbr="0" align="center" class="auto-style5">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBox9" ErrorMessage="Proszę podać poprawny nr PESEL" 
                        ValidationExpression="^[0-9]{11}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
  
   
      
                    </td>
                <td class="auto-style2" style="vertical-align: top;">Dane kontaktowe
                    <table style="width:100%;">
        <tr>
            <td>nr telefonu 1</td>
           
            <td>
                <asp:TextBox ID="tel1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>nr telefonu 2</td>
            
            <td>
                <asp:TextBox ID="tel2" runat="server"></asp:TextBox>
            </td>
        </tr>
                         <tr>
            <td>email</td>
            
            <td>
                <asp:TextBox ID="email" runat="server"></asp:TextBox>
            </td>
        </tr>
      
    </table>

                    Adres korespondencyjny
                    <table style="width: 100%;">
                        <tr>
                            <td>adres</td>
                          
                            <td>
                                 <asp:TextBox ID="adrKor" runat="server"></asp:TextBox>
                                </td>
                        </tr>
                         <tr>
                            <td>Kod pocztowy</td>
                          
                            <td>
                                 <asp:TextBox ID="kodKor" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>miejscowość</td>
                            
                            <td> <asp:TextBox ID="cityKor" runat="server"></asp:TextBox></td>
                        </tr>
                       
                    </table>

                </td>
                <td>
                    &nbsp;</td>
            </tr>
          
        </table>
    
   <table style=" width: 100%;">
                <tr>
                    <td style=" width: 100%; text-align:center">
                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CssClass="button_" 
                            onclick="LinkButton1_Click">Zapisz</asp:LinkButton>
                    </td>
                    <td style=" width: 100%; text-align :center">
                       
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="button_" 
                            onclick="LinkButton2_Click" CausesValidation="False">Anuluj</asp:LinkButton>
                    </td>
                </tr>
                </table>
    

      
   

         </asp:Panel>



</div>
    




</asp:Content>
