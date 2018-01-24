﻿<%@ Page Title="Your Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="RGN.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <br />
        <br />
        <br />
    
        <div id="ShoppingCartTitle" runat="server" class="ContentHead text-center">
            <h1 class="text-left">Shopping Cart</h1> 
        </div>
            <asp:Button ID="UpdateBtn" runat="server" Text="Update Cart" OnClick="UpdateBtn_Click" class="btn btn-primary btn-sm " style="float:right;margin-bottom:20px;"/>
            <br />  
        <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
            ItemType="RGN.Models.CartItem" SelectMethod="GetShoppingCartItems" 
            CssClass="table table-striped table-bordered" >   
            <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" />        
            <asp:BoundField DataField="Product.ProductName" HeaderText="Name" />        
            <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}"/>     
            <asp:TemplateField   HeaderText="Quantity">            
                    <ItemTemplate>
                        <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"></asp:TextBox> 
                    </ItemTemplate>        
            </asp:TemplateField>    
            <asp:TemplateField HeaderText="Item Total">            
                    <ItemTemplate>
                        <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>
                    </ItemTemplate>        
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Remove Item">            
                    <ItemTemplate>
                        <asp:CheckBox id="Remove" runat="server"></asp:CheckBox>
                    </ItemTemplate>        
            </asp:TemplateField>    
            </Columns>    
        </asp:GridView>
        <div>
            <br />
            <p></p>
            <h3>
                <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
                <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
            </h3> 
        </div>
        <br />
        <table> 
        <tr>
          <td>
        
          </td>
          <td>
            <!--Checkout Placeholder -->
          </td>
        </tr>
        </table>
    </div>
</asp:Content>