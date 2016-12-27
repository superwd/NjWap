<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registe.aspx.cs" Inherits="NjWap.In.Registe" %>
<%@ Register Src="~/WebControlFooter.ascx" TagName="WebControlFooter" TagPrefix="uc1" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>山东农业科技网</title>
        <link rel="stylesheet" href="../css/frozen.css">
        <link rel="stylesheet" href="css.css">
    </head>
    <body ontouchstart>
        <header class="index_header">
            <!-- <i class="ui-icon-return" onclick="history.back()"></i> -->
            <!-- <h1>首页</h1> -->
            <!-- <button class="ui-btn">回首页</button> -->
            <img src="../img/logo.jpg" alt="">
        </header>
        <footer class="ui-footer ui-footer-btn">
           <uc1:WebControlFooter ID="Footer" runat="server" />
        </footer>
         <form id="form1" runat="server">
    <div>
        <section class="container">
            <div class="container_title clearfix">
                <h3>注册</h3>
            </div>
            <div class="container_content">
                <div class="form_pane login_form_pane">
                    <div class="form_item login_form_item">
                        <p>用户名</p>
                        <asp:TextBox ID="txtUName" runat="server"></asp:TextBox>
                    </div>
                    <div class="form_item login_form_item">
                        <p>密码</p>
                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                     <div class="form_item login_form_item">
                        <p>确认密码</p>
                        <asp:TextBox ID="txtPwd2" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                     <div class="form_item login_form_item">
                        <p>手机</p>
                        <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                    </div>
                    <div class="form_item login_form_item">
                        <p>邮箱</p>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </div>
                     <div class="form_item login_form_item">
                        <p>姓名</p>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </div>
                    <div class="form_item login_form_item">
                        <p>性别</p>
                       <asp:DropDownList ID="drpSex" runat="server">
                           <asp:ListItem Value="0">男</asp:ListItem>
                           <asp:ListItem Value="1">女</asp:ListItem>
                       </asp:DropDownList>
                    </div>
                     <div class="form_item login_form_item">
                        <p>身份证号</p>
                        <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                    </div>
                    <div >
                        <p>地区</p>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                         <ContentTemplate>
                        <asp:DropDownList ID="drpPro" runat="server" Width="30%" AutoPostBack="True" OnSelectedIndexChanged="drpPro_SelectedIndexChanged">                           
                       </asp:DropDownList>
                        <asp:DropDownList ID="drpCity" runat="server" Width="33%" AutoPostBack="True" OnSelectedIndexChanged="drpCity_SelectedIndexChanged">                           
                       </asp:DropDownList>
                        <asp:DropDownList ID="drpX" runat="server" Width="33%">                           
                       </asp:DropDownList>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <br />
                    <div class="form_item login_form_item">
                        <p>详细地址</p>
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    </div>
                    <div class="form_item login_form_item">
                        <p>产业</p>
                        <asp:CheckBoxList ID="chkCy" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList>
                    </div>
                     <div class="form_item login_form_item">
                        <p>身份</p>
                       <asp:DropDownList ID="drpSf" runat="server" >                          
                       </asp:DropDownList>
                    </div>
                    <div class="form_item login_form_item">
                        <p>生产经营规模</p>
                        <asp:TextBox ID="txtGm" runat="server"></asp:TextBox>
                    </div>
                    <div class="form_item login_form_item form_item_submit">
                         <asp:Button ID="btnReg" runat="server" Text="注册" OnClick="btnReg_Click" />
                    </div>
                </div>
            </div>
        </section>
       
    </div>
    </form>
        
        
        







<script src="../lib/zepto.min.js"></script>
        <script src="../js/frozen.js"></script>

            <script>
                (function (){

                    $('#ui_tab .ui_tab_nav li').click(function(){
                        $(this).addClass('current').siblings().removeClass('current');
                        $('#ui_tab .ui_tab_content .ui_tab_content_item').eq($(this).index()).show().siblings().hide();
                        return false;
                    });
                    $('#ui_tab2 .ui_tab_nav li').click(function(){
                        $(this).addClass('current').siblings().removeClass('current');
                        $('#ui_tab2 .ui_tab_content .ui_tab_content_item').eq($(this).index()).show().siblings().hide();
                        return false;
                    });
                    $('#ui_tab3 .ui_tab_nav li').click(function(){
                        $(this).addClass('current').siblings().removeClass('current');
                        $('#ui_tab3 .ui_tab_content .ui_tab_content_item').eq($(this).index()).show().siblings().hide();
                        return false;
                    });

                    var slider = new fz.Scroll('.ui-slider', {
                        role: 'slider',
                        indicator: true,
                        autoplay: true,
                        interval: 3000
                    });

                    slider.on('beforeScrollStart', function(fromIndex, toIndex) {
                        console.log(fromIndex,toIndex)
                    });

                    slider.on('scrollEnd', function(cruPage) {
                        console.log(cruPage)
                    });


                })();
        </script>
    </body>
</html>