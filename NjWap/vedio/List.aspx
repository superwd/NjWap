<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="NjWap.vedio.List" %>
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
                <!-- <a class="link_more" href="">更多..</a> -->
                <h3>视频点播</h3>
            </div>
            <div class="container_content">
                <ul class="textlist video_list">
                     <asp:Repeater ID="rptList" runat="server">
             <ItemTemplate> 
                  <li class="clearfix">
                        <img src='<%#ConfigurationManager.AppSettings["Url"] + "/NJ_Sttrain/"+Eval("IMGURL")%>' class="left first_img"></img>
                        <div class="right first_content">
                            <h3><a href='Detail.aspx?Id=<%#Eval("ID")%>'><%#Eval("TITLE")%></a></h3>
                            <p><%#Eval("Desp")%></p>
                        </div>    
                      </li>           
            </ItemTemplate>
         </asp:Repeater>
                     
                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Center" CssClass="paging" 
            showcustominfosection="Left" width="100%" CustomInfoHTML="第%CurrentPageIndex%页，共%PageCount%页" PageIndexBoxStyle="width:19px" OnPageChanging="AspNetPager1_PageChanging" ShowPageIndexBox="Never"></webdiyer:AspNetPager>
                </ul>
                
            </div>
        </section>

        <script src="../lib/zepto.min.js"></script>
        <script src="../js/frozen.js"></script>
        </form>
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
