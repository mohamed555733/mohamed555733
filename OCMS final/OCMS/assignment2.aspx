<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="assignment2.aspx.cs" Inherits="OCMS.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">

        protected void Btn_Click(object sender, EventArgs e)
        {

            
            if (FileUpload1.HasFile)
                FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/stAssignments/" + FileUpload1.FileName.ToString());
           

            lblm1.Text = "File submitted succesfuly";
         

            
        }
        </script>
    <style type="text/css">
        .auto-style22 {
            width: 100%;
         
        }
        .auto-style23 {
            width: 168px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="c_id" DataValueField="c_id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [c_id] FROM [Assignment]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </p>
    <p>
                <table class="auto-style22">
                    <tr>
                        <td class="auto-style23">
                <asp:Button ID="Btn1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Submit" OnClick="Btn_Click" />
                        </td>
                        <td>
                <asp:Label ID="lblm1" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#BC6E64"></asp:Label>
                        </td>
                    </tr>
                </table>
            </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource1" GridLines="None">
            <Columns>
                <asp:BoundField DataField="c_id" HeaderText="c_id" SortExpression="c_id" />
                <asp:BoundField DataField="Fdate" HeaderText="Fdate" SortExpression="Fdate" />
                <asp:BoundField DataField="Tdate" HeaderText="Tdate" SortExpression="Tdate" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [c_id], [Fdate], [Tdate] FROM [Assignment]"></asp:SqlDataSource>
    </p>
</asp:Content>
