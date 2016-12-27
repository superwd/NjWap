<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebControlHeader.ascx.cs" Inherits="NjWap.WebControlHeader" %>
 <asp:Repeater ID="rptHead" runat="server">
      <ItemTemplate>
          <td><a href='/html/List.aspx?CID=<%#Eval("CATEGORY_ID")%>'><%#Eval("Title")%></a></td>
          <%# ((Container.ItemIndex + 1)%4==0 && Container.ItemIndex+1!=100)? "</tr><tr>":""%>
          </ItemTemplate>     
</asp:Repeater>
