<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="NjWap.In.List" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
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
                 <a class="link_more" href="/exchange/Question.aspx">发起提问</a><div class="link_more"><asp:Label runat="server" ID="lblSf"></asp:Label></div>
                <h3>互动交流</h3>
            </div>
            <div class="container_content">
                <ul class="textlist pb60">
                     <asp:Repeater ID="rptList" runat="server">
                 <ItemTemplate>
                     <li><a href='/exchange/Answer.aspx?ID=<%#Eval("ID")%>' ><%#Eval("Title").ToString().Length > 25 ? Eval("title").ToString().Substring(0, 25)+"..." : Eval("Title")%></a></li>
                    
                 </ItemTemplate>

        </asp:Repeater>
                      
                       <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Center" CssClass="paging" 
            showcustominfosection="Left" width="100%" CustomInfoHTML="第%CurrentPageIndex%页，共%PageCount%页" PageIndexBoxStyle="width:19px" OnPageChanging="AspNetPager1_PageChanging" ShowPageIndexBox="Never"></webdiyer:AspNetPager>
                </ul>
                
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
