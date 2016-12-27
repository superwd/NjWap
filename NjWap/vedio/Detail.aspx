<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="NjWap.vedio.Detail" %>
<%@ Register Src="~/WebControlFooter.ascx" TagName="WebControlFooter" TagPrefix="uc1" %>
<%@ Register Src="~/WebControlHeader.ascx" TagName="WebControlHeader" TagPrefix="uc2" %>
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

        <div class="navigation">
            <table cellspacing="1" cellpadding="0" align="center">
                <tbody>
                  <tr>
                    <uc2:WebControlHeader ID="WebControlHeader1" runat="server" />   
                  </tr>
                                 
                </tbody>
              </table>
        </div>

        <section class="container">
            <div class="container_title clearfix">
                <!-- <a class="link_more" href="">更多..</a> -->
                <!-- <h3>科技资讯</h3> -->
            </div>
            <div class="container_content">
                <div class="details">
                    <div id="location"><a href="" title="首页" class="CurrChnlCls">首页</a>&nbsp;&gt;&nbsp;<a href="List.aspx" title="视频点播" class="CurrChnlCls">视频点播</a></div>
                    <h1><asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
                    <p class="public_time"><asp:Label ID="lblDate" runat="server"></asp:Label></p>
                    <div class="details_content video_detail_content"  style="padding-top:0;padding-bottom:60px;">
                        <video width="100%" height="260" controls autoplay>
                        <asp:Literal ID="ltVedio" runat="server"></asp:Literal>
                        <embed width="320" height="240" src="movie.swf">
                         </object>
                        </video>
                    </div>
                </div>
                
            </div>
        </section>

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