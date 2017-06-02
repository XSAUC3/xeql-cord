<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addrooms.aspx.cs" Inherits="addrooms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>F A P A P P</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
	<link rel="icon" href="img/icon.png" type="image/png" />
</head>
<body style="padding:20px;">
<div class="row columns"> 

<div style="color: white;font-family: arty; font-size: 200%;">
	<img src="img/icon.png" width="55px;" style="filter:invert(1);" alt="logo">Xeql    - Cord <a style="font-size: 9px;">TM</a><br />
</div>
<br />
<br />
<br />
<br />
    <form id="form1" runat="server">
    <div>
        <center>
    <h1 style="color: white;">Chat Room Entry</h1>
    <h2 style="color: white;">Enter The New Chat Room Name Here</h2>
    <br />
    <br />
        <asp:TextBox ID="TextBox1" runat="server" placeholder="NEW CHAT ROOM NAME.." CssClass="message" Width="350px"></asp:TextBox>
    <br />
    <br />
            <div class="btn">
    <span><asp:Button ID="Button1" runat="server" Text="S U B M I T" BackColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button1_Click" /> </span>
    <div class="dot"></div>
</div>
        
    </div>
        </center>
    </form>
</body>
</html>
