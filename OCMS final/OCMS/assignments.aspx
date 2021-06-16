<%@ Page Title="" Language="C#" MasterPageFile="~/instructor.Master" AutoEventWireup="true" CodeBehind="assignments.aspx.cs" Inherits="OCMS.WebForm5" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script runat="server">

        protected void Btn_Click(object sender, EventArgs e)
        {


            // 1- Create Connection Object

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ocms.mdf;Integrated Security=True";


            // 2- Create Insert statement
            string strInsert = String.Format("INSERT INTO Assignment VALUES('{0}', '{1}', '{2}', '{3}')", TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text);


            // 3- Create SQL command
            SqlCommand cmdInsert = new SqlCommand(strInsert, conn);
     

         


            // 4- Open the database
            conn.Open();

            // 5- Execute SQL Command
            cmdInsert.ExecuteNonQuery();

            // 6- Close the database
            conn.Close();

          

            lblm.Text = "Assignment added succesfuly";
         

            
        }
        </script>

    <style type="text/css">
        .auto-style22 {
            width: 100%;
            
        }
        .auto-style23 {
            width: 166px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style22">
        <tr>
            <td class="auto-style23">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#BC6E64" Text="Instructor id:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="195px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#BC6E64" Text="Course id:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="195px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#BC6E64" Text="From:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Width="195px" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#BC6E64" Text="To:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Width="195px" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">
                <asp:Button ID="Btn" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Submit" OnClick="Btn_Click" />
            </td>
            <td>
                <asp:Label ID="lblm" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#BC6E64"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
