<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

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
<a href="registration.aspx">
<div style="float: right;top: -47px;" class="btn">
		<span>S I G N - U P</span>
		<div class="dot"></div>
</div>
</a>
<br />
<br />
<br />
<br />
    <form ID="login_form" runat="server">
<center>

<h1 style="color: white;">L O G I N</h1>
<br />
<br />  
<asp:TextBox ID="user_name" CssClass="message" placeholder="U s e r n a m e" runat="server"></asp:TextBox>
<br />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="user_name" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
<br />
<asp:TextBox ID="pass" CssClass="message" TextMode="Password" placeholder="P a s s w o r d" runat="server"></asp:TextBox>
<br />
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="pass" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
<br />
<div class="btn">
    <span><asp:Button ID="login_submit" BackColor="Transparent" BorderStyle="None" ForeColor="White" runat="server" Text="G O" OnClick="login_submit_Click"></asp:Button></span>
    <div class="dot"></div>
</div>
</center>
</div>
    </form>

</body>
</html>