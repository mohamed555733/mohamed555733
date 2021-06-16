<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign up.aspx.cs" Inherits="OCMS.sign_up" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        // 1- Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ocms.mdf;Integrated Security=True";
        
        // 2- Create SQL Insert statement string

        string strInsert = String.Format("INSERT INTO Student VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}')", TextBox1.Text, TextBox2.Text, RadioButtonList1.SelectedValue, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text);
      
       
        // 3- Create SQL Command
        SqlCommand cmdInsert = new SqlCommand(strInsert, conn);


        try
        {

         


            // 4- Open the database
            conn.Open();

            // 5- Execute SQL Command
            cmdInsert.ExecuteNonQuery();

            // 6- Close the database
            conn.Close();

            // Save user profile picture
             if (fupPic.HasFile)
                fupPic.SaveAs(Server.MapPath("userPic") + "\\" + TextBox4.Text + ".jpg");

             HttpCookie c1 = new HttpCookie("userInfo");
            c1.Values.Add("id", TextBox4.Text);
            c1.Values.Add("passw", TextBox6.Text);

             c1.Values.Add("Fn", TextBox1.Text);
             c1.Values.Add("Ln", TextBox2.Text);
             c1.Values.Add("Em", TextBox3.Text);

            c1.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(c1);

            Label11.Text = "Welcome " + TextBox1.Text + ", Your Account has been Successfully Created.";
        }

        catch (SqlException err)
        {
            if (err.Number == 2627)
                Label11.Text = "The ID Number " + TextBox4.Text + " already used, Please choose another !";
            else
                Label11.Text = "Database error, Please try later !!";
        }

        catch
        {
            Label11.Text = "The system is not available at the moment, you may try later !!";
        }




    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #F4E7DE;
        }
        .auto-style2 {
            width: 221px;
        }
        .auto-style3 {
            width: 391px;
        }
        .auto-style4 {
            width: 221px;
            height: 28px;
        }
        .auto-style5 {
            width: 391px;
            height: 28px;
        }
        .auto-style6 {
            height: 28px;
        }
        .auto-style7 {
            width: 228px;
        }
        .auto-style8 {
            width: 228px;
            height: 28px;
        }
        .auto-style9 {
            width: 221px;
            height: 29px;
        }
        .auto-style10 {
            width: 391px;
            height: 29px;
        }
        .auto-style11 {
            width: 228px;
            height: 29px;
        }
        .auto-style12 {
            height: 29px;
        }
        .auto-style13 {
            width: 221px;
            height: 26px;
        }
        .auto-style14 {
            width: 391px;
            height: 26px;
        }
        .auto-style15 {
            width: 228px;
            height: 26px;
        }
        .auto-style16 {
            height: 26px;
        }
    </style>
</head>
<body bgcolor=#F4E7DE>
    <form id="form1" runat="server">
        <div style="background-color: #F4E7DE">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="#BC6E64" Text="Please, Fill In All Fields To Sign Up, Then Click Submit."></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="First Name:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server" Font-Names="Arial" Width="222px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Invalid first name format." Font-Size="Medium" ForeColor="Red" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Last Name:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server" Font-Names="Arial" Width="222px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Invalid last name format." Font-Size="Medium" ForeColor="Red" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Sex:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="190px">
                            <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Email Address:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server" Font-Names="Arial" Width="222px" ></asp:TextBox>
                        <font color="#000022" face="aria" l="" size="-1">Example@samba.edu.eg</font>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Invalid email address format." Font-Size="Medium" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="ID Number:"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:TextBox ID="TextBox4" runat="server" Font-Names="Arial" Width="222px" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                    </td>
                    <td class="auto-style11">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style12">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Invalid id number format." Font-Size="Medium" ForeColor="Red" ValidationExpression="[2][0][1]\d{5}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Address:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox5" runat="server" Font-Names="Arial" Width="222px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Password:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox6" runat="server" Font-Names="Arial" Width="222px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style6">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="Should be between 8 and 16 characters." Font-Size="Medium" ForeColor="Red" ValidationExpression="\w{8,16}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Retype Password:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox7" runat="server" Font-Names="Arial" Width="222px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" ControlToValidate="TextBox7" ErrorMessage="Not matching !" Font-Size="Medium" ForeColor="#CC0000"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Upload Profile Picture:"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:FileUpload ID="fupPic" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#BC6E64" Width="227px" />
                    </td>
                    <td class="auto-style11"></td>
                    <td class="auto-style12"></td>
                </tr>
                <tr>
                    <td class="auto-style13"></td>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Font-Underline="False" ForeColor="#BC6E64" Text="Submit" OnClick="Button1_Click" />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Height="35px" Width="522px"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
