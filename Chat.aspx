<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>C H A T E R A P P</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no"/>
    <link rel="icon" href="img/icon.png" type="image/png" />
</head>

<body style="overflow:none;">
    <form id="form3" runat="server" >
        <div class="bar">
            <img src="img/icon.png" width="55px;" style="filter: invert(1);" alt="logo" />Xeql    - Cord <a style="font-size: 9px;">TM</a>&nbsp;<a class="tit"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></a>
            <asp:DropDownList CssClass="chatlable" OnLoad="DropDownList1_Load" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="room" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Rooms]"></asp:SqlDataSource>
            <span style="font-size: 30px; float: right; padding: 7px; padding-right: 10px; cursor: pointer" onclick="openNav()">&#9776;</span>
        </div>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <center>
              <div class="btn">
		<span></span>
		<div class="dot"></div>
</div>

                <a>USERS ON THE SRVER</a>
                
                 <div class="btn">
		<span></span>
		<div class="dot"></div>
</div>
                <br />
<div style="overflow:scroll;height:75%;">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                        <AlternatingItemTemplate>
                            <a><%# Eval("name") %></a>
                            <i><%# Eval("user_name") %></i>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <a><%# Eval("name") %></a>
                            <i><%# Eval("user_name") %></i>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <span>No USERS .</span>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <a><%# Eval("name") %></a>
                            <i><%# Eval("user_name") %></i>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <a><%# Eval("name") %></a>
                            <i><%# Eval("user_name") %></i>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                           <a><%# Eval("name") %></a>
                            <i><%# Eval("user_name") %></i>
                        </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [user_name] FROM [RegData]"></asp:SqlDataSource>
                <br />
</div>
                <div class="btn" style="position:static;top:90%;right:65px;background:#323035;">
    <span ><asp:Button ID="log" BackColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="c_logout_Click" runat="server" Text="L O G O U T"></asp:Button></span>
    <div class="dot"></div>
</div>
<br />
<br />
          
        </center>
        </div>
        <hr />
        <br />

            <div  style="overflow:scroll;height:770px;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="100" OnTick="Timer1_Tick"></asp:Timer>

                    <asp:PlaceHolder ID="PlaceHolder1"  runat="server"></asp:PlaceHolder>
                    <asp:PlaceHolder ID="PlaceHolder2"  runat="server"></asp:PlaceHolder>
<br />
<br />
<br />
<br />

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
<asp:Panel runat="server" DefaultButton="submit">
        <div class="chatform">
            <div class="upl">
                <asp:FileUpload ID="FileUpload1" CssClass="display" runat="server" Width="16px" />
            </div>
            &nbsp;
            <asp:TextBox ID="message" CssClass="message" Text="" placeholder="Chat here..." autocomplete="off" runat="server"></asp:TextBox>
            &nbsp;<asp:Button CssClass="snd" ID="submit" type="submit" UseSubmitBehavior="true" runat="server" BackColor="Transparent" BorderStyle="None" BorderWidth="0px" OnClick="submit_Click" />
        </div>
</asp:Panel>
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





































