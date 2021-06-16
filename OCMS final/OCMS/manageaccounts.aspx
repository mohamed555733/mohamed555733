<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="manageaccounts.aspx.cs" Inherits="OCMS.WebForm1" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string st_id = "";
            if (Request.Cookies["userInfo"] != null)
                st_id = Request.Cookies["userInfo"].Values["id"];

            ViewState["U"] = st_id;

            imgUserPic.ImageUrl = "~/userPic/" + st_id + ".jpg";

            // 1- Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ocms.mdf;Integrated Security=True";


            // Create SQL Select Query
            string strSelect = "SELECT * FROM Student "
                + " WHERE st_id = '" + st_id + "'";

            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

            SqlDataReader reader;

            conn.Open();
            reader = cmdSelect.ExecuteReader();

            if (reader.Read())
            {
                TextBox1.Text = (string)reader.GetValue(0);
                TextBox2.Text = (string)reader.GetValue(1);
                RadioButtonList1.SelectedValue = (string)reader.GetValue(2);
                
                    
                TextBox4.Text = (string)reader.GetValue(4);
                TextBox5.Text = (string)reader.GetValue(5);
                TextBox6.Text = (string)reader.GetValue(6);
            }
        }
    }

        protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Enabled = true;
        TextBox2.Enabled = true;
        RadioButtonList1.Enabled = true;
        TextBox3.Enabled = true;
        TextBox4.Enabled = true;
        TextBox5.Enabled = true;
        TextBox5.Enabled = true;
        fupPic.Enabled = true;

        Button2.Visible = true;
    }

        protected void btnSave_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ocms.mdf;Integrated Security=True";


        string st_id = "";
        st_id = (string)ViewState["U"];

        string strUpdate = "Update Student"
            + " SET Fname = '" + TextBox1.Text + "', "
            + " Lname = '" + TextBox2.Text + "', "
            + " Sex = '" + RadioButtonList1.SelectedValue + "', "
            + " Email = '" + TextBox3.Text + "', "
            + " Address = '" + TextBox5.Text + "', "
            + " Password = '" + TextBox6.Text + "' "
            + " WHERE st_id = '" + TextBox4  + "'";

        SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);

        conn.Open();
        cmdUpdate.ExecuteNonQuery();

        if (fupPic.HasFile)
            fupPic.SaveAs(Server.MapPath("userPic") + "\\" + TextBox4.Text + ".jpg");

        conn.Close();

        lblMsg.Text = "Your Account Has Been Successfully Updated!!";
              
        
    }

</script>
     <style type="text/css">
        .style13
        {
            width: 122px;
        }
        .style14
        {
            width: 196px;
        }
         .auto-style22 {
             width: 185px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <p>
        <br />
        <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" 
            Font-Size="Medium" ForeColor="#000066" Text="Your Account:"></asp:Label>
    </p>
    <table class="style7">
        <tr>
            <td class="auto-style22">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="First Name:"></asp:Label>
            </td>
            <td class="style14">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Last Name:"></asp:Label>
            </td>
            <td class="style14">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Sex:"></asp:Label>
            </td>
            <td class="style14">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="190px">
                            <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:RadioButtonList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Email Address:"></asp:Label>
            </td>
            <td class="style14">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="ID Number:"></asp:Label>
            </td>
            <td class="style14">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Address:"></asp:Label>
            </td>
            <td class="style14">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Password:"></asp:Label>
            </td>
            <td class="style14">
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#BC6E64" Text="Upload Profile Picture:"></asp:Label>
            </td>
            <td class="style14">
                        <asp:FileUpload ID="fupPic" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#BC6E64" Width="227px" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td rowspan="5">
                <asp:Image ID="imgUserPic" runat="server" Height="100px" Width="100px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                </td>
            <td class="style14">
                </td>
            <td>
                </td>
        </tr>
        <tr>
            <td class="auto-style22">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                </td>
            <td class="style14">
                </td>
            <td>
                </td>
        </tr>
        <tr>
            <td class="auto-style22">
                        <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Font-Underline="False" ForeColor="#BC6E64" Text="Edit" OnClick="Button1_Click" />
            </td>
            <td class="style14">
                        <asp:Button ID="Button2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Font-Underline="False" ForeColor="#BC6E64" Text="Save" OnClick="Button1_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <p>
        <asp:Label ID="lblMsg" runat="server" Font-Names="Monotype Corsiva" 
            Font-Size="X-Large" ForeColor="#CC6600"></asp:Label>
    </p>
</asp:Content>
