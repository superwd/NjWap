<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="My.aspx.cs" Inherits="NjWap.exchange.My" %>
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
            <div class="link_more"><a href="../In/List.aspx">[返回]</a>&nbsp;&nbsp;<asp:LinkButton ID="lbMyQuestion" CssClass="link_more" runat="server">我的提问</asp:LinkButton></div>
                <h3>基本信息修改</h3>
            </div>
            <div class="container_content">
                <div class="form_pane login_form_pane">
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
                    <div class="form_item login_form_item form_item_submit">
                         <asp:Button ID="btnUpdate" runat="server" Text="提交" OnClick="btnUpdate_Click" />
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