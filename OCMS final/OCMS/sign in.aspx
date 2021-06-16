<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign in.aspx.cs" Inherits="OCMS.sign_in" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    



    protected void Button1_Click(object sender, EventArgs e)
    {

        // Authenticating the user

        // 1- Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ocms.mdf;Integrated Security=True";

        if (DropDownList1.SelectedItem.Text == "Student")
        {




            // 2- Create Sql Select statement string
            string strSelect = "SELECT * FROM Student "
                + " WHERE st_id = '" + TextBox1.Text + "' AND "
                + " Password = '" + TextBox2.Text + "'";





            // 3- Create Sql command
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

            // 4- Create Sql Data Reader
            SqlDataReader reader;

            // 5- Open the databse
            conn.Open();

            // 6- Execute Sql command
            reader = cmdSelect.ExecuteReader();

            // 7- Check reader
            if (reader.Read())
            {

                string Fname = (string)reader.GetValue(0);
                string Lname = (string)reader.GetValue(1);
                string Email = (string)reader.GetValue(3);


                HttpCookie c2 = new HttpCookie("userInfo");
                c2.Values.Add("id", TextBox1.Text);
                c2.Values.Add("passw", TextBox2.Text);

                c2.Values.Add("Fn", Fname);
                c2.Values.Add("Ln", Lname);
                c2.Values.Add("email", Email);

                c2.Expires = DateTime.Now.AddDays(3);
                Response.Cookies.Add(c2);



                Response.Redirect("~/sthome.aspx");
            }

            else
                Label4.Text = "Invalid Username and/or Password, you may try again!!";

            // 8- Close the database
            conn.Close();
        }

        else
        {


            // 1- Create Connection Object
            SqlConnection conn1 = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ocms.mdf;Integrated Security=True";




            // 2- Create Sql Select statement string
            string strSelect1 = "SELECT * FROM Instructor "
                + " WHERE inst_id = '" + TextBox1.Text + "' AND "
                + " Password = '" + TextBox2.Text + "'";





            // 3- Create Sql command
            SqlCommand cmdSelect1 = new SqlCommand(strSelect1, conn);

            // 4- Create Sql Data Reader
            SqlDataReader reader1;

            // 5- Open the databse
            conn.Open();

            // 6- Execute Sql command
            reader1 = cmdSelect1.ExecuteReader();

            // 7- Check reader
            if (reader1.Read())
            {

                string Fname = (string)reader1.GetValue(0);
                string Lname = (string)reader1.GetValue(1);
                string Email = (string)reader1.GetValue(3);


                HttpCookie c2 = new HttpCookie("instInfo");
                c2.Values.Add("id", TextBox1.Text);
                c2.Values.Add("passw", TextBox2.Text);

                c2.Values.Add("Fn", Fname);
                c2.Values.Add("Ln", Lname);
                c2.Values.Add("email", Email);

                c2.Expires = DateTime.Now.AddDays(3);
                Response.Cookies.Add(c2);



                Response.Redirect("~/insthome.aspx");
            }

            else
                Label4.Text = "Invalid Username and/or Password, you may try again!!";

            // 8- Close the database
            conn.Close();
        }

    }


</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #bc6e64;
            height: 202px;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            width: 161px;
        }
        .auto-style4 {
            height: 26px;
            width: 161px;
        }
    </style>
</head>
<body bgcolor=#F4E7DE style="height: 200px">
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Text="Please, Enter your ID Number and Password to login in:" ForeColor="#BC6E64"></asp:Label>
            <br />
            <br />
            <table bgcolor=#F4E7DE align="center" class="auto-style1" style="background-color: #F4E7DE">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="ID Number:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Font-Names="Arial" Width="222px"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="177px">
                            <asp:ListItem Selected="True">Student</asp:ListItem>
                            <asp:ListItem>Instructor</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Password:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Font-Names="Arial" Width="222px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Font-Underline="False" ForeColor="#BC6E64" Text="Login" OnClick="Button1_Click" Width="89px" />
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" ForeColor="#BC6E64"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
