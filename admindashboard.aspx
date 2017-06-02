<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admindashboard.aspx.cs" Inherits="admindashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>C H A T E R A P P</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
    <link rel="icon" href="img/icon.png" type="image/png" />
</head>

<body>
    <form id="form3" runat="server">
        <div class="bar">
            <img src="img/icon.png" width="55px;" style="filter: invert(1);" alt="logo" />Xeql    - Cord <a style="font-size: 9px;">TM</a>&nbsp;
            <asp:DropDownList CssClass="chatlable" OnLoad="DropDownList1_TextChanged" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="room" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Rooms]"></asp:SqlDataSource>
            <span style="font-size: 30px; float: right; padding: 7px; padding-right: 10px; cursor: pointer" onclick="openNav()">&#9776;</span>
        </div>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <center>
                <a href="addrooms.aspx" style="padding: 5px;font-size:12px;"><div class="btn">
		<span>+ ADD Rooms</span>
		<div class="dot"></div>
</div></a>
                <br />
<asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource2">
    <AlternatingItemTemplate>
        <li style="">
            <a><%# Eval("name") %></a>
            <i><%# Eval("user_name") %></i>
            <asp:Button ID="DeleteButton" runat="server" CssClass="logout" CommandName="Delete" Text="Delete" />
        </li>
    </AlternatingItemTemplate>
    <EmptyDataTemplate>
       <a> No USERS ON THE SERVER </a>
    </EmptyDataTemplate>
    <ItemSeparatorTemplate>
<br />
    </ItemSeparatorTemplate>
    <ItemTemplate>
        <li style="">
            <a><%# Eval("name") %></a>
            <a><i><%# Eval("user_name") %></i></a>
            <asp:Button ID="DeleteButton" runat="server" CssClass="smpbtn" CommandName="Delete" Text="Delete" />
        </li>
    </ItemTemplate>
    <LayoutTemplate>
        <ul id="itemPlaceholderContainer" runat="server" style="">
            <li runat="server" id="itemPlaceholder" />
        </ul>
        <div style="">
        </div>
    </LayoutTemplate>
    <SelectedItemTemplate>
        <li style="">
            <a><%# Eval("name") %></a>
            <a><i><%# Eval("user_name") %></i></a>
            <asp:Button ID="DeleteButton" runat="server" CssClass="smpbtn" CommandName="Delete" Text="Delete" />
        </li>
    </SelectedItemTemplate>
                </asp:ListView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [RegData] WHERE [Id] = @Id" InsertCommand="INSERT INTO [RegData] ([name], [user_name], [email]) VALUES (@name, @user_name, @email)" SelectCommand="SELECT [Id], [name], [user_name], [email] FROM [RegData]" UpdateCommand="UPDATE [RegData] SET [name] = @name, [user_name] = @user_name, [email] = @email WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="user_name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="user_name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <div class="btn">
    <span><asp:Button ID="admin_logout" runat="server" BackColor="Transparent" BorderStyle="None" ForeColor="White" CssClass="logout" type="button" Text="L O G O U T" OnClick="admin_logout_Click" ></asp:Button></span>
    <div class="dot"></div>
</div>
          
        </center>
        </div>
        <hr />
        <br />

            <div  style="overflow:scroll;height:770px;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                    <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
        </div>

        <div class="chatform">
            <div class="upl">
                <asp:FileUpload ID="FileUpload1" CssClass="display" runat="server" Width="16px" />
            </div>
            &nbsp;
            <asp:TextBox ID="message" CssClass="message" Text="" placeholder="Chat here..." autocomplete="off" runat="server"></asp:TextBox>
            &nbsp;<asp:Button CssClass="snd" ID="submit" type="submit" UseSubmitBehavior="true" runat="server" BackColor="Transparent" BorderStyle="None" BorderWidth="0px" OnClick="submit_Click" />
        </div>
    </form>
</body>
<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        //document.getElementById("main").style.marginRight = "250px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        //document.getElementById("main").style.marginRight= "0";
    }
</script>
</html>
