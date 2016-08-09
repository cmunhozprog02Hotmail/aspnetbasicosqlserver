<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pDataSource.aspx.cs" Inherits="ASPNETSample01.pDataSource" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDsCidades" runat="server" 
            ConnectionString="<%$ ConnectionStrings:sampledbConnectionString %>" 
            SelectCommand="SELECT * FROM [Cidades]"></asp:SqlDataSource>
        
        <asp:GridView ID="GVCidades" runat="server" AutoGenerateColumns="False" DataKeyNames="idCidade" DataSourceID="SqlDsCidades" AllowPaging="True" AllowSorting="True" PageSize="5">
        <Columns>
            <asp:BoundField DataField="idCidade" HeaderText="idCidade" InsertVisible="False" ReadOnly="True" SortExpression="idCidade" />
            <asp:BoundField DataField="descricao" HeaderText="descricao" SortExpression="descricao" />
            <asp:TemplateField>
                <HeaderTemplate>
                    Meu Botão
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button runat="server" ID="btn" text="OK" OnClick="btn_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
    
    </div>
        

    </form>
    
</body>
</html>
