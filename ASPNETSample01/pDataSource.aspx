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
            SelectCommand="SELECT * FROM [Cidades]"
             DeleteCommand="DELETE FROM Cidades WHERE [idCidade] = @idCidade"
             UpdateCommand="UPDATE Cidades SET descricao = @descricao WHERE (idCidade = @idCidade)"
             InsertCommand="INSERT INTO Cidades(descricao) VALUES (@descricao)">
             
            <DeleteParameters>
                <asp:ControlParameter ControlID="GVCidades" Name="idCidade" PropertyName="SelectedValue" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Type="String" Name="descricao"/>
                <asp:ControlParameter ControlID="GVCidades" Name="newparameter" PropertyName="SelectedValue" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Type="String" Name="descricao"/>
            </InsertParameters>
        </asp:SqlDataSource>
        
        <asp:GridView ID="GVCidades" runat="server" AutoGenerateColumns="False" DataKeyNames="idCidade" DataSourceID="SqlDsCidades" AllowPaging="True" AllowSorting="True" PageSize="5" OnRowDeleted="GVCidades_RowDeleted" OnRowDeleting="GVCidades_RowDeleting">
        <Columns>
            <asp:BoundField DataField="idCidade" HeaderText="idCidade" InsertVisible="False" ReadOnly="True" SortExpression="idCidade" />
            <asp:BoundField DataField="descricao" HeaderText="descricao" SortExpression="descricao"/>
            
        </Columns>
    </asp:GridView>
        <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
    
        <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="idCidade" DataSourceID="SqlDsCidades" DefaultMode="Insert">
            <InsertItemTemplate>
                Descrição:
                <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
    
    </div>
        <br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDsCidades">
            <HeaderTemplate>
                <table border="1">
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("idCidade") %></td>
                    <td><%# Eval("descricao") %></td>
                </tr>
            </ItemTemplate> 
            <FooterTemplate>
                </table>
            </FooterTemplate>     
                
            
        </asp:Repeater>

    </form>
    
    
</body>
</html>
