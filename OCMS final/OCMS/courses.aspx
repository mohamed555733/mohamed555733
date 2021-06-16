<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="courses.aspx.cs" Inherits="OCMS.WebForm3" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">

        protected void Button1_Click(object sender, EventArgs e)
        {

            // 1- Create Connection Object

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ocms.mdf;Integrated Security=True";


            // 2- Create Insert statement
            string strInsert = String.Format("INSERT INTO CourseStudent VALUES('{0}', '{1}')", TextBox1.Text, TextBox2.Text);


            // 3- Create SQL command
            SqlCommand cmdInsert = new SqlCommand(strInsert, conn);
     

         


            // 4- Open the database
            conn.Open();

            // 5- Execute SQL Command
            cmdInsert.ExecuteNonQuery();

            // 6- Close the database
            conn.Close();

           

            Label3.Text = "Course added succesfuly";
         

            
        }
        </script>



    <style type="text/css">
        .auto-style22 {
            width: 100%;
            
        }
        .auto-style23 {
            width: 211px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style22">
        <tr>
            <td class="auto-style23">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Text="Course ID:" ForeColor="#BC6E64"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="Student ID:" ForeColor="#BC6E64"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">
                <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Arial" OnClick="Button1_Click" Text="Add course" ForeColor="#BC6E64" />
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" ForeColor="#BC6E64"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="c_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None">
    <AlternatingRowStyle BackColor="PaleGoldenrod" />
    <Columns>
        <asp:BoundField DataField="c_id" HeaderText="c_id" ReadOnly="True" SortExpression="c_id" />
        <asp:BoundField DataField="c_name" HeaderText="c_name" SortExpression="c_name" />
    </Columns>
    <FooterStyle BackColor="Tan" />
    <HeaderStyle BackColor="Tan" Font-Bold="True" />
    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
    <SortedAscendingCellStyle BackColor="#FAFAE7" />
    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
    <SortedDescendingCellStyle BackColor="#E1DB9C" />
    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [c_id], [c_name] FROM [Course]"></asp:SqlDataSource>
</asp:Content>
