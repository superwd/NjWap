<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="NjWap.html.Detail" %>
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

        <form id="form1" runat="server">
        <div class="navigation">
            <table cellspacing="1" cellpadding="0" align="center">
                <tbody>
                  <tr>
                            <uc2:WebControlHeader ID="WebControlHeader1" runat="server" />
                    
                  </tr>
                  <%--<tr>
                  <td><a href="" target="_blank">信息公开</a></td>
                    <td><a href="" target="_blank">互动交流</a></td>
                    <td><a href="" target="_blank">科技创新</a></td>
                    <td><a href="" target="_blank">技术推广</a></td>
                  </tr>
                  <tr>
                  <td><a href="" target="_blank">教育培训</a></td>
                    <td><a href="" target="_blank">科协执法</a></td>
                    <td><a href="" target="_blank">专家顾问团</a></td>                    
                    <td></td>                    
                  </tr>         --%>       
                </tbody>
              </table>
        </div>
        
        <section class="container">
            <div class="container_title clearfix">
                        
                <!-- <a class="link_more" href="">更多..</a> -->
                 <h3><asp:Label ID="lblName" runat="server" Text=""></asp:Label></h3> 
            </div>
            <div class="container_content">
                <div class="details">
                    <asp:Literal ID="ltCon" runat="server"></asp:Literal>
                    <%--<div id="location"><a href="../../" title="首页" class="CurrChnlCls">首页</a>&nbsp;&gt;&nbsp;<a href="../" title="科技资讯" class="CurrChnlCls">科技资讯</a></div>
                    <h1>这台园艺多功能机创新突破三大关键技术</h1>
                    <p class="public_time">2016-01-01</p>
                    <div class="details_content">
                        <p>近日，我国首台园艺固肥施用、残秧处理多功能机正式亮相江苏省高效设施农业机械化现场会。该机由南京农机化研究所生物质转化利用装备创新团队最新研发。</p>
                        <p>近日，我国首台园艺固肥施用、残秧处理多功能机正式亮相江苏省高效设施农业机械化现场会。该机由南京农机化研究所生物质转化利用装备创新团队最新研发。</p>
                        <p>近日，我国首台园艺固肥施用、残秧处理多功能机正式亮相江苏省高效设施农业机械化现场会。该机由南京农机化研究所生物质转化利用装备创新团队最新研发。</p>
                        <p>近日，我国首台园艺固肥施用、残秧处理多功能机正式亮相江苏省高效设施农业机械化现场会。该机由南京农机化研究所生物质转化利用装备创新团队最新研发。</p>
                        <p>近日，我国首台园艺固肥施用、残秧处理多功能机正式亮相江苏省高效设施农业机械化现场会。该机由南京农机化研究所生物质转化利用装备创新团队最新研发。</p>
                    </div>--%>
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
