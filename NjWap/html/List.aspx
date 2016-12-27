 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="NjWap.html.List" %>
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
        <style>

        </style>
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
                   <%-- <td><a href="" class="current">网站首页</a></td>
                    <td><a href="" target="_blank">科技资讯</a></td>
                    <td><a href="" target="_blank">通知公告</a></td>
                    <td><a href="" target="_blank">制度办法</a></td>--%>  
                   <uc2:WebControlHeader ID="WebControlHeader1" runat="server" />                 
                  </tr>
                 <%-- <tr>
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
                  </tr>      --%>          
                </tbody>
              </table>
        </div>

        <section class="container">
            <div class="container_title clearfix">
                <!-- <a class="link_more" href="">更多..</a> -->
                <h3>
                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label></h3>
            </div>
            <div class="container_content">
                <ul class="textlist pb60">
                    <li class="first clearfix">
                        <%--<img src="../img/kjzx.jpg" class="left first_img"></img>
                        <div class="right first_content">
                            <h3>这台园艺多功能机创新突破三大关键技术</h3>
                            <p>近日，我国首台园艺固肥施用、残秧处理多功能机正，式亮相江苏省高效设施农业机械化现场会。该机由南京农机化研...</p>
                        </div> --%>
                            <asp:Literal ID="ltTop" runat="server"></asp:Literal>
                      </li>
                      <%--<asp:Literal ID="ltHead" runat="server"></asp:Literal>--%>
                      <%--<li class="first">
                        <a href="#"><img src="../img/kjzx.jpg"></a>
                        <a href="#"><b></b></a>
                        <b>
                            <a href="" target="_blank" title="这台园艺多功能机创新突破三大关键技术">这台园艺多功能机创新突破三大关键技术</a>
                        </b>
                        <span class="InfoContent">
                            <br>
                        　　近日，我国首台园艺固肥施用、残秧处理多功能机正式亮相江苏省高效设施农业机械化现场会。该机由南京农机化研究所生物质转化利用装备创新团队最新研发，...
                        </span>
                        </li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>--%>
                    <asp:Repeater ID="rptList" runat="server">
                       <ItemTemplate> 
                            <li><a href='Detail.aspx?ConId=<%#Eval("CONTENT_ID") %>'  title='<%#Eval("Title") %>'><%#Eval("Title").ToString().Length > 25 ? Eval("title").ToString().Substring(0, 25)+"..." : Eval("Title")%></a></li>
                       </ItemTemplate>
                    </asp:Repeater>

                     <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Center" CssClass="paging" 
            showcustominfosection="Left" width="100%" CustomInfoHTML="第%CurrentPageIndex%页，共%PageCount%页" PageIndexBoxStyle="width:19px" OnPageChanging="AspNetPager1_PageChanging" ShowPageIndexBox="Never"></webdiyer:AspNetPager>
                  
                         </ul>
                    
            </div>
        </section>

        <script src="../lib/zepto.min.js"></script>
        <script src="../js/frozen.js"></script>

        <script>
                (function (){

                    //$('#ui_tab .ui_tab_nav li').click(function(){
                    //    $(this).addClass('current').siblings().removeClass('current');
                    //    $('#ui_tab .ui_tab_content .ui_tab_content_item').eq($(this).index()).show().siblings().hide();
                    //    return false;
                    //});
                    //$('#ui_tab2 .ui_tab_nav li').click(function(){
                    //    $(this).addClass('current').siblings().removeClass('current');
                    //    $('#ui_tab2 .ui_tab_content .ui_tab_content_item').eq($(this).index()).show().siblings().hide();
                    //    return false;
                    //});
                    //$('#ui_tab3 .ui_tab_nav li').click(function(){
                    //    $(this).addClass('current').siblings().removeClass('current');
                    //    $('#ui_tab3 .ui_tab_content .ui_tab_content_item').eq($(this).index()).show().siblings().hide();
                    //    return false;
                    //});

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
            </form>
    </body>
</html>
