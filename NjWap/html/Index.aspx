<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="NjWap.html.Index" %>
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
                </tbody>
              </table>
        </div>
        <div class="ui-slider">
            <ul class="ui-slider-content" style="width: 300%">
                <%--<li><a href="#"><span style="background-image:url(../img/foc-1.jpg)"></span></a></li>
                <li><span style="background-image:url(../img/foc-2.jpg)"></span></li>--%>
                <asp:Literal ID="ltSy" runat="server"></asp:Literal>
            </ul>
        </div>
        <section class="container">
             <asp:Repeater ID="rptBodyTop" runat="server">
                         <ItemTemplate>
            <div class="container_title clearfix">
                <a class="link_more" href='List.aspx?CID=<%#Eval("CATEGORY_ID")%>'>更多..</a>
                <h3><%#Eval("Title")%></h3>
            </div>
                    </ItemTemplate>
             </asp:Repeater>   
            <div class="container_content">
                <ul class="textlist">
                      <asp:Literal ID="ltHead" runat="server"></asp:Literal>
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
                        <li><a href="" target="_blank" title="科技部、农业部签署“科农协同”工作机制合作协议">科技部、农业部签署“科农协同”工作机制合作协议</a></li>--%>
                </ul>
                <%--<a class="bot_link_more" href='List.aspx?CID=<%#Eval("CATEGORY_ID")%>'>查看更多</a>--%>
            </div>
                                 
        </section>

        

        <section class="ui-container">           
            <section id="tab">
            	<div class="demo-item">
            		<!-- <p class="demo-desc">标签栏</p> -->
            		<div class="demo-block">
                        <asp:Literal ID="ltBody" runat="server"></asp:Literal>
            			
            		</div>
            	</div>
                
            </section>
        </section>

        <section class="container">
            <div class="container_title clearfix">
               <%-- <a class="link_more" href="">更多..</a>--%>
                <h3>&nbsp;</h3>
            </div>
            <div class="container_content">
                <%--<ul class="textlist">
                      
                      <li class="first">
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
                </ul>--%>
                <a class="bot_link_more"></a>
            </div>
        </section>



        



        </form>



<script src="../lib/zepto.min.js"></script>
        <script src="../js/frozen.js"></script>

            <script>
                function cate(obj1, obj2,obj3) {
                    $('#' + obj1).addClass('current').siblings().removeClass('current');
                    $('#' + obj2 + ' .ui_tab_content .ui_tab_content_item').eq(obj3).show().siblings().hide();
                    return false;
                }

                (function (){
                    
                    //$('.ui_tab_nav li').click(function(){
                    //    $(this).addClass('current').siblings().removeClass('current');
                    //    $('#ui_tab .ui_tab_content .ui_tab_content_item').eq($(this).index()).show().siblings().hide();
                    //    return false;
                    //});
                    //$('#ui_tab2 .ui_tab_nav li').click(function(){
                    //    $(this).addClass('current').siblings().removeClass('current');
                    //    $('#ui_tab2 .ui_tab_content .ui_tab_content_item').eq($(this).index()).show().siblings().hide();
                    //    return false;
                    //});
                    //$('#ui_tab5 .ui_tab_nav li').click(function(){
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
    </body>
</html>