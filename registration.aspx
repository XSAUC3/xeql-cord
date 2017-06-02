<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>F A P A P P</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
	<link rel="icon" href="img/icon.png" type="image/png">
</head>
<body style="padding:20px;">
<div class="row columns"> 
<div style="color: white;font-family: arty; font-size: 200%;">
	<img src="img/icon.png" width="55px;" style="filter:invert(1);" alt="logo">Xeql    - Cord <a style="font-size: 9px;">TM</a><br>
</div>
<a href="login.aspx">
<div style="float: right;top: -47px;" class="btn">
		<span>S I G N - I N</span>
		<div class="dot"></div>
</div>
</a>

    <form ID="registration_form" runat="server">
<center>
    <br />
<h1 style="color: white;">R E G I S T E R</h1>
<br />  
<asp:TextBox ID="name" CssClass="message" placeholder="N a m e" runat="server"></asp:TextBox><br />
<asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" ControlToValidate="name" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
<br />
<asp:TextBox ID="user_name" CssClass="message"  placeholder="U s e r n a m e" runat="server"  ></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" ControlToValidate="user_name" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
<br />
<asp:TextBox ID="email" TextMode="Email"  CssClass="message"  placeholder="E m a i l" runat="server"></asp:TextBox>
<br />
    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" ControlToValidate="email" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
    <br />
<asp:TextBox ID="pass" CssClass="message" TextMode="Password" placeholder="P a s s w o r d" runat="server"></asp:TextBox>
<br />
    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" ControlToValidate="pass" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
    <br />
<asp:TextBox ID="conf_pass" CssClass="message" TextMode="Password" placeholder="C o n f - P a s s" runat="server"></asp:TextBox>
<br />
    <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" ControlToValidate="conf_pass" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
    <br />
<asp:CompareValidator Display="None" ID="CompareValidator1" runat="server" ControlToCompare="pass" ControlToValidate="conf_pass" ErrorMessage="CompareValidator"></asp:CompareValidator>
<div class="btn">
    <span><asp:Button ID="reg_submit" BackColor="Transparent" BorderStyle="None" ForeColor="White" runat="server" Text="S I G N U P" OnClick="reg_submit_Click"></asp:Button></span>
    <div class="dot"></div>
</div>
</center>
</form>
</div>
</body>
</html>