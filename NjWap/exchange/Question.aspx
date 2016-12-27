<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="NjWap.exchange.Question" %>
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
         <form id="form1" runat="server">
        <header class="index_header">
            <!-- <i class="ui-icon-return" onclick="history.back()"></i> -->
            <!-- <h1>首页</h1> -->
            <!-- <button class="ui-btn">回首页</button> -->
            <img src="../img/logo.jpg" alt="">
        </header>
        <footer class="ui-footer ui-footer-btn">
           <uc1:WebControlFooter ID="Footer" runat="server" />
        </footer>       
        <section class="container">
            <div class="container_title clearfix">
                 <div class="link_more"><asp:Label runat="server" ID="lblSf"></asp:Label>&nbsp;<a href="../In/List.aspx">[返回]</a>&nbsp;<a href="../In/Logout.aspx">[注销]</a></div>
                <h3>新问题提问</h3>
            </div>
            <div class="container_content">
                <div class="form_pane login_form_pane">
                    <div class="form_item login_form_item">
                        <p>问题标题<span>*</span></p>
                        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>      
                    </div>
                    <div class="form_item login_form_item">
                        <p>产业<span>*</span></p>
                        <asp:DropDownList ID="drpCy" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form_item login_form_item">
                        <p>地区<span>*</span></p>
                        <asp:TextBox ID="txtAddr" runat="server" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form_item login_form_item">
                        <p>问题说明<span>*</span></p>
                        <asp:TextBox ID="txtDesp" runat="server" TextMode="MultiLine" Columns="5"></asp:TextBox>
                    </div>
                    <div class="form_item form_item_submit login_form_item">
                       <asp:Button ID="btnSub" runat="server" Text="提交问题" OnClick="btnSub_Click" />
                    </div>
                </div>
            </div>
        </section>

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