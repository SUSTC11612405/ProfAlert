<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="Shortcut Icon" href="favicon.ico" type="image/x-icon" />
<meta name="Keywords" content="Keywords" />
<meta name="description" content="description" />
<meta name="Author" content="Shenzhen Doocom Technology Co., Ltd. http://www.doocom.cn, Nov 2012" />
<title>图书馆OPAC检索平台</title>
<link type="text/css" rel="stylesheet" href="inc/style.css" />
<script type="text/javascript" src="inc/jquery.js"></script>
<script type="text/javascript" src="inc/func.js"></script>
<script type="text/javascript" src="inc/jquery.uniform.min.js"></script>
<link type="text/css" rel="stylesheet" href="inc/colorbox.css" />
<script type="text/javascript" src="inc/jquery.colorbox.js"></script>

<!--[if lt IE 7]>
<script type="text/javascript" src="inc/DD_belatedPNG.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#cboxClose');
</script>
<![endif]-->

</head>

<body>
<div class="wrapper">
	<div class="header">
    	<div class="headcon">
    		<a href="search.jsp" class="logo"><img src="images/logo.png" alt="" width="237" height="71" /></a>
            <div class="head_btn">
            	<div class="resources_btn">
                	<a href="search.jsp" class="active"><span class="a1">馆藏资源检索</span></a><a href="feature_retrieval.jsp"><span class="a2">特色资源</span></a>
                </div>
                 <div class="loading" id='loading' style='display:none'>加载数据中，请等待片刻</div>
                <div class="login_info"  ><a href="../MyLibrary/Reader-Access.jsp?destPage=/Search/searchshow.jsp?v_value=%E8%8A%B1+&v_index=title&sortfield=score&sorttype=desc&v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&">登录我的图书馆</a></div>
				<div class="login_info" style="display:none;" id='loginInfo_div'>
					<div class="in" style="font-size:15px">
					<span class="welcome">欢迎 null</span>
					<a href="/MyLibrary/login.jsp" class="mylib">进入我的图书馆</a>
					<a href="/MyLibrary/GetOutLib.jsp" class="mylib">退出</a>
					
					</div>
				</div>
            </div>
        </div>    
    </div>
<script    type="text/javascript">
function LostCode()
{
	if(username.value=="")
	{
		alert("请输入用户名！");
		
	}
	else 
	{
		location.href="/MyLibrary/Enter-Lost-CodeN.jsp?username="+username.value;
		
	}
}

$.ajaxSetup({
	type: 'POST',
	dataType: 'xml',
	
     error: function(xhr,status){
    	if(xhr.status != 412||xhr.status !=405) {// 不知为啥thickbox老报这个错，只能先屏蔽掉了
    	   // alert('网络错误'+xhr.status+'，请稍候重试!');	
    	}
    },
    beforeSend: function(XMLHttpRequest){
		$("#loading").show();
	},
    complete: function(XMLHttpRequest, textStatus){
		$("#loading").hide();
	}
});
<!--
        //    Cookie    handling    
        var    Cookie    =
        {
            read:    function    (name)
            {
                var    arrCookies    =    document.cookie.split(';');
                for    (var    i=0;    i<arrCookies.length;    i++)
                {
                        var    arrCookie    =    arrCookies[i].split('=');
                        if (arrCookie[0].replace(/(^\s*)|(\s*$)/g, "") == name)
                        {
                            return decodeURIComponent (arrCookie[1]);
                        }
                }
                return    false;
            },
        
            write:    function    (name,    value,    expires,    path)
            {
                if    (expires)
                {
                        var    date    =    new    Date    ();
                        date.setTime    (date.getTime    ()    +    (((((expires    *    24)    *    60)    *    60)    *    1000)));
                        expires  =  ';expires=' + date.toGMTString    ();
                }
                else    expires    =    '';
        
                if    (!path)    path    =    '/';
        
                document.cookie = name+'='+encodeURIComponent(value)+expires+';path='+path;
            },
        
            remove:    function    (name)
            {
                this.write    (name,    '',    -1);
            }
        }
        
        //    Detects    if    can    set    a    cookie    in    the    browser
        function    browserSupportsCookies()
        {
            Cookie.write('cookiesEnabled', 1);
            var    boolCookiesEnabled = Cookie.read('cookiesEnabled');
            Cookie.remove('cookiesEnabled');
            if    (boolCookiesEnabled    !=    1)
            {
                return    false;
            }
            return    true;
        }
        
        //    Detects    if    the    browser    supports    Ajax    
        function    browserSupportsAjax()
        {
            if    (typeof    XMLHttpRequest    ==    "undefined"    &&    typeof    ActiveXObject    ==    "undefined"    &&    window.createRequest    ==    "undefined")
            {
                return    false;
            }
            return    true
        }
        
        //    Detects    if    the    browser    can    use    ActiveX    if    necessary
        function    ActiveXEnabledOrUnnecessary    ()
        {
            if    (typeof    ActiveXObject    !=    "undefined")
            {
                var    xhr    =    null;
                try{
                        xhr=new    ActiveXObject("Msxml2.XMLHTTP");
                }catch    (e){
                        try{
                            xhr=new    ActiveXObject("Microsoft.XMLHTTP");
                        }catch    (e2){
                            try{
                                xhr=new    ActiveXObject("Msxml2.XMLHTTP.4.0");
                            }catch    (e3){
                                xhr=null;
                            }
                        }
                }
                if    (xhr    ==    null)
                {
                        return    false
                }
            }
            
            return    true;
        }
-->
</script> 

<!-- 如果用户的浏览器不支持cookie,javascript和ajax的话显示错误信息给用户 -->
<!--    Detect    support    for    cookies    and    Ajax    and    display    message    if    not    -->            
<div    id="supportError">
        <noscript>
            <div style="font-size:19px;color:red">系统检测到您的浏览器不支持Javascript。
            本网站需要浏览器支持JavaScript，
            请调整您的浏览器设置后重试,
            否则部分功能将不能正常使用。</div>
        </noscript>
        
        <script    type="text/javascript">
        <!--
        
        if    (!browserSupportsCookies())
        {
            var    msg    =    '<div style=\'font-size:19px;color:red\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统检测到您的浏览器不支持Cookies。'
            msg    +=    '本网站需要浏览器支持Cookies，';
            msg    +=    '请调整您的浏览器设置后重试，';
            msg    +=    '否则部分功能将不能正常使用。</div>'
            
            document.write(msg);
        }
        
        if    (!browserSupportsAjax())
        {
            var    msg    =    '<div style=\'font-size:19px;color:red\'>系统检测到您的浏览器不支持Ajax。'
            msg    +=    '本网站需要浏览器支持Ajax，';
            msg    +=    '请调整您的浏览器设置后重试，';
            msg    +=    '否则部分功能将不能正常使用。</div>'
            
            document.write(msg);
        }
            
        if    (!ActiveXEnabledOrUnnecessary())
        {
            var    msg    =    '<div style=\'font-size:19px;color:red\'>系统检测到您的浏览器不支持ActiveX。'
            msg    +=    '本网站需要浏览器支持ActiveX，';
            msg    +=    '请调整您的浏览器设置后重试，';
            msg    +=    '否则部分功能将不能正常使用。</div>'
            
            document.write(msg);
        }        
        -->
        </script>
</div>














<link type="text/css" rel="stylesheet" href="auto/jquery-ui.css" />
<script type="text/javascript" src="inc/jquery.md5.js"></script>
<script type="text/javascript" src="auto/jquery-ui.js"></script>
<script type="text/javascript" src="inc/jQuery.equalHeights.js"></script>
<script type="text/javascript" src="inc/jquery.uniform.min.js"></script>
<script language="javascript">

$(function(){


})



function autoCompleteInput(obj)  
{  		
	
    $(obj).autocomplete({ 
	   	source:'searchshowAUTO.jsp?v_tablearray=bibliosm&v_index='+(v_index.value=='all'?'title':v_index.value)+'&sortfield=score&sorttype=desc',//可以填数据组，或URL，
   	 	//URL返回值为JSON格式数据,发送请求时，会自动附带一个term参数让服务器来获取输入框内容         
        minLength:2,//最小联想长度，当输入内容长度达到这个长度时才进行联想   
        select: function(event,ui){//选中事件，当鼠标点击下拉选项时触发，主要就是将输入框内容替换       
        }  
    });  
}	


function OnSecondSearch(index) {
	if(v_value.value==""){
		alert("请输入检索内容");
		return;
	}
	// 继承上一次的二次检索条件
	document.PageForm.v_secondquery.value="";
	// 加入本次二次检索条件,对检索内容进行编码
	if(index!="classno"&&index!="callno")
		v_value.value= v_value.value.replace(/[\ |\~|\`|\!|\@|#|$|\%|\^|\&|\*|\(|\)|\-|\_|\+|\=|\||\\|\[|\]|\{|\}|\;|\:|\"|\'|\,|\<|\.|\>|\/|\?]/g,""); 
	
	if(index != "title" && index  != "author" && index  != "publisher" && index  != "subject") { 
		//v_value.value =guolv(v_value.value," ");
		document.PageForm.v_secondquery.value += "fq="+index+":"+encodeURIComponent(v_value.value)+"*";
	}
	else {
		v_value.value =guolv(v_value.value," ");
		document.PageForm.v_secondquery.value += "fq="+index+":"+encodeURIComponent(v_value.value);
	}	
	
	//热词统计
	
	$.ajax({
	 	type: "POST",
	    url: 'hotword.jsp',	  
	    data:'v_index=' + index+"&v_value="+encodeURIComponent(guolv(v_value.value," ")),   	  
	    error: function(xml){
	      
	    }
	});
	
	
	document.PageForm.submit();	
	
}

function facetSearch(index,value){
	
	v_value.value=decodeURIComponent(value);
	OnSecondSearch(index);
	
}


function search(){
	if(v_value.value==""){
		alert("请输入检索内容");
		return;
	}
	
	
		
	v_value.value =guolv(v_value.value," ");
		
	
		
	//热词统计
	$.ajax({
	    url: 'hotword.jsp?v_index=' + v_index.value+"&v_value="+encodeURIComponent(v_value.value),	     	  
	    error: function(xml){
	      
	    }
	});
	
	location.href="searchshow.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_index="+v_index.value+"&v_value="+encodeURIComponent(v_value.value)+"&sortfield="+v_sortfield.value+"&sorttype="+v_sorttype.value+""+"";
	return false;
}


function cloudSearch(index,value){
	v_value.value = value;
	v_index.value = index;
	 search();
}

function LostCode()
{
	if(username.value=="")
	{
		alert("请输入用户名！");
		
	}
	else 
	{
		location.href="/MyLibrary/Enter-Lost-CodeN.jsp?username="+username.value;
		
	}
}
</script>
<div style=display:none id=sql>http://172.16.11.111:8080/solr/select?fl=*&q=title:%E8%8A%B1+&sort=score+desc,publishyear+desc&fq=tablename:bibliosm+OR+tablename:serbibm+OR+tablename:apabibibm+OR+tablename:mmbibm&&start=0&rows=10</div>



    
    <div class="content content_1">
    	<div class="con_top">
    	<div class="books_sel">
					
					<select name="v_index" id="v_index">
						<option value="all" >任意词</option>
						 <option value="title" selected>书 名</option>
						 <option value="author">作 者</option>
						 <option value="subject">关键词</option>
						 <option value="classno">分类号</option>
						 <option value="isbn">ISBN</option>
						 <option value="callno">索书号</option>
						 <option value="publisher">出版者</option>
					 </select>
					<input name="v_value" id="v_value" class="input"  type="text" style="width:80px" onkeydown="if(window.event.keyCode==13){javascript:search();}"/>

					<input type="button" value="重新检索"  class="submit" onclick="javascript:search()"　/>
					<input type="button" value="在结果中检索" onclick="javascript:OnSecondSearch(v_index.value)" class="submit submit_1" />
				
				
			</div> 
			 <div class="paginal paginal_1">
 				 <form name=PageForm method=post action=searchshow.jsp>

<input type=hidden name=v_index value="title">
<input type=hidden name=v_value value="花 ">
<input type=hidden name=v_publisher value="">
<input type=hidden name=v_author value="">
<input type=hidden name=v_tablearray value="bibliosm,serbibm,apabibibm,mmbibm,">
<input type=hidden name=v_secondquery value="">
<input type=hidden name=sortfield value="score">
<input type=hidden name=sorttype value="desc">
<input type=hidden name='pageNum' value="10">
页码:<b>1</b>/<b>3348</b>页 每页 <b>10</b> &nbsp;&nbsp;&nbsp;&nbsp;

<font face=webdings color=#FF0000>9</font> 
<b><font color=red>1</font></b> 
<a href="javascript:GotoPage(2)"><b>2</b></a> 
<a href="javascript:GotoPage(3)"><b>3</b></a> 
<a href="javascript:GotoPage(4)"><b>4</b></a> 
<a href="javascript:GotoPage(5)"><b>5</b></a> 
<a href="javascript:GotoPage(6)"><b>6</b></a> 
<a href="javascript:GotoPage(7)"><b>7</b></a> 
<a href="javascript:GotoPage(8)"><b>8</b></a> 
<a href="javascript:GotoPage(9)"><b>9</b></a> 
<a href="javascript:GotoPage(10)"><b>10</b></a> 
<a href="javascript:GotoPage(11)" title=后10页><font face=webdings>8</font></a> 
<a href="javascript:GotoPage(3348)" title=尾页><font face=webdings>:</font></a>

<input type=hidden name=v_page >
</form>
<script language="javascript">
function GotoPage(page)
{
document.PageForm.v_page.value = page;
document.PageForm.submit();
}
</script>


				</div>	
                  
 				
 
        </div>
        
      <div class="con_center">
		<div class="con_right">
				<div class="con_r_top">
                					
		        	<div class="total">
		            	<span class="fbold">花 </span>共有<span>33471</span>条记录，耗时[<span id="idTimeSpan1"></span>]秒
		            </div>
		          
		                <div class="sortleft">  	
						<label class="label">排序选项</label>
						  <select  id="v_sortfield" onchange="paixu()">
						    <option value="score" selected>匹配度</option>
						     <option value="publishyear" >出版年</option>					   
						     <option value="author">作 者</option>
						     <option value="subject">关键词</option>
						     <option value="classno">分类号</option>
						     <option value="isbn">ISBN</option>
						     <option value="callno">索书号</option>
						     <option value="publisher">出版者</option>
    					 </select>
						<!--  <label class="label">排序选项</label> -->
						 <select id="v_sorttype" onchange="paixu()">
							<option value="desc" >降序</option>
							<option value="asc">升序</option>						
						 </select>
                	  </div>
                </div>
                <div class="con_r_con">
                	<ul class="booklist">
                	
							<li>
								<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3775451&v_curtable=bibliosm&site=null" target=_blank>									 
								<img  class="img"  src="https://www.szlib.org.cn/index.php?client=szlib&isbn=9787510842689/cover" width="90" height="120" /></a>
								
									<h3 class="title">
									<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3775451&v_curtable=bibliosm&site=null" target=_blank title = "花:(日)杉本秀太郎文/(日)安野光雅图 李丹译">
									 
									 花:(日)杉本秀太郎文/(日)安野光雅图 李丹译
									
									</a></h3>
									<div class="info">
										<span class="author">作 者：杉本秀太郎 安野光雅 李丹</span>
										<span class="publisher">出版者：北京;九州出版社:2016</span>
										<span class="dates">出版年：2016</span>
									</div>
									<div class="text">
									本书作者是日本著名诗人和随笔作家，由各种花卉引发联想，援引古今中外的诗句，写就了一篇篇锦绣文章。优雅的文字与绘本大师安野光雅清淡秀逸的水彩画相得益彰，再现百花于自然中的楚楚风姿，让读者充分领略自然之美。
									</div>

									<a class="btn_2" name="detail" href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3775451&v_curtable=bibliosm&site=null" target=_blank> 详细信息</a>
						<a href="#"  class="btn_1" onclick="reservat('3775451','80000002')" style="display:none">预借登记</a>
						            <a  href="#success" class="delivery_btn" onclick="addExpress('3775451')" style="display:none">加入快递书车</a>
									<a href="#" class="see" name="bibliosm,3775451">
										查看索书号
									</a>
									
									
							 <div class="booknum_con">
							 	 <div class="booknum">
							 	 <span class="angle"></span>
                                    <a href="#" class="close"></a>
										<div class="holdingtab"></div>
								</div>
							</div>
							</li>	
							
							<li>
								<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=856509&v_curtable=bibliosm&site=null" target=_blank>									 
								<img  class="img"  src="https://www.szlib.org.cn/index.php?client=szlib&isbn=7805196397/cover" width="90" height="120" /></a>
								
									<h3 class="title">
									<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=856509&v_curtable=bibliosm&site=null" target=_blank title = "花:付承洲著">
									 
									 花:付承洲著
									
									</a></h3>
									<div class="info">
										<span class="author">作 者：付承洲</span>
										<span class="publisher">出版者：南京;江苏古籍出版社:1995.8</span>
										<span class="dates">出版年：1995</span>
									</div>
									<div class="text">
									
									</div>

									<a class="btn_2" name="detail" href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=856509&v_curtable=bibliosm&site=null" target=_blank> 详细信息</a>
						<a href="#"  class="btn_1" onclick="reservat('856509','80000002')" style="display:none">预借登记</a>
						            <a  href="#success" class="delivery_btn" onclick="addExpress('856509')" style="display:none">加入快递书车</a>
									<a href="#" class="see" name="bibliosm,856509">
										查看索书号
									</a>
									
									
							 <div class="booknum_con">
							 	 <div class="booknum">
							 	 <span class="angle"></span>
                                    <a href="#" class="close"></a>
										<div class="holdingtab"></div>
								</div>
							</div>
							</li>	
							
							<li>
								<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=153857&v_curtable=bibliosm&site=null" target=_blank>									 
								<img  class="img"  src="https://www.szlib.org.cn/index.php?client=szlib&isbn=/cover" width="90" height="120" /></a>
								
									<h3 class="title">
									<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=153857&v_curtable=bibliosm&site=null" target=_blank title = "花:上海植物园编">
									 
									 花:上海植物园编
									
									</a></h3>
									<div class="info">
										<span class="author">作 者：上海植物园</span>
										<span class="publisher">出版者：上海;上海人民美术出版社:1983</span>
										<span class="dates">出版年：1983</span>
									</div>
									<div class="text">
									
									</div>

									<a class="btn_2" name="detail" href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=153857&v_curtable=bibliosm&site=null" target=_blank> 详细信息</a>
						<a href="#"  class="btn_1" onclick="reservat('153857','80000002')" style="display:none">预借登记</a>
						            <a  href="#success" class="delivery_btn" onclick="addExpress('153857')" style="display:none">加入快递书车</a>
									<a href="#" class="see" name="bibliosm,153857">
										查看索书号
									</a>
									
									
							 <div class="booknum_con">
							 	 <div class="booknum">
							 	 <span class="angle"></span>
                                    <a href="#" class="close"></a>
										<div class="holdingtab"></div>
								</div>
							</div>
							</li>	
							
							<li>
								<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=4141322&v_curtable=bibliosm&site=null" target=_blank>									 
								<img  class="img"  src="https://www.szlib.org.cn/index.php?client=szlib&isbn=9787553318035/cover" width="90" height="120" /></a>
								
									<h3 class="title">
									<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=4141322&v_curtable=bibliosm&site=null" target=_blank title = "花落花开:肖萍著">
									 
									 花落花开:肖萍著
									
									</a></h3>
									<div class="info">
										<span class="author">作 者：肖萍</span>
										<span class="publisher">出版者：南京;南京出版社:2017</span>
										<span class="dates">出版年：2017</span>
									</div>
									<div class="text">
									
									</div>

									<a class="btn_2" name="detail" href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=4141322&v_curtable=bibliosm&site=null" target=_blank> 详细信息</a>
						<a href="#"  class="btn_1" onclick="reservat('4141322','80000002')" style="display:none">预借登记</a>
						            <a  href="#success" class="delivery_btn" onclick="addExpress('4141322')" style="display:none">加入快递书车</a>
									<a href="#" class="see" name="bibliosm,4141322">
										查看索书号
									</a>
									
									
							 <div class="booknum_con">
							 	 <div class="booknum">
							 	 <span class="angle"></span>
                                    <a href="#" class="close"></a>
										<div class="holdingtab"></div>
								</div>
							</div>
							</li>	
							
							<li>
								<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3070057&v_curtable=bibliosm&site=null" target=_blank>									 
								<img  class="img"  src="https://www.szlib.org.cn/index.php?client=szlib&isbn=9787505133198/cover" width="90" height="120" /></a>
								
									<h3 class="title">
									<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3070057&v_curtable=bibliosm&site=null" target=_blank title = "花红花火:海飞著">
									 
									 花红花火:海飞著
									
									</a></h3>
									<div class="info">
										<span class="author">作 者：海飞</span>
										<span class="publisher">出版者：北京;红旗出版社:2015</span>
										<span class="dates">出版年：2015</span>
									</div>
									<div class="text">
									
									</div>

									<a class="btn_2" name="detail" href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3070057&v_curtable=bibliosm&site=null" target=_blank> 详细信息</a>
						<a href="#"  class="btn_1" onclick="reservat('3070057','80000002')" style="display:none">预借登记</a>
						            <a  href="#success" class="delivery_btn" onclick="addExpress('3070057')" style="display:none">加入快递书车</a>
									<a href="#" class="see" name="bibliosm,3070057">
										查看索书号
									</a>
									
									
							 <div class="booknum_con">
							 	 <div class="booknum">
							 	 <span class="angle"></span>
                                    <a href="#" class="close"></a>
										<div class="holdingtab"></div>
								</div>
							</div>
							</li>	
							
							<li>
								<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3281159&v_curtable=bibliosm&site=null" target=_blank>									 
								<img  class="img"  src="https://www.szlib.org.cn/index.php?client=szlib&isbn=9787514337273/cover" width="90" height="120" /></a>
								
									<h3 class="title">
									<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3281159&v_curtable=bibliosm&site=null" target=_blank title = "野花 野花:吴友财著">
									 
									 野花 野花:吴友财著
									
									</a></h3>
									<div class="info">
										<span class="author">作 者：吴友财</span>
										<span class="publisher">出版者：北京;现代出版社:2015</span>
										<span class="dates">出版年：2015</span>
									</div>
									<div class="text">
									
									</div>

									<a class="btn_2" name="detail" href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3281159&v_curtable=bibliosm&site=null" target=_blank> 详细信息</a>
						<a href="#"  class="btn_1" onclick="reservat('3281159','80000002')" style="display:none">预借登记</a>
						            <a  href="#success" class="delivery_btn" onclick="addExpress('3281159')" style="display:none">加入快递书车</a>
									<a href="#" class="see" name="bibliosm,3281159">
										查看索书号
									</a>
									
									
							 <div class="booknum_con">
							 	 <div class="booknum">
							 	 <span class="angle"></span>
                                    <a href="#" class="close"></a>
										<div class="holdingtab"></div>
								</div>
							</div>
							</li>	
							
							<li>
								<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3515683&v_curtable=bibliosm&site=null" target=_blank>									 
								<img  class="img"  src="https://www.szlib.org.cn/index.php?client=szlib&isbn=9787545039542/cover" width="90" height="120" /></a>
								
									<h3 class="title">
									<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3515683&v_curtable=bibliosm&site=null" target=_blank title = "花花世界:(法)吉莉亚妮著">
									 
									 花花世界:(法)吉莉亚妮著
									
									</a></h3>
									<div class="info">
										<span class="author">作 者：吉莉亚妮</span>
										<span class="publisher">出版者：西安;陕西人民教育出版社:2015.10</span>
										<span class="dates">出版年：2015</span>
									</div>
									<div class="text">
									这是一本诗意盎然、感人肺腑的小书，一本黑与白绘成的小书……同时，也是一本歌颂生命的脆弱与美丽的小书，将人生最质朴的哲理娓娓道出，让人感慨良多。将折叠的部分展开，让色彩在书页间舞动，让花朵在书页上绽放。
									</div>

									<a class="btn_2" name="detail" href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3515683&v_curtable=bibliosm&site=null" target=_blank> 详细信息</a>
						<a href="#"  class="btn_1" onclick="reservat('3515683','80000002')" style="display:none">预借登记</a>
						            <a  href="#success" class="delivery_btn" onclick="addExpress('3515683')" style="display:none">加入快递书车</a>
									<a href="#" class="see" name="bibliosm,3515683">
										查看索书号
									</a>
									
									
							 <div class="booknum_con">
							 	 <div class="booknum">
							 	 <span class="angle"></span>
                                    <a href="#" class="close"></a>
										<div class="holdingtab"></div>
								</div>
							</div>
							</li>	
							
							<li>
								<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=2937209&v_curtable=bibliosm&site=null" target=_blank>									 
								<img  class="img"  src="https://www.szlib.org.cn/index.php?client=szlib&isbn=9787549110995/cover" width="90" height="120" /></a>
								
									<h3 class="title">
									<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=2937209&v_curtable=bibliosm&site=null" target=_blank title = "花花菜:木麻黄著">
									 
									 花花菜:木麻黄著
									
									</a></h3>
									<div class="info">
										<span class="author">作 者：木麻黄</span>
										<span class="publisher">出版者：广州;南方日报出版社:2014</span>
										<span class="dates">出版年：2014</span>
									</div>
									<div class="text">
									本书按春、夏、秋、冬4个季节介绍时令花卉，内容包括花卉特性、种植和食疗效果及其他功用等，并附有每种花卉菜肴的制作步骤和过程图。
									</div>

									<a class="btn_2" name="detail" href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=2937209&v_curtable=bibliosm&site=null" target=_blank> 详细信息</a>
						<a href="#"  class="btn_1" onclick="reservat('2937209','80000002')" style="display:none">预借登记</a>
						            <a  href="#success" class="delivery_btn" onclick="addExpress('2937209')" style="display:none">加入快递书车</a>
									<a href="#" class="see" name="bibliosm,2937209">
										查看索书号
									</a>
									
									
							 <div class="booknum_con">
							 	 <div class="booknum">
							 	 <span class="angle"></span>
                                    <a href="#" class="close"></a>
										<div class="holdingtab"></div>
								</div>
							</div>
							</li>	
							
							<li>
								<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3074427&v_curtable=bibliosm&site=null" target=_blank>									 
								<img  class="img"  src="https://www.szlib.org.cn/index.php?client=szlib&isbn=9787542760876/cover" width="90" height="120" /></a>
								
									<h3 class="title">
									<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3074427&v_curtable=bibliosm&site=null" target=_blank title = "窗花 雪花:燕子编">
									 
									 窗花 雪花:燕子编
									
									</a></h3>
									<div class="info">
										<span class="author">作 者：燕子</span>
										<span class="publisher">出版者：上海;上海科学普及出版社:2014</span>
										<span class="dates">出版年：2014</span>
									</div>
									<div class="text">
									
									</div>

									<a class="btn_2" name="detail" href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3074427&v_curtable=bibliosm&site=null" target=_blank> 详细信息</a>
						<a href="#"  class="btn_1" onclick="reservat('3074427','80000002')" style="display:none">预借登记</a>
						            <a  href="#success" class="delivery_btn" onclick="addExpress('3074427')" style="display:none">加入快递书车</a>
									<a href="#" class="see" name="bibliosm,3074427">
										查看索书号
									</a>
									
									
							 <div class="booknum_con">
							 	 <div class="booknum">
							 	 <span class="angle"></span>
                                    <a href="#" class="close"></a>
										<div class="holdingtab"></div>
								</div>
							</div>
							</li>	
							
							<li>
								<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3163376&v_curtable=bibliosm&site=null" target=_blank>									 
								<img  class="img"  src="https://www.szlib.org.cn/index.php?client=szlib&isbn=9787111453925/cover" width="90" height="120" /></a>
								
									<h3 class="title">
									<a href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3163376&v_curtable=bibliosm&site=null" target=_blank title = "插花花艺:辛丽红主编">
									 
									 插花花艺:辛丽红主编
									
									</a></h3>
									<div class="info">
										<span class="author">作 者：辛丽红</span>
										<span class="publisher">出版者：北京;机械工业出版社:2014</span>
										<span class="dates">出版年：2014</span>
									</div>
									<div class="text">
									本书从学生能力建设的视角出发，以“新、实、浅”为特点，以突出职业能力培养为重点，系统介绍了插花花艺的理论技能，涉及插花花艺的基本技艺、色彩运用、各类花形的创作以及花艺作品的鉴赏等方面。
									</div>

									<a class="btn_2" name="detail" href="searchdetail.jsp?v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&v_recno=3163376&v_curtable=bibliosm&site=null" target=_blank> 详细信息</a>
						<a href="#"  class="btn_1" onclick="reservat('3163376','80000002')" style="display:none">预借登记</a>
						            <a  href="#success" class="delivery_btn" onclick="addExpress('3163376')" style="display:none">加入快递书车</a>
									<a href="#" class="see" name="bibliosm,3163376">
										查看索书号
									</a>
									
									
							 <div class="booknum_con">
							 	 <div class="booknum">
							 	 <span class="angle"></span>
                                    <a href="#" class="close"></a>
										<div class="holdingtab"></div>
								</div>
							</div>
							</li>	
								
								 
					</ul>
				</div>
			</div>

			
					


<div class="sidebar">






<style type="text/css">
body {background: #FFF }
#ts1 {position:relative; width:350px; height:350px; margin: 20px auto 0; }
#ts1 a {position:absolute; top:0px; left:0px; font-family: Microsoft YaHei;  font-weight:bold; text-decoration:none; 

padding: 3px 6px; }
#ts1 a:hover {border: 1px solid #eee; background: #FFF; }
#ts1 .blue {color:blue;}
#ts1 .red {color:red;}
#ts1 .green {color:green;}

p { font: 16px Microsoft YaHei; text-align: center; color: #ba0c0c; }
p a { font-size: 14px; color: #ba0c0c; }
p a:hover { color: red; }
</style>

<script type="text/javascript" src="js/jquery.windstagball.js"></script>
		
		<dl class="sidelist">
		<dt>
          <span class="title">热搜词<span>	
			</span></span>
          </dt>
		<div id="ts1"  style="width:180px; height:160px; background-color:#FFF;">
    <ul>
    
    </ul>
  		
  </div>
 	 <dt>
          <span class="title"><span>	
			</span></span>
          </dt>
       				
       			
      	  			<dt>
                    	<span class="title"><span>
      					主题词
      					</span></span>
                    </dt>
                    <dd>
       	
      		<ul class="barlist">

      		
        	
	            <li><a href="javascript:facetSearch('subject','长篇小说')" >
	            长篇小说(4462)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('subject','花卉')" >
	            花卉(2353)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('subject','作品集')" >
	            作品集(2052)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('subject','儿童文学')" >
	            儿童文学(1902)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('subject','图画故事')" >
	            图画故事(1687)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('subject','散文集')" >
	            散文集(1184)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('subject','花鸟画')" >
	            花鸟画(1169)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('subject','观赏园艺')" >
	            观赏园艺(1075)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('subject','花卉画')" >
	            花卉画(1026)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('subject','短篇小说')" >
	            短篇小说(890)</a></li>
	      
 	
          	
          	</ul>
       	 </dd>
       	
        			
       			
      	  			<dt>
                    	<span class="title"><span>
      					作 者
      					</span></span>
                    </dt>
                    <dd>
       	
      		<ul class="barlist">

      		
        	
	            <li><a href="javascript:facetSearch('author','鲁迅')" >
	            鲁迅(345)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('author','小仲马')" >
	            小仲马(281)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('author','伯内特')" >
	            伯内特(218)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('author','李汝珍')" >
	            李汝珍(193)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('author','古龙')" >
	            古龙(129)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('author','贾德江')" >
	            贾德江(125)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('author','阿瑛')" >
	            阿瑛(123)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('author','伍美珍')" >
	            伍美珍(117)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('author','金波')" >
	            金波(95)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('author','郁雨君')" >
	            郁雨君(78)</a></li>
	      
 	
          	
          	</ul>
       	 </dd>
       	
        			
       			
      	  			<dt>
                    	<span class="title"><span>
      					文献类型
      					</span></span>
                    </dt>
                    <dd>
       	
      		<ul class="barlist">

      		
        	
	            <li><a href="javascript:facetSearch('tablename','bibliosm')" >
	            图书(29863)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('tablename','apabibibm')" >
	            电子书(2308)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('tablename','mmbibm')" >
	            音像资料(1194)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('tablename','serbibm')" >
	            期刊(106)</a></li>
	      
 	
          	
          	</ul>
       	 </dd>
       	
        <dt id='tushu'><span class='title title_1'>图书分布(种数)</span><div class='books_total'><div class='tab_3_title'><a class=cur>福田</a><a ''>宝安</a><a ''>南山</a><a ''>龙岗</a><a ''>罗湖</a><a ''>光明</a><a ''>盐田</a><a ''>坪山</a><a ''>龙华</a><a ''>大鹏</a></div><div class='tab_3_show'>	<div class='tab_3_text'>
                          	<ul class="totallist">
							<li name='044005' ><a title='深圳图书馆 (15617)' href=javascript:facetSearch('serviceaddr','044005') >深圳图书馆 (15617)</a></li><li name='044008' ><a title='福田区图书馆 (5228)' href=javascript:facetSearch('serviceaddr','044008') >福田区图书馆 (5228)</a></li><li name='FTST07' ><a title='福田区沙头街道下沙社区图书馆 (518)' href=javascript:facetSearch('serviceaddr','FTST07') >福田区沙头街道下沙社区图书馆 (518)</a></li><li name='FTFT12' ><a title='福田区福田街道水围社区图书馆 (505)' href=javascript:facetSearch('serviceaddr','FTFT12') >福田区福田街道水围社区图书馆 (505)</a></li><li name='FTXM01' ><a title='福田区香蜜湖街道图书馆 (469)' href=javascript:facetSearch('serviceaddr','FTXM01') >福田区香蜜湖街道图书馆 (469)</a></li><li name='FTST01' ><a title='福田区沙头街道图书馆 (463)' href=javascript:facetSearch('serviceaddr','FTST01') >福田区沙头街道图书馆 (463)</a></li><li name='FTFT11' ><a title='福田区福田街道皇岗社区图书馆 (446)' href=javascript:facetSearch('serviceaddr','FTFT11') >福田区福田街道皇岗社区图书馆 (446)</a></li><li name='FTML01' ><a title='福田区梅林街道图书馆 (442)' href=javascript:facetSearch('serviceaddr','FTML01') >福田区梅林街道图书馆 (442)</a></li><li name='FTYL01' ><a title='福田区园岭街道图书馆 (441)' href=javascript:facetSearch('serviceaddr','FTYL01') >福田区园岭街道图书馆 (441)</a></li><li name='FTFT13' ><a title='福田区福田街道福田社区图书馆 (424)' href=javascript:facetSearch('serviceaddr','FTFT13') >福田区福田街道福田社区图书馆 (424)</a></li><li name='FTLH09' ><a title='福田区莲花街道莲花北社区图书馆 (399)' href=javascript:facetSearch('serviceaddr','FTLH09') >福田区莲花街道莲花北社区图书馆 (399)</a></li><li name='FTFT01' ><a title='福田区福田街道图书馆 (389)' href=javascript:facetSearch('serviceaddr','FTFT01') >福田区福田街道图书馆 (389)</a></li><li name='FTNY01' ><a title='福田区南园街道图书馆 (327)' href=javascript:facetSearch('serviceaddr','FTNY01') >福田区南园街道图书馆 (327)</a></li><li name='FTLH02' ><a title='福田区莲花街道景田社区图书馆 (285)' href=javascript:facetSearch('serviceaddr','FTLH02') >福田区莲花街道景田社区图书馆 (285)</a></li><li name='FTFT04' ><a title='福田区福田街道口岸社区图书馆 (279)' href=javascript:facetSearch('serviceaddr','FTFT04') >福田区福田街道口岸社区图书馆 (279)</a></li><li name='FTFT06' ><a title='福田区福田街道渔农社区图书馆 (250)' href=javascript:facetSearch('serviceaddr','FTFT06') >福田区福田街道渔农社区图书馆 (250)</a></li><li name='FTLH01' ><a title='福田区莲花街道图书馆 (250)' href=javascript:facetSearch('serviceaddr','FTLH01') >福田区莲花街道图书馆 (250)</a></li><li name='FTLH05' ><a title='福田区莲花街道康欣社区图书馆 (249)' href=javascript:facetSearch('serviceaddr','FTLH05') >福田区莲花街道康欣社区图书馆 (249)</a></li><li name='FTFB01' ><a title='福田区福保街道图书馆 (247)' href=javascript:facetSearch('serviceaddr','FTFB01') >福田区福保街道图书馆 (247)</a></li><li name='FTML07' ><a title='福田区梅林街道梅林一村社区图书馆 (247)' href=javascript:facetSearch('serviceaddr','FTML07') >福田区梅林街道梅林一村社区图书馆 (247)</a></li><li name='FTHF01' ><a title='福田区华富街道图书馆 (245)' href=javascript:facetSearch('serviceaddr','FTHF01') >福田区华富街道图书馆 (245)</a></li><li name='FTYL04' ><a title='福田区园岭街道鹏盛社区图书馆 (243)' href=javascript:facetSearch('serviceaddr','FTYL04') >福田区园岭街道鹏盛社区图书馆 (243)</a></li><li name='FTFB05' ><a title='福田区福保街道石厦社区图书馆 (241)' href=javascript:facetSearch('serviceaddr','FTFB05') >福田区福保街道石厦社区图书馆 (241)</a></li><li name='FTZT08' ><a title='福田区图书馆75620部队 (239)' href=javascript:facetSearch('serviceaddr','FTZT08') >福田区图书馆75620部队 (239)</a></li><li name='FTST12' ><a title='福田区沙头街道上沙社区图书馆 (234)' href=javascript:facetSearch('serviceaddr','FTST12') >福田区沙头街道上沙社区图书馆 (234)</a></li><li name='FTHQ01' ><a title='福田区华强北街道图书馆 (233)' href=javascript:facetSearch('serviceaddr','FTHQ01') >福田区华强北街道图书馆 (233)</a></li><li name='FTST14' ><a title='福田区沙头街道全海社区图书馆 (221)' href=javascript:facetSearch('serviceaddr','FTST14') >福田区沙头街道全海社区图书馆 (221)</a></li><li name='FTLH13' ><a title='福田区莲花街道彩虹社区图书馆 (215)' href=javascript:facetSearch('serviceaddr','FTLH13') >福田区莲花街道彩虹社区图书馆 (215)</a></li><li name='FTST09' ><a title='福田区沙头街道金地社区图书馆 (209)' href=javascript:facetSearch('serviceaddr','FTST09') >福田区沙头街道金地社区图书馆 (209)</a></li><li name='FTST11' ><a title='福田区沙头街道新洲社区图书馆 (208)' href=javascript:facetSearch('serviceaddr','FTST11') >福田区沙头街道新洲社区图书馆 (208)</a></li><li name='FTST10' ><a title='福田区沙头街道翠湾社区图书馆 (198)' href=javascript:facetSearch('serviceaddr','FTST10') >福田区沙头街道翠湾社区图书馆 (198)</a></li><li name='FTZT04' ><a title='福田区图书馆舞蹈主题分馆 (195)' href=javascript:facetSearch('serviceaddr','FTZT04') >福田区图书馆舞蹈主题分馆 (195)</a></li><li name='FTXM10' ><a title='福田香蜜湖街道侨香社区图书馆 (185)' href=javascript:facetSearch('serviceaddr','FTXM10') >福田香蜜湖街道侨香社区图书馆 (185)</a></li><li name='FTLH10' ><a title='福田区莲花街道彩田社区图书馆 (183)' href=javascript:facetSearch('serviceaddr','FTLH10') >福田区莲花街道彩田社区图书馆 (183)</a></li><li name='FTML03' ><a title='福田区梅林街道梅京社区图书馆 (182)' href=javascript:facetSearch('serviceaddr','FTML03') >福田区梅林街道梅京社区图书馆 (182)</a></li><li name='FTHF04' ><a title='福田区华富街道莲花三村社区图书馆 (181)' href=javascript:facetSearch('serviceaddr','FTHF04') >福田区华富街道莲花三村社区图书馆 (181)</a></li><li name='FTML13' ><a title='福田区梅林街道梅河社区图书馆 (177)' href=javascript:facetSearch('serviceaddr','FTML13') >福田区梅林街道梅河社区图书馆 (177)</a></li><li name='FTLH06' ><a title='福田区莲花街道福新社区图书馆 (175)' href=javascript:facetSearch('serviceaddr','FTLH06') >福田区莲花街道福新社区图书馆 (175)</a></li><li name='FTML14' ><a title='福田区梅林街道翰岭社区图书馆 (174)' href=javascript:facetSearch('serviceaddr','FTML14') >福田区梅林街道翰岭社区图书馆 (174)</a></li><li name='FTML10' ><a title='福田区梅林街道上梅社区图书馆 (173)' href=javascript:facetSearch('serviceaddr','FTML10') >福田区梅林街道上梅社区图书馆 (173)</a></li><li name='FTYL08' ><a title='福田区园岭街道华林社区图书馆 (173)' href=javascript:facetSearch('serviceaddr','FTYL08') >福田区园岭街道华林社区图书馆 (173)</a></li><li name='FTHF03' ><a title='福田区华富街道莲花二村社区图书馆 (172)' href=javascript:facetSearch('serviceaddr','FTHF03') >福田区华富街道莲花二村社区图书馆 (172)</a></li><li name='FTFT03' ><a title='福田区福田街道福山社区图书馆 (170)' href=javascript:facetSearch('serviceaddr','FTFT03') >福田区福田街道福山社区图书馆 (170)</a></li><li name='FTST04' ><a title='福田区沙头街道沙咀社区图书馆 (170)' href=javascript:facetSearch('serviceaddr','FTST04') >福田区沙头街道沙咀社区图书馆 (170)</a></li><li name='FTXM09' ><a title='福田区香蜜湖街道东海社区图书馆 (170)' href=javascript:facetSearch('serviceaddr','FTXM09') >福田区香蜜湖街道东海社区图书馆 (170)</a></li><li name='FTNY07' ><a title='福田区南园街道东园巴登社区图书馆 (166)' href=javascript:facetSearch('serviceaddr','FTNY07') >福田区南园街道东园巴登社区图书馆 (166)</a></li><li name='FTNY04' ><a title='福田区南园街道南华社区图书馆 (163)' href=javascript:facetSearch('serviceaddr','FTNY04') >福田区南园街道南华社区图书馆 (163)</a></li><li name='FTYL02' ><a title='福田区园岭街道南天社区图书馆 (162)' href=javascript:facetSearch('serviceaddr','FTYL02') >福田区园岭街道南天社区图书馆 (162)</a></li><li name='FTZT07' ><a title='福田区图书馆文化创意主题分馆 (161)' href=javascript:facetSearch('serviceaddr','FTZT07') >福田区图书馆文化创意主题分馆 (161)</a></li><li name='FTXM07' ><a title='福田区香蜜湖街道香蜜社区图书馆 (160)' href=javascript:facetSearch('serviceaddr','FTXM07') >福田区香蜜湖街道香蜜社区图书馆 (160)</a></li><li name='FTYL03' ><a title='福田区园岭街道长城社区图书馆 (158)' href=javascript:facetSearch('serviceaddr','FTYL03') >福田区园岭街道长城社区图书馆 (158)</a></li><li name='FTXM04' ><a title='福田区香蜜湖街道竹林社区图书馆 (156)' href=javascript:facetSearch('serviceaddr','FTXM04') >福田区香蜜湖街道竹林社区图书馆 (156)</a></li><li name='FTFT02' ><a title='福田区福田街道福华社区图书馆 (154)' href=javascript:facetSearch('serviceaddr','FTFT02') >福田区福田街道福华社区图书馆 (154)</a></li><li name='FTXM03' ><a title='福田区香蜜湖街道香岭社区图书馆 (154)' href=javascript:facetSearch('serviceaddr','FTXM03') >福田区香蜜湖街道香岭社区图书馆 (154)</a></li><li name='FTST05' ><a title='福田区沙头街道新沙社区图书馆 (152)' href=javascript:facetSearch('serviceaddr','FTST05') >福田区沙头街道新沙社区图书馆 (152)</a></li><li name='FTML02' ><a title='福田区梅林街道孖岭社区图书馆 (151)' href=javascript:facetSearch('serviceaddr','FTML02') >福田区梅林街道孖岭社区图书馆 (151)</a></li><li name='FTXM02' ><a title='福田区香蜜湖街道香安社区图书馆 (151)' href=javascript:facetSearch('serviceaddr','FTXM02') >福田区香蜜湖街道香安社区图书馆 (151)</a></li><li name='FTLH04' ><a title='福田区莲花街道梅富社区图书馆 (149)' href=javascript:facetSearch('serviceaddr','FTLH04') >福田区莲花街道梅富社区图书馆 (149)</a></li><li name='FTLH11' ><a title='福田区莲花街道景华社区图书馆 (149)' href=javascript:facetSearch('serviceaddr','FTLH11') >福田区莲花街道景华社区图书馆 (149)</a></li><li name='FTST02' ><a title='福田区沙头街道天安社区图书馆 (147)' href=javascript:facetSearch('serviceaddr','FTST02') >福田区沙头街道天安社区图书馆 (147)</a></li><li name='FTST03' ><a title='福田区沙头街道新华社区图书馆 (145)' href=javascript:facetSearch('serviceaddr','FTST03') >福田区沙头街道新华社区图书馆 (145)</a></li><li name='FTFB02' ><a title='福田区福保街道福保社区图书馆 (144)' href=javascript:facetSearch('serviceaddr','FTFB02') >福田区福保街道福保社区图书馆 (144)</a></li><li name='FTFT07' ><a title='福田区福田街道福安社区图书馆 (144)' href=javascript:facetSearch('serviceaddr','FTFT07') >福田区福田街道福安社区图书馆 (144)</a></li><li name='FTHQ02' ><a title='福田区华强北街道福强社区图书馆 (142)' href=javascript:facetSearch('serviceaddr','FTHQ02') >福田区华强北街道福强社区图书馆 (142)</a></li><li name='FTHZ01' ><a title='福田区银鹰第一幼儿园 (140)' href=javascript:facetSearch('serviceaddr','FTHZ01') >福田区银鹰第一幼儿园 (140)</a></li><li name='FTML06' ><a title='福田区梅林街道龙尾社区图书馆 (136)' href=javascript:facetSearch('serviceaddr','FTML06') >福田区梅林街道龙尾社区图书馆 (136)</a></li><li name='FTNY09' ><a title='福田区南园街道沙埔头社区图书馆 (134)' href=javascript:facetSearch('serviceaddr','FTNY09') >福田区南园街道沙埔头社区图书馆 (134)</a></li><li name='FTFT10' ><a title='福田区福田街道圩镇社区图书馆 (133)' href=javascript:facetSearch('serviceaddr','FTFT10') >福田区福田街道圩镇社区图书馆 (133)</a></li><li name='FTML08' ><a title='福田区梅林街道梅丰社区图书馆 (133)' href=javascript:facetSearch('serviceaddr','FTML08') >福田区梅林街道梅丰社区图书馆 (133)</a></li><li name='FTLH03' ><a title='福田区莲花街道狮岭社区图书馆 (132)' href=javascript:facetSearch('serviceaddr','FTLH03') >福田区莲花街道狮岭社区图书馆 (132)</a></li><li name='FTML11' ><a title='福田区梅林街道梅都社区图书馆 (131)' href=javascript:facetSearch('serviceaddr','FTML11') >福田区梅林街道梅都社区图书馆 (131)</a></li><li name='FTFB06' ><a title='福田区福保街道新港社区图书馆 (130)' href=javascript:facetSearch('serviceaddr','FTFB06') >福田区福保街道新港社区图书馆 (130)</a></li><li name='FTML04' ><a title='福田区梅林街道新兴社区图书馆 (130)' href=javascript:facetSearch('serviceaddr','FTML04') >福田区梅林街道新兴社区图书馆 (130)</a></li><li name='FTML12' ><a title='福田区梅林街道下梅社区图书馆 (130)' href=javascript:facetSearch('serviceaddr','FTML12') >福田区梅林街道下梅社区图书馆 (130)</a></li><li name='FTFB03' ><a title='福田区福保街道益田社区图书馆 (129)' href=javascript:facetSearch('serviceaddr','FTFB03') >福田区福保街道益田社区图书馆 (129)</a></li><li name='FTNY03' ><a title='福田区南园街道滨江社区图书馆 (129)' href=javascript:facetSearch('serviceaddr','FTNY03') >福田区南园街道滨江社区图书馆 (129)</a></li><li name='FTNY08' ><a title='福田区南园街道园西社区图书馆 (127)' href=javascript:facetSearch('serviceaddr','FTNY08') >福田区南园街道园西社区图书馆 (127)</a></li><li name='FTXM05' ><a title='福田区香蜜湖街道香梅社区图书馆 (124)' href=javascript:facetSearch('serviceaddr','FTXM05') >福田区香蜜湖街道香梅社区图书馆 (124)</a></li><li name='FTHF07' ><a title='福田区华富街道田面社区图书馆 (122)' href=javascript:facetSearch('serviceaddr','FTHF07') >福田区华富街道田面社区图书馆 (122)</a></li><li name='FTHQ05' ><a title='福田区华强北街道华红社区图书馆 (122)' href=javascript:facetSearch('serviceaddr','FTHQ05') >福田区华强北街道华红社区图书馆 (122)</a></li><li name='FTLH08' ><a title='福田区莲花街道福中社区图书馆 (119)' href=javascript:facetSearch('serviceaddr','FTLH08') >福田区莲花街道福中社区图书馆 (119)</a></li><li name='FTNY12' ><a title='福田区南园街道南园社区图书馆 (119)' href=javascript:facetSearch('serviceaddr','FTNY12') >福田区南园街道南园社区图书馆 (119)</a></li><li name='FTST06' ><a title='福田区沙头街道金城社区图书馆 (118)' href=javascript:facetSearch('serviceaddr','FTST06') >福田区沙头街道金城社区图书馆 (118)</a></li><li name='FTHF06' ><a title='福田区华富街道华山社区图书馆 (116)' href=javascript:facetSearch('serviceaddr','FTHF06') >福田区华富街道华山社区图书馆 (116)</a></li><li name='FTLH07' ><a title='福田区莲花街道紫荆社区图书馆 (116)' href=javascript:facetSearch('serviceaddr','FTLH07') >福田区莲花街道紫荆社区图书馆 (116)</a></li><li name='FTLH12' ><a title='福田区莲花街道梅岭社区图书馆 (116)' href=javascript:facetSearch('serviceaddr','FTLH12') >福田区莲花街道梅岭社区图书馆 (116)</a></li><li name='FTYL07' ><a title='福田区园岭街道上林社区图书馆 (115)' href=javascript:facetSearch('serviceaddr','FTYL07') >福田区园岭街道上林社区图书馆 (115)</a></li><li name='FTNY02' ><a title='福田区南园街道滨河社区图书馆 (114)' href=javascript:facetSearch('serviceaddr','FTNY02') >福田区南园街道滨河社区图书馆 (114)</a></li><li name='FTNY05' ><a title='福田区南园街道玉田社区图书馆 (109)' href=javascript:facetSearch('serviceaddr','FTNY05') >福田区南园街道玉田社区图书馆 (109)</a></li><li name='FTZT12' ><a title='福田馆绿色低碳主题图书馆 (108)' href=javascript:facetSearch('serviceaddr','FTZT12') >福田馆绿色低碳主题图书馆 (108)</a></li><li name='FTFT09' ><a title='福田区福田街道福民社区图书馆 (107)' href=javascript:facetSearch('serviceaddr','FTFT09') >福田区福田街道福民社区图书馆 (107)</a></li><li name='FTHF09' ><a title='福田区华富街道梅岗社区图书馆 (105)' href=javascript:facetSearch('serviceaddr','FTHF09') >福田区华富街道梅岗社区图书馆 (105)</a></li><li name='FTHQ03' ><a title='福田区华强北街道荔村社区图书馆 (104)' href=javascript:facetSearch('serviceaddr','FTHQ03') >福田区华强北街道荔村社区图书馆 (104)</a></li><li name='FTHZ05' ><a title='福田区我要物流外借库（只供物流） (104)' href=javascript:facetSearch('serviceaddr','FTHZ05') >福田区我要物流外借库（只供物流） (104)</a></li><li name='FTML09' ><a title='福田区梅林街道新阁社区图书馆 (103)' href=javascript:facetSearch('serviceaddr','FTML09') >福田区梅林街道新阁社区图书馆 (103)</a></li><li name='FTST08' ><a title='福田区沙头街道沙尾社区图书馆 (103)' href=javascript:facetSearch('serviceaddr','FTST08') >福田区沙头街道沙尾社区图书馆 (103)</a></li><li name='FTFB04' ><a title='福田区福保街道明月社区图书馆 (101)' href=javascript:facetSearch('serviceaddr','FTFB04') >福田区福保街道明月社区图书馆 (101)</a></li><li name='FTML05' ><a title='福田区梅林街道梅亭社区图书馆 (96)' href=javascript:facetSearch('serviceaddr','FTML05') >福田区梅林街道梅亭社区图书馆 (96)</a></li><li name='FTHQ06' ><a title='福田区华强北街道华航社区图书馆 (93)' href=javascript:facetSearch('serviceaddr','FTHQ06') >福田区华强北街道华航社区图书馆 (93)</a></li><li name='FTHZ02' ><a title='福田区侨香公馆图书馆 (90)' href=javascript:facetSearch('serviceaddr','FTHZ02') >福田区侨香公馆图书馆 (90)</a></li><li name='FTNY06' ><a title='福田区南园街道锦龙社区图书馆 (81)' href=javascript:facetSearch('serviceaddr','FTNY06') >福田区南园街道锦龙社区图书馆 (81)</a></li><li name='FTXM06' ><a title='福田区香蜜湖街道竹园社区图书馆 (81)' href=javascript:facetSearch('serviceaddr','FTXM06') >福田区香蜜湖街道竹园社区图书馆 (81)</a></li><li name='FTST13' ><a title='福田区沙头街道金碧社区图书馆 (79)' href=javascript:facetSearch('serviceaddr','FTST13') >福田区沙头街道金碧社区图书馆 (79)</a></li><li name='FTFT05' ><a title='福田区福田街道海滨社区图书馆 (73)' href=javascript:facetSearch('serviceaddr','FTFT05') >福田区福田街道海滨社区图书馆 (73)</a></li><li name='ml' ><a title='梅林一村社区图书馆 (73)' href=javascript:facetSearch('serviceaddr','ml') >梅林一村社区图书馆 (73)</a></li><li name='FTLT06' ><a title='福田馆京华电子流通点 (71)' href=javascript:facetSearch('serviceaddr','FTLT06') >福田馆京华电子流通点 (71)</a></li><li name='FTLT03' ><a title='福田馆通天地流通点 (67)' href=javascript:facetSearch('serviceaddr','FTLT03') >福田馆通天地流通点 (67)</a></li><li name='yt' ><a title='益田村社区图书馆 (66)' href=javascript:facetSearch('serviceaddr','yt') >益田村社区图书馆 (66)</a></li><li name='FTHQ04' ><a title='福田区华强北街道通新岭社区图书馆 (61)' href=javascript:facetSearch('serviceaddr','FTHQ04') >福田区华强北街道通新岭社区图书馆 (61)</a></li><li name='FTZT10' ><a title='福田区图书馆梦工场主题分馆 (61)' href=javascript:facetSearch('serviceaddr','FTZT10') >福田区图书馆梦工场主题分馆 (61)</a></li><li name='FTZT09' ><a title='福田区图书馆非遗主题分馆 (59)' href=javascript:facetSearch('serviceaddr','FTZT09') >福田区图书馆非遗主题分馆 (59)</a></li><li name='lhb' ><a title='莲花北村社区图书馆 (58)' href=javascript:facetSearch('serviceaddr','lhb') >莲花北村社区图书馆 (58)</a></li><li name='FTHF08' ><a title='福田区华富街道新田社区图书馆 (56)' href=javascript:facetSearch('serviceaddr','FTHF08') >福田区华富街道新田社区图书馆 (56)</a></li><li name='FTHZ03' ><a title='福田区影像主题图书馆 (48)' href=javascript:facetSearch('serviceaddr','FTHZ03') >福田区影像主题图书馆 (48)</a></li><li name='STSZZY' ><a title='深圳图书馆法律分馆筹建中，暂不服务 (42)' href=javascript:facetSearch('serviceaddr','STSZZY') >深圳图书馆法律分馆筹建中，暂不服务 (42)</a></li><li name='FTLT04' ><a title='福田馆云海通讯流通点 (23)' href=javascript:facetSearch('serviceaddr','FTLT04') >福田馆云海通讯流通点 (23)</a></li><li name='FTLT01' ><a title='福田馆华阳国际流通点 (20)' href=javascript:facetSearch('serviceaddr','FTLT01') >福田馆华阳国际流通点 (20)</a></li><li name='FTHZ04' ><a title='福田区组织部党群中心 (17)' href=javascript:facetSearch('serviceaddr','FTHZ04') >福田区组织部党群中心 (17)</a></li><li name='FTFB07' ><a title='福田区福保街道桂花苑服务点 (13)' href=javascript:facetSearch('serviceaddr','FTFB07') >福田区福保街道桂花苑服务点 (13)</a></li><li name='FTZT06' ><a title='福田区图书馆音乐主题分馆 (13)' href=javascript:facetSearch('serviceaddr','FTZT06') >福田区图书馆音乐主题分馆 (13)</a></li><li name='FTZT13' ><a title='福田区图书馆613部队 (12)' href=javascript:facetSearch('serviceaddr','FTZT13') >福田区图书馆613部队 (12)</a></li><li name='SSL0222' ><a title='福田深燃学院 (12)' href=javascript:facetSearch('serviceaddr','SSL0222') >福田深燃学院 (12)</a></li><li name='SSL0008' ><a title='梅林一村87栋 (11)' href=javascript:facetSearch('serviceaddr','SSL0008') >梅林一村87栋 (11)</a></li><li name='SSL0080' ><a title='园岭长城花园 (11)' href=javascript:facetSearch('serviceaddr','SSL0080') >园岭长城花园 (11)</a></li><li name='SSL0004' ><a title='彩田村6栋 (10)' href=javascript:facetSearch('serviceaddr','SSL0004') >彩田村6栋 (10)</a></li><li name='SSL0041' ><a title='深圳图书馆北门Ⅱ (10)' href=javascript:facetSearch('serviceaddr','SSL0041') >深圳图书馆北门Ⅱ (10)</a></li><li name='SSL0223' ><a title='深圳市交通运输委员会 (10)' href=javascript:facetSearch('serviceaddr','SSL0223') >深圳市交通运输委员会 (10)</a></li><li name='SSL0005' ><a title='彩田村7栋 (8)' href=javascript:facetSearch('serviceaddr','SSL0005') >彩田村7栋 (8)</a></li><li name='SSL0006' ><a title='益田村112栋 (8)' href=javascript:facetSearch('serviceaddr','SSL0006') >益田村112栋 (8)</a></li><li name='SSL0007' ><a title='益田村116栋 (8)' href=javascript:facetSearch('serviceaddr','SSL0007') >益田村116栋 (8)</a></li><li name='SSL0009' ><a title='梅林一村18栋 (8)' href=javascript:facetSearch('serviceaddr','SSL0009') >梅林一村18栋 (8)</a></li><li name='SSL0014' ><a title='天安数码城 (8)' href=javascript:facetSearch('serviceaddr','SSL0014') >天安数码城 (8)</a></li><li name='SSL0176' ><a title='南园派出所 (8)' href=javascript:facetSearch('serviceaddr','SSL0176') >南园派出所 (8)</a></li><li name='SSL0209' ><a title='市广电集团 (8)' href=javascript:facetSearch('serviceaddr','SSL0209') >市广电集团 (8)</a></li><li name='SSL0177' ><a title='地铁集团 (7)' href=javascript:facetSearch('serviceaddr','SSL0177') >地铁集团 (7)</a></li></ul></div>
						  
                      	<div class="tab_3_text" style="display:none;">
                      	
                          	<ul class="totallist">
							<li name='044007' ><a title='宝安区图书馆 (8080)' href=javascript:facetSearch('serviceaddr','044007') >宝安区图书馆 (8080)</a></li><li name='BAF015' ><a title='宝安区松岗街道图书馆 (1596)' href=javascript:facetSearch('serviceaddr','BAF015') >宝安区松岗街道图书馆 (1596)</a></li><li name='BAF019' ><a title='宝安区石岩街道图书馆 (808)' href=javascript:facetSearch('serviceaddr','BAF019') >宝安区石岩街道图书馆 (808)</a></li><li name='BAF016' ><a title='宝安区福永街道图书馆 (725)' href=javascript:facetSearch('serviceaddr','BAF016') >宝安区福永街道图书馆 (725)</a></li><li name='BAF018' ><a title='宝安区新桥街道图书馆 (682)' href=javascript:facetSearch('serviceaddr','BAF018') >宝安区新桥街道图书馆 (682)</a></li><li name='SKYWORTH' ><a title='深圳图书馆创维分馆 (556)' href=javascript:facetSearch('serviceaddr','SKYWORTH') >深圳图书馆创维分馆 (556)</a></li><li name='BAQOLD' ><a title='[旧]宝安区老馆中文图书搬迁中（暂不外借） (448)' href=javascript:facetSearch('serviceaddr','BAQOLD') >[旧]宝安区老馆中文图书搬迁中（暂不外借） (448)</a></li><li name='BAF072' ><a title='宝安区福海街道湖畔书院•立新湖自助分馆 (321)' href=javascript:facetSearch('serviceaddr','BAF072') >宝安区福海街道湖畔书院•立新湖自助分馆 (321)</a></li><li name='BAF008' ><a title='宝安区馆新安兴东直属分馆 (303)' href=javascript:facetSearch('serviceaddr','BAF008') >宝安区馆新安兴东直属分馆 (303)</a></li><li name='BAF013' ><a title='宝安区西乡街道图书馆 (292)' href=javascript:facetSearch('serviceaddr','BAF013') >宝安区西乡街道图书馆 (292)</a></li><li name='BAF057' ><a title='宝安区图书馆深圳机场分馆 (263)' href=javascript:facetSearch('serviceaddr','BAF057') >宝安区图书馆深圳机场分馆 (263)</a></li><li name='BAFSY01' ><a title='宝安区石岩街道艾美特流动服务点 (207)' href=javascript:facetSearch('serviceaddr','BAFSY01') >宝安区石岩街道艾美特流动服务点 (207)</a></li><li name='BAF064' ><a title='宝安区燕罗街道鹏鼎阅读中心 (203)' href=javascript:facetSearch('serviceaddr','BAF064') >宝安区燕罗街道鹏鼎阅读中心 (203)</a></li><li name='BAF006' ><a title='新安翻身直属分馆（暂未开馆） (199)' href=javascript:facetSearch('serviceaddr','BAF006') >新安翻身直属分馆（暂未开馆） (199)</a></li><li name='BAF090' ><a title='宝安沙井金沙童话绘本馆（金沙分馆） (185)' href=javascript:facetSearch('serviceaddr','BAF090') >宝安沙井金沙童话绘本馆（金沙分馆） (185)</a></li><li name='BAF037' ><a title='宝安区福海街道和平阅读中心 (168)' href=javascript:facetSearch('serviceaddr','BAF037') >宝安区福海街道和平阅读中心 (168)</a></li><li name='BAF001' ><a title='宝安区馆西乡伟创力直属分馆 (167)' href=javascript:facetSearch('serviceaddr','BAF001') >宝安区馆西乡伟创力直属分馆 (167)</a></li><li name='BAF007' ><a title='宝安区馆新安中洲直属分馆 (167)' href=javascript:facetSearch('serviceaddr','BAF007') >宝安区馆新安中洲直属分馆 (167)</a></li><li name='BAF078' ><a title='宝安松岗楼岗社区阅读中心 (164)' href=javascript:facetSearch('serviceaddr','BAF078') >宝安松岗楼岗社区阅读中心 (164)</a></li><li name='BAF059' ><a title='宝安区新安街道新乐阅读中心 (160)' href=javascript:facetSearch('serviceaddr','BAF059') >宝安区新安街道新乐阅读中心 (160)</a></li><li name='BAF030' ><a title='宝安区航城街道三围阅读中心 (156)' href=javascript:facetSearch('serviceaddr','BAF030') >宝安区航城街道三围阅读中心 (156)</a></li><li name='BAF044' ><a title='宝安区沙井街道辛养阅读中心 (156)' href=javascript:facetSearch('serviceaddr','BAF044') >宝安区沙井街道辛养阅读中心 (156)</a></li><li name='BAF065' ><a title='宝安区图书馆西乡流塘分馆 (155)' href=javascript:facetSearch('serviceaddr','BAF065') >宝安区图书馆西乡流塘分馆 (155)</a></li><li name='BAFDC01' ><a title='宝安区新桥街道德昌流动服务点 (153)' href=javascript:facetSearch('serviceaddr','BAFDC01') >宝安区新桥街道德昌流动服务点 (153)</a></li><li name='BAF003' ><a title='宝安区馆沙井畅鸿直属分馆 (150)' href=javascript:facetSearch('serviceaddr','BAF003') >宝安区馆沙井畅鸿直属分馆 (150)</a></li><li name='BAF050' ><a title='宝安区松岗街道江边阅读中心 (147)' href=javascript:facetSearch('serviceaddr','BAF050') >宝安区松岗街道江边阅读中心 (147)</a></li><li name='BAF024' ><a title='宝安区新安街道甲岸阅读中心 (145)' href=javascript:facetSearch('serviceaddr','BAF024') >宝安区新安街道甲岸阅读中心 (145)</a></li><li name='BAF056' ><a title='宝安区西乡街道御龙居流动服务点 (145)' href=javascript:facetSearch('serviceaddr','BAF056') >宝安区西乡街道御龙居流动服务点 (145)</a></li><li name='BAF033' ><a title='宝安区西乡街道西乡金港华庭阅读中心 (144)' href=javascript:facetSearch('serviceaddr','BAF033') >宝安区西乡街道西乡金港华庭阅读中心 (144)</a></li><li name='BAF054' ><a title='宝安区石岩街道方正科技园阅读中心 (144)' href=javascript:facetSearch('serviceaddr','BAF054') >宝安区石岩街道方正科技园阅读中心 (144)</a></li><li name='BAF043' ><a title='宝安区沙井街道壆岗阅读中心 (139)' href=javascript:facetSearch('serviceaddr','BAF043') >宝安区沙井街道壆岗阅读中心 (139)</a></li><li name='BAF046' ><a title='宝安区新桥街道黄埔阅读中心 (132)' href=javascript:facetSearch('serviceaddr','BAF046') >宝安区新桥街道黄埔阅读中心 (132)</a></li><li name='BAF004' ><a title='宝安区馆石岩水田直属分馆 (131)' href=javascript:facetSearch('serviceaddr','BAF004') >宝安区馆石岩水田直属分馆 (131)</a></li><li name='UTL022' ><a title='深圳大学城图书馆宝安桃花源创业园服务站 (127)' href=javascript:facetSearch('serviceaddr','UTL022') >深圳大学城图书馆宝安桃花源创业园服务站 (127)</a></li><li name='BAF052' ><a title='宝安区燕罗街道洪桥头阅读中心 (125)' href=javascript:facetSearch('serviceaddr','BAF052') >宝安区燕罗街道洪桥头阅读中心 (125)</a></li><li name='BAF023' ><a title='宝安区新安街道洪浪阅读中心 (124)' href=javascript:facetSearch('serviceaddr','BAF023') >宝安区新安街道洪浪阅读中心 (124)</a></li><li name='BAF038' ><a title='宝安区燕罗街道劲嘉阅读中心 (124)' href=javascript:facetSearch('serviceaddr','BAF038') >宝安区燕罗街道劲嘉阅读中心 (124)</a></li><li name='BAF036' ><a title='宝安区福永街道福永听涛雅苑阅读中心 (123)' href=javascript:facetSearch('serviceaddr','BAF036') >宝安区福永街道福永听涛雅苑阅读中心 (123)</a></li><li name='BAF047' ><a title='宝安区燕罗街道罗田阅读中心 (123)' href=javascript:facetSearch('serviceaddr','BAF047') >宝安区燕罗街道罗田阅读中心 (123)</a></li><li name='BAF032' ><a title='宝安区西乡街道永丰（香缇湾）阅读中心 (121)' href=javascript:facetSearch('serviceaddr','BAF032') >宝安区西乡街道永丰（香缇湾）阅读中心 (121)</a></li><li name='BAF035' ><a title='宝安区福海街道桥头富桥阅读中心 (121)' href=javascript:facetSearch('serviceaddr','BAF035') >宝安区福海街道桥头富桥阅读中心 (121)</a></li><li name='BAF048' ><a title='宝安区燕罗街道塘下涌阅读中心 (119)' href=javascript:facetSearch('serviceaddr','BAF048') >宝安区燕罗街道塘下涌阅读中心 (119)</a></li><li name='BAF040' ><a title='宝安区沙井街道步涌阅读中心 (117)' href=javascript:facetSearch('serviceaddr','BAF040') >宝安区沙井街道步涌阅读中心 (117)</a></li><li name='BAF085' ><a title='宝安石岩奋达流动服务点 (113)' href=javascript:facetSearch('serviceaddr','BAF085') >宝安石岩奋达流动服务点 (113)</a></li><li name='BAF069' ><a title='宝安区沙井街道柏亚阅读（百川）流动服务点 (106)' href=javascript:facetSearch('serviceaddr','BAF069') >宝安区沙井街道柏亚阅读（百川）流动服务点 (106)</a></li><li name='BAF034' ><a title='宝安区福永街道兴围阅读中心 (105)' href=javascript:facetSearch('serviceaddr','BAF034') >宝安区福永街道兴围阅读中心 (105)</a></li><li name='BAF045' ><a title='宝安区新桥街道沙企阅读中心 (104)' href=javascript:facetSearch('serviceaddr','BAF045') >宝安区新桥街道沙企阅读中心 (104)</a></li><li name='BAF051' ><a title='宝安区松岗街道朗下阅读中心 (103)' href=javascript:facetSearch('serviceaddr','BAF051') >宝安区松岗街道朗下阅读中心 (103)</a></li><li name='BAF029' ><a title='宝安区西乡街道固戍阅读中心 (101)' href=javascript:facetSearch('serviceaddr','BAF029') >宝安区西乡街道固戍阅读中心 (101)</a></li><li name='BAF074' ><a title='宝安区沙井街道捷普绿点流动服务点 (101)' href=javascript:facetSearch('serviceaddr','BAF074') >宝安区沙井街道捷普绿点流动服务点 (101)</a></li><li name='BAF028' ><a title='宝安区航城街道鹤洲阅读中心 (100)' href=javascript:facetSearch('serviceaddr','BAF028') >宝安区航城街道鹤洲阅读中心 (100)</a></li><li name='BAF039' ><a title='宝安区沙井街道沙四阅读中心 (97)' href=javascript:facetSearch('serviceaddr','BAF039') >宝安区沙井街道沙四阅读中心 (97)</a></li><li name='BAF041' ><a title='宝安区新桥街道新桥阅读中心 (97)' href=javascript:facetSearch('serviceaddr','BAF041') >宝安区新桥街道新桥阅读中心 (97)</a></li><li name='BAF081' ><a title='宝安福海莱尔德流动服务点 (95)' href=javascript:facetSearch('serviceaddr','BAF081') >宝安福海莱尔德流动服务点 (95)</a></li><li name='BAF053' ><a title='宝安区石岩街道罗租阅读中心 (94)' href=javascript:facetSearch('serviceaddr','BAF053') >宝安区石岩街道罗租阅读中心 (94)</a></li><li name='BAF031' ><a title='宝安区西乡街道银田阅读中心 (92)' href=javascript:facetSearch('serviceaddr','BAF031') >宝安区西乡街道银田阅读中心 (92)</a></li><li name='BAF093' ><a title='宝安航城黄麻布流动服务点 (89)' href=javascript:facetSearch('serviceaddr','BAF093') >宝安航城黄麻布流动服务点 (89)</a></li><li name='BAF061' ><a title='宝安区西乡街道西体阅读中心 (88)' href=javascript:facetSearch('serviceaddr','BAF061') >宝安区西乡街道西体阅读中心 (88)</a></li><li name='BAF042' ><a title='宝安区新桥街道新二阅读中心 (87)' href=javascript:facetSearch('serviceaddr','BAF042') >宝安区新桥街道新二阅读中心 (87)</a></li><li name='BAF092' ><a title='宝安沙井毅弘流动服务点 (86)' href=javascript:facetSearch('serviceaddr','BAF092') >宝安沙井毅弘流动服务点 (86)</a></li><li name='BAF049' ><a title='宝安区燕罗街道燕川北阅读中心 (85)' href=javascript:facetSearch('serviceaddr','BAF049') >宝安区燕罗街道燕川北阅读中心 (85)</a></li><li name='BAF063' ><a title='宝安区福海街道塘尾阅读中心 (84)' href=javascript:facetSearch('serviceaddr','BAF063') >宝安区福海街道塘尾阅读中心 (84)</a></li><li name='BAF025' ><a title='宝安区新安街道建安阅读中心 (81)' href=javascript:facetSearch('serviceaddr','BAF025') >宝安区新安街道建安阅读中心 (81)</a></li><li name='BAF060' ><a title='宝安区新安街道上合阅读中心 (80)' href=javascript:facetSearch('serviceaddr','BAF060') >宝安区新安街道上合阅读中心 (80)</a></li><li name='BAF076' ><a title='宝安新桥党群流动服务点 (80)' href=javascript:facetSearch('serviceaddr','BAF076') >宝安新桥党群流动服务点 (80)</a></li><li name='BAF062' ><a title='宝安区福海街道大洋阅读中心 (77)' href=javascript:facetSearch('serviceaddr','BAF062') >宝安区福海街道大洋阅读中心 (77)</a></li><li name='BAF079' ><a title='宝安福海福宁流动服务点 (65)' href=javascript:facetSearch('serviceaddr','BAF079') >宝安福海福宁流动服务点 (65)</a></li><li name='BAF070' ><a title='宝安区沙井街道后亭阅读中心 (63)' href=javascript:facetSearch('serviceaddr','BAF070') >宝安区沙井街道后亭阅读中心 (63)</a></li><li name='BAF082' ><a title='宝安福海未来星流动服务点 (59)' href=javascript:facetSearch('serviceaddr','BAF082') >宝安福海未来星流动服务点 (59)</a></li><li name='BAF005' ><a title='宝安区馆新安街道直属分馆 (54)' href=javascript:facetSearch('serviceaddr','BAF005') >宝安区馆新安街道直属分馆 (54)</a></li><li name='BAF055' ><a title='宝安区图书馆1990分馆（原区图书馆老馆） (54)' href=javascript:facetSearch('serviceaddr','BAF055') >宝安区图书馆1990分馆（原区图书馆老馆） (54)</a></li><li name='BAF058' ><a title='宝安图书馆海裕阅读中心 (54)' href=javascript:facetSearch('serviceaddr','BAF058') >宝安图书馆海裕阅读中心 (54)</a></li><li name='BAF075' ><a title='宝安西乡钟屋流动服务点 (43)' href=javascript:facetSearch('serviceaddr','BAF075') >宝安西乡钟屋流动服务点 (43)</a></li><li name='BAF080' ><a title='宝安沙井街道蚝乡流动服务点 (43)' href=javascript:facetSearch('serviceaddr','BAF080') >宝安沙井街道蚝乡流动服务点 (43)</a></li><li name='BAF084' ><a title='宝安福海长盈精密流动服务点 (41)' href=javascript:facetSearch('serviceaddr','BAF084') >宝安福海长盈精密流动服务点 (41)</a></li><li name='BAF083' ><a title='宝安福永金石雅苑社区阅读中心 (40)' href=javascript:facetSearch('serviceaddr','BAF083') >宝安福永金石雅苑社区阅读中心 (40)</a></li><li name='BAF094' ><a title='宝安燕罗党建流动服务点 (36)' href=javascript:facetSearch('serviceaddr','BAF094') >宝安燕罗党建流动服务点 (36)</a></li><li name='BAF073' ><a title='宝安区航城街道宝安职校流动服务点 (35)' href=javascript:facetSearch('serviceaddr','BAF073') >宝安区航城街道宝安职校流动服务点 (35)</a></li><li name='BAF077' ><a title='宝安新安御景湾流动服务点 (34)' href=javascript:facetSearch('serviceaddr','BAF077') >宝安新安御景湾流动服务点 (34)</a></li><li name='BAF091' ><a title='宝安燕罗罗田森林公园流动服务点 (31)' href=javascript:facetSearch('serviceaddr','BAF091') >宝安燕罗罗田森林公园流动服务点 (31)</a></li><li name='BAMBY' ><a title='宝安区慢性病院图书馆 (24)' href=javascript:facetSearch('serviceaddr','BAMBY') >宝安区慢性病院图书馆 (24)</a></li><li name='BAF071' ><a title='宝安区新安街道区党建服务中心流动服务点 (19)' href=javascript:facetSearch('serviceaddr','BAF071') >宝安区新安街道区党建服务中心流动服务点 (19)</a></li><li name='SSL0166' ><a title='洪浪社区 (14)' href=javascript:facetSearch('serviceaddr','SSL0166') >洪浪社区 (14)</a></li><li name='SSL0501' ><a title='宝安区政府 (14)' href=javascript:facetSearch('serviceaddr','SSL0501') >宝安区政府 (14)</a></li><li name='SSL0238' ><a title='宝安泰华梧桐工业园 (12)' href=javascript:facetSearch('serviceaddr','SSL0238') >宝安泰华梧桐工业园 (12)</a></li><li name='SSL0083' ><a title='西乡阳光海湾花园 (11)' href=javascript:facetSearch('serviceaddr','SSL0083') >西乡阳光海湾花园 (11)</a></li><li name='SSL0180' ><a title='深圳航空 (11)' href=javascript:facetSearch('serviceaddr','SSL0180') >深圳航空 (11)</a></li><li name='BAFSJ01' ><a title='宝安沙井沙二社区服务点内部借阅 (10)' href=javascript:facetSearch('serviceaddr','BAFSJ01') >宝安沙井沙二社区服务点内部借阅 (10)</a></li><li name='SSL0047' ><a title='宝安机场 (10)' href=javascript:facetSearch('serviceaddr','SSL0047') >宝安机场 (10)</a></li><li name='SSL0130' ><a title='西乡天骄世家 (10)' href=javascript:facetSearch('serviceaddr','SSL0130') >西乡天骄世家 (10)</a></li><li name='SSL0077' ><a title='新安海华社区 (9)' href=javascript:facetSearch('serviceaddr','SSL0077') >新安海华社区 (9)</a></li><li name='SSL0181' ><a title='金泓凯旋城 (9)' href=javascript:facetSearch('serviceaddr','SSL0181') >金泓凯旋城 (9)</a></li><li name='SSL0093' ><a title='石岩同富康水田工业区 (8)' href=javascript:facetSearch('serviceaddr','SSL0093') >石岩同富康水田工业区 (8)</a></li><li name='SSL0125' ><a title='松岗中海西岸华府 (8)' href=javascript:facetSearch('serviceaddr','SSL0125') >松岗中海西岸华府 (8)</a></li><li name='SSL0155' ><a title='西乡大益广场 (8)' href=javascript:facetSearch('serviceaddr','SSL0155') >西乡大益广场 (8)</a></li><li name='SSL0159' ><a title='宝安新桥中心公园 (8)' href=javascript:facetSearch('serviceaddr','SSL0159') >宝安新桥中心公园 (8)</a></li><li name='SSL0220' ><a title='福永新文化艺术中心 (8)' href=javascript:facetSearch('serviceaddr','SSL0220') >福永新文化艺术中心 (8)</a></li><li name='SSL0237' ><a title='松岗街道中心图书馆 (8)' href=javascript:facetSearch('serviceaddr','SSL0237') >松岗街道中心图书馆 (8)</a></li><li name='SSL0085' ><a title='新安高发西岸花园 (7)' href=javascript:facetSearch('serviceaddr','SSL0085') >新安高发西岸花园 (7)</a></li><li name='SSL0108' ><a title='西乡丽景城 (7)' href=javascript:facetSearch('serviceaddr','SSL0108') >西乡丽景城 (7)</a></li><li name='SSL0147' ><a title='西乡体育中心 (7)' href=javascript:facetSearch('serviceaddr','SSL0147') >西乡体育中心 (7)</a></li></ul></div>
						  
                      	<div class="tab_3_text" style="display:none;">
                      	
                          	<ul class="totallist">
							<li name='044006' ><a title='南山图书馆 (6156)' href=javascript:facetSearch('serviceaddr','044006') >南山图书馆 (6156)</a></li><li name='F44010' ><a title='深圳大学城图书馆（深圳市科技图书馆） (3917)' href=javascript:facetSearch('serviceaddr','F44010') >深圳大学城图书馆（深圳市科技图书馆） (3917)</a></li><li name='NSL027' ><a title='南山图书馆蛇口育才分馆 (1290)' href=javascript:facetSearch('serviceaddr','NSL027') >南山图书馆蛇口育才分馆 (1290)</a></li><li name='NSL024' ><a title='南山图书馆华侨城分馆 (991)' href=javascript:facetSearch('serviceaddr','NSL024') >南山图书馆华侨城分馆 (991)</a></li><li name='NSL021' ><a title='南山图书馆百旺信分馆 (899)' href=javascript:facetSearch('serviceaddr','NSL021') >南山图书馆百旺信分馆 (899)</a></li><li name='NSL026' ><a title='南山图书馆同富裕分馆 (844)' href=javascript:facetSearch('serviceaddr','NSL026') >南山图书馆同富裕分馆 (844)</a></li><li name='NSL028' ><a title='南山图书馆桃源分馆 (587)' href=javascript:facetSearch('serviceaddr','NSL028') >南山图书馆桃源分馆 (587)</a></li><li name='NSL025' ><a title='南山图书馆设计分馆 (470)' href=javascript:facetSearch('serviceaddr','NSL025') >南山图书馆设计分馆 (470)</a></li><li name='NSL022' ><a title='南山图书馆赤湾分馆 (461)' href=javascript:facetSearch('serviceaddr','NSL022') >南山图书馆赤湾分馆 (461)</a></li><li name='NSL023' ><a title='南山图书馆高新分馆 (349)' href=javascript:facetSearch('serviceaddr','NSL023') >南山图书馆高新分馆 (349)</a></li><li name='UTL028' ><a title='深圳大学城图书馆软件产业基地服务站 (278)' href=javascript:facetSearch('serviceaddr','UTL028') >深圳大学城图书馆软件产业基地服务站 (278)</a></li><li name='UTL027' ><a title='清华深研院分馆（院内） (189)' href=javascript:facetSearch('serviceaddr','UTL027') >清华深研院分馆（院内） (189)</a></li><li name='NSL029' ><a title='阳光棕榈社区图书馆 (107)' href=javascript:facetSearch('serviceaddr','NSL029') >阳光棕榈社区图书馆 (107)</a></li><li name='UTL025' ><a title='中科院深圳先进技术研究院（不对外） (97)' href=javascript:facetSearch('serviceaddr','UTL025') >中科院深圳先进技术研究院（不对外） (97)</a></li><li name='NSL030' ><a title='南山图书馆军营分馆1 (86)' href=javascript:facetSearch('serviceaddr','NSL030') >南山图书馆军营分馆1 (86)</a></li><li name='UTL023' ><a title='深圳大学城图书馆南山数字文化产业基地服务站 (79)' href=javascript:facetSearch('serviceaddr','UTL023') >深圳大学城图书馆南山数字文化产业基地服务站 (79)</a></li><li name='UTL024' ><a title='深圳大学城图书馆大学城创业园服务站 (75)' href=javascript:facetSearch('serviceaddr','UTL024') >深圳大学城图书馆大学城创业园服务站 (75)</a></li><li name='NSL032' ><a title='南山前海花园社区工作站 (44)' href=javascript:facetSearch('serviceaddr','NSL032') >南山前海花园社区工作站 (44)</a></li><li name='STQXGFG' ><a title='深图求贤阁分馆人才公园内 (25)' href=javascript:facetSearch('serviceaddr','STQXGFG') >深图求贤阁分馆人才公园内 (25)</a></li><li name='NSL031' ><a title='南山馆-公众法律分馆 (14)' href=javascript:facetSearch('serviceaddr','NSL031') >南山馆-公众法律分馆 (14)</a></li><li name='SSL0040' ><a title='华侨城 (13)' href=javascript:facetSearch('serviceaddr','SSL0040') >华侨城 (13)</a></li><li name='SSL0149' ><a title='南方科技大学 (12)' href=javascript:facetSearch('serviceaddr','SSL0149') >南方科技大学 (12)</a></li><li name='SSL0221' ><a title='中兴人才公寓 (12)' href=javascript:facetSearch('serviceaddr','SSL0221') >中兴人才公寓 (12)</a></li><li name='SSL0021' ><a title='南山蔚蓝海岸 (11)' href=javascript:facetSearch('serviceaddr','SSL0021') >南山蔚蓝海岸 (11)</a></li><li name='SSL0059' ><a title='华侨城生态广场 (11)' href=javascript:facetSearch('serviceaddr','SSL0059') >华侨城生态广场 (11)</a></li><li name='SSL0131' ><a title='南山西丽小学 (11)' href=javascript:facetSearch('serviceaddr','SSL0131') >南山西丽小学 (11)</a></li><li name='SSL0224' ><a title='南山世外桃源创意园 (11)' href=javascript:facetSearch('serviceaddr','SSL0224') >南山世外桃源创意园 (11)</a></li><li name='SSL0011' ><a title='桃源村教师公寓 (10)' href=javascript:facetSearch('serviceaddr','SSL0011') >桃源村教师公寓 (10)</a></li><li name='SSL0107' ><a title='南山前海小学 (9)' href=javascript:facetSearch('serviceaddr','SSL0107') >南山前海小学 (9)</a></li><li name='SSL0154' ><a title='南山宝珠花园 (9)' href=javascript:facetSearch('serviceaddr','SSL0154') >南山宝珠花园 (9)</a></li><li name='SSL0010' ><a title='桃源村 (8)' href=javascript:facetSearch('serviceaddr','SSL0010') >桃源村 (8)</a></li><li name='SSL0034' ><a title='南山集悦城 (8)' href=javascript:facetSearch('serviceaddr','SSL0034') >南山集悦城 (8)</a></li><li name='SSL0165' ><a title='中科大厦 (8)' href=javascript:facetSearch('serviceaddr','SSL0165') >中科大厦 (8)</a></li><li name='SSL0202' ><a title='南山深云村 (7)' href=javascript:facetSearch('serviceaddr','SSL0202') >南山深云村 (7)</a></li><li name='SSL0901' ><a title='华强文化科技集团 (7)' href=javascript:facetSearch('serviceaddr','SSL0901') >华强文化科技集团 (7)</a></li></ul></div>
						  
                      	<div class="tab_3_text" style="display:none;">
                      	
                          	<ul class="totallist">
							<li name='044120' ><a title='龙岗图书馆 (5645)' href=javascript:facetSearch('serviceaddr','044120') >龙岗图书馆 (5645)</a></li><li name='LGL025' ><a title='龙岗图书馆横岗分馆 (740)' href=javascript:facetSearch('serviceaddr','LGL025') >龙岗图书馆横岗分馆 (740)</a></li><li name='LGL035' ><a title='龙岗图书馆龙岗街道分馆 (731)' href=javascript:facetSearch('serviceaddr','LGL035') >龙岗图书馆龙岗街道分馆 (731)</a></li><li name='LGL023' ><a title='龙岗图书馆平湖分馆 (508)' href=javascript:facetSearch('serviceaddr','LGL023') >龙岗图书馆平湖分馆 (508)</a></li><li name='LGL049' ><a title='龙岗龙岭学校自助分馆 (468)' href=javascript:facetSearch('serviceaddr','LGL049') >龙岗龙岭学校自助分馆 (468)</a></li><li name='LGL052' ><a title='龙岗图书馆南坑自助分馆 (382)' href=javascript:facetSearch('serviceaddr','LGL052') >龙岗图书馆南坑自助分馆 (382)</a></li><li name='LGL041' ><a title='龙岗图书馆布吉分馆 (341)' href=javascript:facetSearch('serviceaddr','LGL041') >龙岗图书馆布吉分馆 (341)</a></li><li name='LGL043' ><a title='龙岗图书馆坂田分馆 (331)' href=javascript:facetSearch('serviceaddr','LGL043') >龙岗图书馆坂田分馆 (331)</a></li><li name='LGL053' ><a title='龙岗图书馆天安云谷自助分馆 (327)' href=javascript:facetSearch('serviceaddr','LGL053') >龙岗图书馆天安云谷自助分馆 (327)</a></li><li name='LGL033' ><a title='龙岗图书馆赐昱分馆 (323)' href=javascript:facetSearch('serviceaddr','LGL033') >龙岗图书馆赐昱分馆 (323)</a></li><li name='LGL038' ><a title='龙岗图书馆金积嘉分馆 (320)' href=javascript:facetSearch('serviceaddr','LGL038') >龙岗图书馆金积嘉分馆 (320)</a></li><li name='LGL029' ><a title='龙岗图书馆坪地分馆 (312)' href=javascript:facetSearch('serviceaddr','LGL029') >龙岗图书馆坪地分馆 (312)</a></li><li name='LGL036' ><a title='龙岗图书馆欧帝分馆 (304)' href=javascript:facetSearch('serviceaddr','LGL036') >龙岗图书馆欧帝分馆 (304)</a></li><li name='LGL045' ><a title='龙岗图书馆南岭村社区自助分馆 (271)' href=javascript:facetSearch('serviceaddr','LGL045') >龙岗图书馆南岭村社区自助分馆 (271)</a></li><li name='LGL028' ><a title='龙岗图书馆唯真分馆 (256)' href=javascript:facetSearch('serviceaddr','LGL028') >龙岗图书馆唯真分馆 (256)</a></li><li name='LGL022' ><a title='龙岗图书馆联创分馆 (252)' href=javascript:facetSearch('serviceaddr','LGL022') >龙岗图书馆联创分馆 (252)</a></li><li name='LGL027' ><a title='龙岗图书馆天基分馆 (239)' href=javascript:facetSearch('serviceaddr','LGL027') >龙岗图书馆天基分馆 (239)</a></li><li name='LGL058' ><a title='龙岗大运美术自助分馆 (220)' href=javascript:facetSearch('serviceaddr','LGL058') >龙岗大运美术自助分馆 (220)</a></li><li name='LGL039' ><a title='龙岗图书馆中南分馆 (215)' href=javascript:facetSearch('serviceaddr','LGL039') >龙岗图书馆中南分馆 (215)</a></li><li name='LGL048' ><a title='龙岗图书馆南约自助分馆 (205)' href=javascript:facetSearch('serviceaddr','LGL048') >龙岗图书馆南约自助分馆 (205)</a></li><li name='LGL037' ><a title='龙岗图书馆冠旭分馆 (197)' href=javascript:facetSearch('serviceaddr','LGL037') >龙岗图书馆冠旭分馆 (197)</a></li><li name='LGL046' ><a title='龙岗图书馆坪西自助分馆 (180)' href=javascript:facetSearch('serviceaddr','LGL046') >龙岗图书馆坪西自助分馆 (180)</a></li><li name='LGL042' ><a title='龙岗图书馆南湾分馆 (173)' href=javascript:facetSearch('serviceaddr','LGL042') >龙岗图书馆南湾分馆 (173)</a></li><li name='LGL047' ><a title='龙岗区图书馆龙东社区自助分馆 (173)' href=javascript:facetSearch('serviceaddr','LGL047') >龙岗区图书馆龙东社区自助分馆 (173)</a></li><li name='LGL056' ><a title='龙岗图书馆回龙埔自助分馆 (166)' href=javascript:facetSearch('serviceaddr','LGL056') >龙岗图书馆回龙埔自助分馆 (166)</a></li><li name='LGL050' ><a title='龙岗墟自助分馆 (153)' href=javascript:facetSearch('serviceaddr','LGL050') >龙岗墟自助分馆 (153)</a></li><li name='LGL054' ><a title='龙岗区图书馆天安数码自助分馆 (153)' href=javascript:facetSearch('serviceaddr','LGL054') >龙岗区图书馆天安数码自助分馆 (153)</a></li><li name='LGL030' ><a title='龙岗图书馆方正分馆 (145)' href=javascript:facetSearch('serviceaddr','LGL030') >龙岗图书馆方正分馆 (145)</a></li><li name='LGL040' ><a title='龙岗图书馆信义分馆 (144)' href=javascript:facetSearch('serviceaddr','LGL040') >龙岗图书馆信义分馆 (144)</a></li><li name='LGL060' ><a title='龙岗图书馆微谷众创社区自助分馆 (119)' href=javascript:facetSearch('serviceaddr','LGL060') >龙岗图书馆微谷众创社区自助分馆 (119)</a></li><li name='LGL065' ><a title='龙岗区馆青少年借阅室 (107)' href=javascript:facetSearch('serviceaddr','LGL065') >龙岗区馆青少年借阅室 (107)</a></li><li name='LGL057' ><a title='龙岗图书馆坪东社区分馆 (104)' href=javascript:facetSearch('serviceaddr','LGL057') >龙岗图书馆坪东社区分馆 (104)</a></li><li name='LGL062' ><a title='龙岗领创天下分馆 (90)' href=javascript:facetSearch('serviceaddr','LGL062') >龙岗领创天下分馆 (90)</a></li><li name='LGL061' ><a title='龙岗如一基层服务点 (72)' href=javascript:facetSearch('serviceaddr','LGL061') >龙岗如一基层服务点 (72)</a></li><li name='044WL' ><a title='物流转运 (63)' href=javascript:facetSearch('serviceaddr','044WL') >物流转运 (63)</a></li><li name='LGL051' ><a title='龙岗吉厦社区分馆 (63)' href=javascript:facetSearch('serviceaddr','LGL051') >龙岗吉厦社区分馆 (63)</a></li><li name='UTL021' ><a title='深圳大学城图书馆龙岗留学人员创业园服务站 (61)' href=javascript:facetSearch('serviceaddr','UTL021') >深圳大学城图书馆龙岗留学人员创业园服务站 (61)</a></li><li name='LGL063' ><a title='龙岗康利城分馆 (25)' href=javascript:facetSearch('serviceaddr','LGL063') >龙岗康利城分馆 (25)</a></li><li name='SSL0013' ><a title='龙岗兆弛科技园 (10)' href=javascript:facetSearch('serviceaddr','SSL0013') >龙岗兆弛科技园 (10)</a></li><li name='SSL0019' ><a title='布吉可园 (9)' href=javascript:facetSearch('serviceaddr','SSL0019') >布吉可园 (9)</a></li><li name='SSL0086' ><a title='横岗信义锦绣花园 (9)' href=javascript:facetSearch('serviceaddr','SSL0086') >横岗信义锦绣花园 (9)</a></li><li name='SSL0122' ><a title='龙城新秀新村 (8)' href=javascript:facetSearch('serviceaddr','SSL0122') >龙城新秀新村 (8)</a></li><li name='SSL0228' ><a title='龙岗翠枫学校 (8)' href=javascript:facetSearch('serviceaddr','SSL0228') >龙岗翠枫学校 (8)</a></li><li name='SSL0039' ><a title='坂田第五园 (7)' href=javascript:facetSearch('serviceaddr','SSL0039') >坂田第五园 (7)</a></li><li name='SSL0090' ><a title='横岗振业城 (7)' href=javascript:facetSearch('serviceaddr','SSL0090') >横岗振业城 (7)</a></li><li name='SSL0132' ><a title='布吉龙园意境花园 (7)' href=javascript:facetSearch('serviceaddr','SSL0132') >布吉龙园意境花园 (7)</a></li><li name='SSL0145' ><a title='龙岗宝福珠宝园 (7)' href=javascript:facetSearch('serviceaddr','SSL0145') >龙岗宝福珠宝园 (7)</a></li><li name='SSL0229' ><a title='龙岗华南城 (7)' href=javascript:facetSearch('serviceaddr','SSL0229') >龙岗华南城 (7)</a></li><li name='SSL0233' ><a title='横岗文体广场 (7)' href=javascript:facetSearch('serviceaddr','SSL0233') >横岗文体广场 (7)</a></li></ul></div>
						  
                      	<div class="tab_3_text" style="display:none;">
                      	
                          	<ul class="totallist">
							<li name='044010' ><a title='罗湖区图书馆 (5382)' href=javascript:facetSearch('serviceaddr','044010') >罗湖区图书馆 (5382)</a></li><li name='LHL024' ><a title='罗湖区桂园街道分馆 (538)' href=javascript:facetSearch('serviceaddr','LHL024') >罗湖区桂园街道分馆 (538)</a></li><li name='LHL022' ><a title='罗湖区黄贝街道图书馆 (333)' href=javascript:facetSearch('serviceaddr','LHL022') >罗湖区黄贝街道图书馆 (333)</a></li><li name='LHL021' ><a title='罗湖区东晓街道图书馆 (308)' href=javascript:facetSearch('serviceaddr','LHL021') >罗湖区东晓街道图书馆 (308)</a></li><li name='LHL023' ><a title='[停]罗湖区南湖街道图书馆 (272)' href=javascript:facetSearch('serviceaddr','LHL023') >[停]罗湖区南湖街道图书馆 (272)</a></li><li name='LHL025' ><a title='罗湖图书馆弘法寺分馆 (212)' href=javascript:facetSearch('serviceaddr','LHL025') >罗湖图书馆弘法寺分馆 (212)</a></li><li name='LHF012' ><a title='悠•图书馆（东湖中学） (110)' href=javascript:facetSearch('serviceaddr','LHF012') >悠•图书馆（东湖中学） (110)</a></li><li name='LHF014' ><a title='悠·图书馆（鹏兴社区） (101)' href=javascript:facetSearch('serviceaddr','LHF014') >悠·图书馆（鹏兴社区） (101)</a></li><li name='LHF009' ><a title='悠•图书馆（文华社区） (98)' href=javascript:facetSearch('serviceaddr','LHF009') >悠•图书馆（文华社区） (98)</a></li><li name='LHF010' ><a title='悠•图书馆（楼尚文化创意产业园） (77)' href=javascript:facetSearch('serviceaddr','LHF010') >悠•图书馆（楼尚文化创意产业园） (77)</a></li><li name='LHF017' ><a title='悠·图书馆（宁水社区） (74)' href=javascript:facetSearch('serviceaddr','LHF017') >悠·图书馆（宁水社区） (74)</a></li><li name='LHF013' ><a title='悠·图书馆（C33 创新产业园） (39)' href=javascript:facetSearch('serviceaddr','LHF013') >悠·图书馆（C33 创新产业园） (39)</a></li><li name='SSL0074' ><a title='缤纷时代家园 (13)' href=javascript:facetSearch('serviceaddr','SSL0074') >缤纷时代家园 (13)</a></li><li name='SSL0117' ><a title='市工人文化宫 (13)' href=javascript:facetSearch('serviceaddr','SSL0117') >市工人文化宫 (13)</a></li><li name='SSL0118' ><a title='罗湖文锦广场 (12)' href=javascript:facetSearch('serviceaddr','SSL0118') >罗湖文锦广场 (12)</a></li><li name='SSL0121' ><a title='罗湖金丽珠宝中心 (12)' href=javascript:facetSearch('serviceaddr','SSL0121') >罗湖金丽珠宝中心 (12)</a></li><li name='SSL0012' ><a title='渔民村 (11)' href=javascript:facetSearch('serviceaddr','SSL0012') >渔民村 (11)</a></li><li name='SSL0048' ><a title='黄贝新天地 (11)' href=javascript:facetSearch('serviceaddr','SSL0048') >黄贝新天地 (11)</a></li><li name='SSL0079' ><a title='清水河龙园山庄 (11)' href=javascript:facetSearch('serviceaddr','SSL0079') >清水河龙园山庄 (11)</a></li><li name='SSL0065' ><a title='边检总站 (9)' href=javascript:facetSearch('serviceaddr','SSL0065') >边检总站 (9)</a></li><li name='SSL0072' ><a title='翠竹水贝泊林花园 (9)' href=javascript:facetSearch('serviceaddr','SSL0072') >翠竹水贝泊林花园 (9)</a></li><li name='SSL0151' ><a title='罗湖儿童公园 (9)' href=javascript:facetSearch('serviceaddr','SSL0151') >罗湖儿童公园 (9)</a></li><li name='SSL0073' ><a title='市人民医院 (8)' href=javascript:facetSearch('serviceaddr','SSL0073') >市人民医院 (8)</a></li><li name='SSL0148' ><a title='罗湖区体育馆 (7)' href=javascript:facetSearch('serviceaddr','SSL0148') >罗湖区体育馆 (7)</a></li><li name='SSL0156' ><a title='罗湖怡景 (7)' href=javascript:facetSearch('serviceaddr','SSL0156') >罗湖怡景 (7)</a></li><li name='SSL0173' ><a title='红村社区 (7)' href=javascript:facetSearch('serviceaddr','SSL0173') >红村社区 (7)</a></li></ul></div>
						  
                      	<div class="tab_3_text" style="display:none;">
                      	
                          	<ul class="totallist">
							<li name='044132' ><a title='光明区图书馆 (2940)' href=javascript:facetSearch('serviceaddr','044132') >光明区图书馆 (2940)</a></li><li name='GMW001' ><a title='光明下架调剂书库 (524)' href=javascript:facetSearch('serviceaddr','GMW001') >光明下架调剂书库 (524)</a></li><li name='GMF001' ><a title='光明区光明街道分馆 (468)' href=javascript:facetSearch('serviceaddr','GMF001') >光明区光明街道分馆 (468)</a></li><li name='GMF002' ><a title='光明区公明街道分馆 (437)' href=javascript:facetSearch('serviceaddr','GMF002') >光明区公明街道分馆 (437)</a></li><li name='GMF003' ><a title='光明区玉塘街道玉律社区分馆 (317)' href=javascript:facetSearch('serviceaddr','GMF003') >光明区玉塘街道玉律社区分馆 (317)</a></li><li name='GMF007' ><a title='光明区公明街道下村社区图书馆 (207)' href=javascript:facetSearch('serviceaddr','GMF007') >光明区公明街道下村社区图书馆 (207)</a></li><li name='GMF006' ><a title='光明区公明街道李松蓢社区分馆 (196)' href=javascript:facetSearch('serviceaddr','GMF006') >光明区公明街道李松蓢社区分馆 (196)</a></li><li name='GMF014' ><a title='光明区凤凰街道塘尾社区分馆 (189)' href=javascript:facetSearch('serviceaddr','GMF014') >光明区凤凰街道塘尾社区分馆 (189)</a></li><li name='GMF019' ><a title='光明区马田街道合水口社区分馆 (183)' href=javascript:facetSearch('serviceaddr','GMF019') >光明区马田街道合水口社区分馆 (183)</a></li><li name='GMF020' ><a title='光明区新湖办事处新羌社区分馆 (174)' href=javascript:facetSearch('serviceaddr','GMF020') >光明区新湖办事处新羌社区分馆 (174)</a></li><li name='GMF017' ><a title='光明区公明街道西田社区分馆 (162)' href=javascript:facetSearch('serviceaddr','GMF017') >光明区公明街道西田社区分馆 (162)</a></li><li name='GMF008' ><a title='光明区马田街道薯田埔社区分馆 (133)' href=javascript:facetSearch('serviceaddr','GMF008') >光明区马田街道薯田埔社区分馆 (133)</a></li><li name='GMF024' ><a title='光明区伯尼分馆 (127)' href=javascript:facetSearch('serviceaddr','GMF024') >光明区伯尼分馆 (127)</a></li><li name='GMF005' ><a title='光明区光明街道白花社区分馆 (125)' href=javascript:facetSearch('serviceaddr','GMF005') >光明区光明街道白花社区分馆 (125)</a></li><li name='GMF004' ><a title='光明区光明街道碧眼社区分馆 (117)' href=javascript:facetSearch('serviceaddr','GMF004') >光明区光明街道碧眼社区分馆 (117)</a></li><li name='GMF022' ><a title='光明区爱湾绘本分馆 (104)' href=javascript:facetSearch('serviceaddr','GMF022') >光明区爱湾绘本分馆 (104)</a></li><li name='GMF026' ><a title='光明传麒山分馆 (102)' href=javascript:facetSearch('serviceaddr','GMF026') >光明传麒山分馆 (102)</a></li><li name='GMF015' ><a title='光明区凤凰街道凤凰社区红坳分馆 (100)' href=javascript:facetSearch('serviceaddr','GMF015') >光明区凤凰街道凤凰社区红坳分馆 (100)</a></li><li name='GMF009' ><a title='光明区凤凰街道甲子塘社区分馆 (90)' href=javascript:facetSearch('serviceaddr','GMF009') >光明区凤凰街道甲子塘社区分馆 (90)</a></li><li name='GMF010' ><a title='光明区光明街道翠湖社区分馆 (88)' href=javascript:facetSearch('serviceaddr','GMF010') >光明区光明街道翠湖社区分馆 (88)</a></li><li name='GMF025' ><a title='光明区凤凰办事处凤凰社区分馆 (78)' href=javascript:facetSearch('serviceaddr','GMF025') >光明区凤凰办事处凤凰社区分馆 (78)</a></li><li name='GMF011' ><a title='光明区光明街道光明社区分馆 (76)' href=javascript:facetSearch('serviceaddr','GMF011') >光明区光明街道光明社区分馆 (76)</a></li><li name='GML013' ><a title='光明区24小时自助图书馆 (76)' href=javascript:facetSearch('serviceaddr','GML013') >光明区24小时自助图书馆 (76)</a></li><li name='GML011' ><a title='光明区时尚创意谷分馆 (75)' href=javascript:facetSearch('serviceaddr','GML011') >光明区时尚创意谷分馆 (75)</a></li><li name='GMF016' ><a title='光明区光明街道东周社区分馆 (61)' href=javascript:facetSearch('serviceaddr','GMF016') >光明区光明街道东周社区分馆 (61)</a></li><li name='GMF023' ><a title='光明区高新园区分馆 (56)' href=javascript:facetSearch('serviceaddr','GMF023') >光明区高新园区分馆 (56)</a></li><li name='GMS001' ><a title='光明区图书馆书香亭 (26)' href=javascript:facetSearch('serviceaddr','GMS001') >光明区图书馆书香亭 (26)</a></li><li name='GMS044' ><a title='光明玉律社区书香亭 (24)' href=javascript:facetSearch('serviceaddr','GMS044') >光明玉律社区书香亭 (24)</a></li><li name='GMF012' ><a title='光明群体中心简阅书吧 (23)' href=javascript:facetSearch('serviceaddr','GMF012') >光明群体中心简阅书吧 (23)</a></li><li name='GMS021' ><a title='光明田寮社区书香亭 (23)' href=javascript:facetSearch('serviceaddr','GMS021') >光明田寮社区书香亭 (23)</a></li><li name='GMS027' ><a title='光明实验学校书香亭 (23)' href=javascript:facetSearch('serviceaddr','GMS027') >光明实验学校书香亭 (23)</a></li><li name='GMS002' ><a title='光明宏发上域书香亭 (22)' href=javascript:facetSearch('serviceaddr','GMS002') >光明宏发上域书香亭 (22)</a></li><li name='GMS036' ><a title='光明高级中学服务书香亭 (22)' href=javascript:facetSearch('serviceaddr','GMS036') >光明高级中学服务书香亭 (22)</a></li><li name='GMS039' ><a title='光明楼村小学书香亭 (21)' href=javascript:facetSearch('serviceaddr','GMS039') >光明楼村小学书香亭 (21)</a></li><li name='GMS045' ><a title='光明马田小学书香亭 (21)' href=javascript:facetSearch('serviceaddr','GMS045') >光明马田小学书香亭 (21)</a></li><li name='GMS016' ><a title='光明上村社区书香亭 (20)' href=javascript:facetSearch('serviceaddr','GMS016') >光明上村社区书香亭 (20)</a></li><li name='GMS003' ><a title='公明天虹书香亭 (18)' href=javascript:facetSearch('serviceaddr','GMS003') >公明天虹书香亭 (18)</a></li><li name='GMS019' ><a title='光明合水口书香亭 (18)' href=javascript:facetSearch('serviceaddr','GMS019') >光明合水口书香亭 (18)</a></li><li name='GMS006' ><a title='光明盛凌书香亭 (17)' href=javascript:facetSearch('serviceaddr','GMS006') >光明盛凌书香亭 (17)</a></li><li name='GMS031' ><a title='光明西田社区书香亭 (17)' href=javascript:facetSearch('serviceaddr','GMS031') >光明西田社区书香亭 (17)</a></li><li name='GMS038' ><a title='光明新羌社区书香亭 (17)' href=javascript:facetSearch('serviceaddr','GMS038') >光明新羌社区书香亭 (17)</a></li><li name='GMS009' ><a title='光明区人民医院书香亭 (16)' href=javascript:facetSearch('serviceaddr','GMS009') >光明区人民医院书香亭 (16)</a></li><li name='GMS029' ><a title='光明伯尼大厦书香亭 (16)' href=javascript:facetSearch('serviceaddr','GMS029') >光明伯尼大厦书香亭 (16)</a></li><li name='GMS048' ><a title='光明金新农大厦书香亭 (16)' href=javascript:facetSearch('serviceaddr','GMS048') >光明金新农大厦书香亭 (16)</a></li><li name='GMS004' ><a title='光明大第书香亭 (15)' href=javascript:facetSearch('serviceaddr','GMS004') >光明大第书香亭 (15)</a></li><li name='GMS008' ><a title='光明龟山公园书香亭 (15)' href=javascript:facetSearch('serviceaddr','GMS008') >光明龟山公园书香亭 (15)</a></li><li name='GMS011' ><a title='光明东坑社区书香亭 (15)' href=javascript:facetSearch('serviceaddr','GMS011') >光明东坑社区书香亭 (15)</a></li><li name='GMS012' ><a title='光明凤凰社区书香亭 (15)' href=javascript:facetSearch('serviceaddr','GMS012') >光明凤凰社区书香亭 (15)</a></li><li name='GMS014' ><a title='公明交警中队书香亭 (15)' href=javascript:facetSearch('serviceaddr','GMS014') >公明交警中队书香亭 (15)</a></li><li name='GMS018' ><a title='光明马山头书香亭 (15)' href=javascript:facetSearch('serviceaddr','GMS018') >光明马山头书香亭 (15)</a></li><li name='GMS025' ><a title='光明石围社区书香亭 (15)' href=javascript:facetSearch('serviceaddr','GMS025') >光明石围社区书香亭 (15)</a></li><li name='GMS030' ><a title='光明公明一小书香亭 (15)' href=javascript:facetSearch('serviceaddr','GMS030') >光明公明一小书香亭 (15)</a></li><li name='GMS041' ><a title='光明圳美社区书香亭 (15)' href=javascript:facetSearch('serviceaddr','GMS041') >光明圳美社区书香亭 (15)</a></li><li name='GMS017' ><a title='光明新湖行政服务中心书香亭 (14)' href=javascript:facetSearch('serviceaddr','GMS017') >光明新湖行政服务中心书香亭 (14)</a></li><li name='GMS024' ><a title='光明红花山体育中心书香亭 (14)' href=javascript:facetSearch('serviceaddr','GMS024') >光明红花山体育中心书香亭 (14)</a></li><li name='GMS042' ><a title='光明李松蓢学校书香亭 (14)' href=javascript:facetSearch('serviceaddr','GMS042') >光明李松蓢学校书香亭 (14)</a></li><li name='GMS028' ><a title='光明迳口社区书香亭 (13)' href=javascript:facetSearch('serviceaddr','GMS028') >光明迳口社区书香亭 (13)</a></li><li name='GMS033' ><a title='光明邦凯科技城书香亭 (13)' href=javascript:facetSearch('serviceaddr','GMS033') >光明邦凯科技城书香亭 (13)</a></li><li name='GML009' ><a title='光明区亲子阅览室 (12)' href=javascript:facetSearch('serviceaddr','GML009') >光明区亲子阅览室 (12)</a></li><li name='GMS013' ><a title='光明招商局科技园书香亭 (12)' href=javascript:facetSearch('serviceaddr','GMS013') >光明招商局科技园书香亭 (12)</a></li><li name='GMS015' ><a title='光明根竹园社康书香亭 (12)' href=javascript:facetSearch('serviceaddr','GMS015') >光明根竹园社康书香亭 (12)</a></li><li name='GMS037' ><a title='深圳市第二职业学校书香亭 (12)' href=javascript:facetSearch('serviceaddr','GMS037') >深圳市第二职业学校书香亭 (12)</a></li><li name='GMS046' ><a title='光明社区书香亭 (12)' href=javascript:facetSearch('serviceaddr','GMS046') >光明社区书香亭 (12)</a></li><li name='GMS005' ><a title='光明中学书香亭 (11)' href=javascript:facetSearch('serviceaddr','GMS005') >光明中学书香亭 (11)</a></li><li name='GMS020' ><a title='光明群体中心书香亭 (11)' href=javascript:facetSearch('serviceaddr','GMS020') >光明群体中心书香亭 (11)</a></li><li name='GMS035' ><a title='光明长圳学校书香亭 (11)' href=javascript:facetSearch('serviceaddr','GMS035') >光明长圳学校书香亭 (11)</a></li><li name='GMS040' ><a title='光明华强创意园书香亭 (11)' href=javascript:facetSearch('serviceaddr','GMS040') >光明华强创意园书香亭 (11)</a></li><li name='GMS049' ><a title='光明中山七院书香亭 (11)' href=javascript:facetSearch('serviceaddr','GMS049') >光明中山七院书香亭 (11)</a></li><li name='GMS051' ><a title='光明红星社区书香亭 (11)' href=javascript:facetSearch('serviceaddr','GMS051') >光明红星社区书香亭 (11)</a></li><li name='GMS043' ><a title='光明宝田医院书香亭 (10)' href=javascript:facetSearch('serviceaddr','GMS043') >光明宝田医院书香亭 (10)</a></li><li name='SSL0058' ><a title='光明荔山公园 (10)' href=javascript:facetSearch('serviceaddr','SSL0058') >光明荔山公园 (10)</a></li><li name='SSL0078' ><a title='公明文化体育中心 (10)' href=javascript:facetSearch('serviceaddr','SSL0078') >公明文化体育中心 (10)</a></li><li name='GMS026' ><a title='光明甲子塘社区书香亭 (9)' href=javascript:facetSearch('serviceaddr','GMS026') >光明甲子塘社区书香亭 (9)</a></li><li name='GMS034' ><a title='光明雪仙丽书香亭 (9)' href=javascript:facetSearch('serviceaddr','GMS034') >光明雪仙丽书香亭 (9)</a></li><li name='SSL0111' ><a title='公明李松蓢社区 (9)' href=javascript:facetSearch('serviceaddr','SSL0111') >公明李松蓢社区 (9)</a></li><li name='SSL0213' ><a title='光明中心医院 (9)' href=javascript:facetSearch('serviceaddr','SSL0213') >光明中心医院 (9)</a></li><li name='GMS023' ><a title='光明东周社区书香亭 (8)' href=javascript:facetSearch('serviceaddr','GMS023') >光明东周社区书香亭 (8)</a></li><li name='SSL0057' ><a title='光明高正豪景社区 (8)' href=javascript:facetSearch('serviceaddr','SSL0057') >光明高正豪景社区 (8)</a></li><li name='SSL0190' ><a title='光明区管委会 (8)' href=javascript:facetSearch('serviceaddr','SSL0190') >光明区管委会 (8)</a></li><li name='SSL0191' ><a title='光明办事处 (8)' href=javascript:facetSearch('serviceaddr','SSL0191') >光明办事处 (8)</a></li><li name='SSL0239' ><a title='光明华星光电技术有限公司 (8)' href=javascript:facetSearch('serviceaddr','SSL0239') >光明华星光电技术有限公司 (8)</a></li><li name='GMF013' ><a title='光明区新湖街道圳美社区分馆 (7)' href=javascript:facetSearch('serviceaddr','GMF013') >光明区新湖街道圳美社区分馆 (7)</a></li><li name='GMS007' ><a title='光明根竹园花园书香亭 (7)' href=javascript:facetSearch('serviceaddr','GMS007') >光明根竹园花园书香亭 (7)</a></li><li name='GMS022' ><a title='光明白花社区书香亭 (7)' href=javascript:facetSearch('serviceaddr','GMS022') >光明白花社区书香亭 (7)</a></li><li name='GMS032' ><a title='光明中心医院书香亭 (7)' href=javascript:facetSearch('serviceaddr','GMS032') >光明中心医院书香亭 (7)</a></li><li name='GMS047' ><a title='光明海军部队书香亭 (7)' href=javascript:facetSearch('serviceaddr','GMS047') >光明海军部队书香亭 (7)</a></li></ul></div>
						  
                      	<div class="tab_3_text" style="display:none;">
                      	
                          	<ul class="totallist">
							<li name='044009' ><a title='盐田区图书馆 (2615)' href=javascript:facetSearch('serviceaddr','044009') >盐田区图书馆 (2615)</a></li><li name='YTL011' ><a title='盐田区图书馆沙头角分馆 (401)' href=javascript:facetSearch('serviceaddr','YTL011') >盐田区图书馆沙头角分馆 (401)</a></li><li name='YTL013' ><a title='盐田区梅沙街道图书馆 (244)' href=javascript:facetSearch('serviceaddr','YTL013') >盐田区梅沙街道图书馆 (244)</a></li><li name='YTL012' ><a title='盐田区盐田街道文化站图书馆 (237)' href=javascript:facetSearch('serviceaddr','YTL012') >盐田区盐田街道文化站图书馆 (237)</a></li><li name='YTL014' ><a title='盐田区东部华侨城图书馆 (156)' href=javascript:facetSearch('serviceaddr','YTL014') >盐田区东部华侨城图书馆 (156)</a></li><li name='YTL016' ><a title='盐田区图书馆创意港分馆 (67)' href=javascript:facetSearch('serviceaddr','YTL016') >盐田区图书馆创意港分馆 (67)</a></li><li name='YTL029' ><a title='盐田区听海图书馆 (60)' href=javascript:facetSearch('serviceaddr','YTL029') >盐田区听海图书馆 (60)</a></li><li name='YTL017' ><a title='盐田区图书馆金利珠宝分馆 (24)' href=javascript:facetSearch('serviceaddr','YTL017') >盐田区图书馆金利珠宝分馆 (24)</a></li><li name='SSL0025' ><a title='盐田街道山海城 (12)' href=javascript:facetSearch('serviceaddr','SSL0025') >盐田街道山海城 (12)</a></li><li name='SSL0144' ><a title='中英街 (11)' href=javascript:facetSearch('serviceaddr','SSL0144') >中英街 (11)</a></li><li name='SSL0096' ><a title='盐田北山工业区 (9)' href=javascript:facetSearch('serviceaddr','SSL0096') >盐田北山工业区 (9)</a></li><li name='SSL0020' ><a title='盐田文化中心 (8)' href=javascript:facetSearch('serviceaddr','SSL0020') >盐田文化中心 (8)</a></li><li name='SSL0032' ><a title='沙头角街道沙头角社区 (8)' href=javascript:facetSearch('serviceaddr','SSL0032') >沙头角街道沙头角社区 (8)</a></li><li name='SSL0116' ><a title='盐田港 (8)' href=javascript:facetSearch('serviceaddr','SSL0116') >盐田港 (8)</a></li><li name='SSL0179' ><a title='沙头角边检 (7)' href=javascript:facetSearch('serviceaddr','SSL0179') >沙头角边检 (7)</a></li></ul></div>
						  
                      	<div class="tab_3_text" style="display:none;">
                      	
                          	<ul class="totallist">
							<li name='044136' ><a title='坪山区图书馆 (1888)' href=javascript:facetSearch('serviceaddr','044136') >坪山区图书馆 (1888)</a></li><li name='PSF004' ><a title='坪山区秀新社区图书馆 (278)' href=javascript:facetSearch('serviceaddr','PSF004') >坪山区秀新社区图书馆 (278)</a></li><li name='PSF001' ><a title='坪山区沙湖社区图书馆 (253)' href=javascript:facetSearch('serviceaddr','PSF001') >坪山区沙湖社区图书馆 (253)</a></li><li name='PSF005' ><a title='坪山区金沙社区图书馆 (248)' href=javascript:facetSearch('serviceaddr','PSF005') >坪山区金沙社区图书馆 (248)</a></li><li name='PSF006' ><a title='坪山区六联社区图书馆 (192)' href=javascript:facetSearch('serviceaddr','PSF006') >坪山区六联社区图书馆 (192)</a></li><li name='PSF003' ><a title='坪山区龙田社区图书馆 (184)' href=javascript:facetSearch('serviceaddr','PSF003') >坪山区龙田社区图书馆 (184)</a></li><li name='PSF007' ><a title='坪山区坪环社区图书馆 (174)' href=javascript:facetSearch('serviceaddr','PSF007') >坪山区坪环社区图书馆 (174)</a></li><li name='PSL021' ><a title='坪山区坪山办事处图书馆 (117)' href=javascript:facetSearch('serviceaddr','PSL021') >坪山区坪山办事处图书馆 (117)</a></li><li name='SSL0068' ><a title='坪山金域东郡 (12)' href=javascript:facetSearch('serviceaddr','SSL0068') >坪山金域东郡 (12)</a></li><li name='SSL0126' ><a title='坪山实验学校 (11)' href=javascript:facetSearch('serviceaddr','SSL0126') >坪山实验学校 (11)</a></li><li name='SSL0053' ><a title='坪山沙田社区 (10)' href=javascript:facetSearch('serviceaddr','SSL0053') >坪山沙田社区 (10)</a></li><li name='SSL0054' ><a title='坪山比亚迪工业园 (8)' href=javascript:facetSearch('serviceaddr','SSL0054') >坪山比亚迪工业园 (8)</a></li><li name='SSL0067' ><a title='坪山中心小学 (8)' href=javascript:facetSearch('serviceaddr','SSL0067') >坪山中心小学 (8)</a></li><li name='SSL0211' ><a title='坪山坪环社区 (8)' href=javascript:facetSearch('serviceaddr','SSL0211') >坪山坪环社区 (8)</a></li><li name='SSL0141' ><a title='坪山华瀚科技大厦 (7)' href=javascript:facetSearch('serviceaddr','SSL0141') >坪山华瀚科技大厦 (7)</a></li></ul></div>
						  
                      	<div class="tab_3_text" style="display:none;">
                      	
                          	<ul class="totallist">
							<li name='LXF014' ><a title='龙华区观湖办事处图书馆 (850)' href=javascript:facetSearch('serviceaddr','LXF014') >龙华区观湖办事处图书馆 (850)</a></li><li name='LXL021' ><a title='龙华区龙华办事处图书馆 (684)' href=javascript:facetSearch('serviceaddr','LXL021') >龙华区龙华办事处图书馆 (684)</a></li><li name='XBLFG' ><a title='深圳图书馆新百丽分馆 (377)' href=javascript:facetSearch('serviceaddr','XBLFG') >深圳图书馆新百丽分馆 (377)</a></li><li name='LXF017' ><a title='龙华区民治街道图书馆 (349)' href=javascript:facetSearch('serviceaddr','LXF017') >龙华区民治街道图书馆 (349)</a></li><li name='LXF010' ><a title='龙华区大浪街道石凹图书馆 (313)' href=javascript:facetSearch('serviceaddr','LXF010') >龙华区大浪街道石凹图书馆 (313)</a></li><li name='LXF009' ><a title='龙华区大浪街道图书馆 (296)' href=javascript:facetSearch('serviceaddr','LXF009') >龙华区大浪街道图书馆 (296)</a></li><li name='LXF002' ><a title='龙华区观澜银星劳务工图书馆 (232)' href=javascript:facetSearch('serviceaddr','LXF002') >龙华区观澜银星劳务工图书馆 (232)</a></li><li name='LXF011' ><a title='龙华区清湖劳务工图书馆 (171)' href=javascript:facetSearch('serviceaddr','LXF011') >龙华区清湖劳务工图书馆 (171)</a></li><li name='FSKFG' ><a title='深圳图书馆富士康分馆 (157)' href=javascript:facetSearch('serviceaddr','FSKFG') >深圳图书馆富士康分馆 (157)</a></li><li name='LXMZ07' ><a title='民治街道牛栏前社区图书馆 (156)' href=javascript:facetSearch('serviceaddr','LXMZ07') >民治街道牛栏前社区图书馆 (156)</a></li><li name='LXF012' ><a title='龙华区水斗新围劳务工图书馆 (147)' href=javascript:facetSearch('serviceaddr','LXF012') >龙华区水斗新围劳务工图书馆 (147)</a></li><li name='LXGL01' ><a title='龙华区观湖阅读中心 (121)' href=javascript:facetSearch('serviceaddr','LXGL01') >龙华区观湖阅读中心 (121)</a></li><li name='BAFDL01' ><a title='[旧]龙华区大浪办事处龙胜图书馆 (118)' href=javascript:facetSearch('serviceaddr','BAFDL01') >[旧]龙华区大浪办事处龙胜图书馆 (118)</a></li><li name='LXFDL01' ><a title='龙华区大浪街道龙胜图书馆 (111)' href=javascript:facetSearch('serviceaddr','LXFDL01') >龙华区大浪街道龙胜图书馆 (111)</a></li><li name='LXMZ09' ><a title='民治街道白石龙社区图书馆 (111)' href=javascript:facetSearch('serviceaddr','LXMZ09') >民治街道白石龙社区图书馆 (111)</a></li><li name='LXDL11' ><a title='龙华区大浪街道羊台山文化名人图书馆 (94)' href=javascript:facetSearch('serviceaddr','LXDL11') >龙华区大浪街道羊台山文化名人图书馆 (94)</a></li><li name='LXDL10' ><a title='龙华区大浪街道梦中心图书馆 (93)' href=javascript:facetSearch('serviceaddr','LXDL10') >龙华区大浪街道梦中心图书馆 (93)</a></li><li name='LXFMZ02' ><a title='龙华区民治街道丰润社区图书馆 (71)' href=javascript:facetSearch('serviceaddr','LXFMZ02') >龙华区民治街道丰润社区图书馆 (71)</a></li><li name='BAF002' ><a title='[旧]龙华区观澜银星劳务工图书馆 (64)' href=javascript:facetSearch('serviceaddr','BAF002') >[旧]龙华区观澜银星劳务工图书馆 (64)</a></li><li name='BAF011' ><a title='[旧]龙华区清湖劳务工图书馆 (61)' href=javascript:facetSearch('serviceaddr','BAF011') >[旧]龙华区清湖劳务工图书馆 (61)</a></li><li name='LXGL02' ><a title='观澜街道简阅·书吧桂花店 (58)' href=javascript:facetSearch('serviceaddr','LXGL02') >观澜街道简阅·书吧桂花店 (58)</a></li><li name='BAF012' ><a title='[旧]龙华区水斗新围劳务工图书馆 (56)' href=javascript:facetSearch('serviceaddr','BAF012') >[旧]龙华区水斗新围劳务工图书馆 (56)</a></li><li name='BAFMZ02' ><a title='[旧]龙龙华区民治办事处丰润社区图书馆 (52)' href=javascript:facetSearch('serviceaddr','BAFMZ02') >[旧]龙龙华区民治办事处丰润社区图书馆 (52)</a></li><li name='STJYSB01' ><a title='深图简阅书吧大浪服务点 (52)' href=javascript:facetSearch('serviceaddr','STJYSB01') >深图简阅书吧大浪服务点 (52)</a></li><li name='BAF014' ><a title='[旧]龙华区观湖办事处图书馆 (49)' href=javascript:facetSearch('serviceaddr','BAF014') >[旧]龙华区观湖办事处图书馆 (49)</a></li><li name='LXMZ08' ><a title='民治街道民治社区图书馆 (49)' href=javascript:facetSearch('serviceaddr','LXMZ08') >民治街道民治社区图书馆 (49)</a></li><li name='BAFMZ01' ><a title='[旧]龙华区民治办事处樟坑社区图书馆 (31)' href=javascript:facetSearch('serviceaddr','BAFMZ01') >[旧]龙华区民治办事处樟坑社区图书馆 (31)</a></li><li name='BAF009' ><a title='[旧]龙华区大浪办事处图书馆 (30)' href=javascript:facetSearch('serviceaddr','BAF009') >[旧]龙华区大浪办事处图书馆 (30)</a></li><li name='BAF010' ><a title='[旧]龙华区大浪办事处石凹图书馆 (22)' href=javascript:facetSearch('serviceaddr','BAF010') >[旧]龙华区大浪办事处石凹图书馆 (22)</a></li><li name='BAF017' ><a title='[旧]龙华区民治办事处图书馆 (16)' href=javascript:facetSearch('serviceaddr','BAF017') >[旧]龙华区民治办事处图书馆 (16)</a></li><li name='LXF021' ><a title='龙华街道清湖社区图书馆 (16)' href=javascript:facetSearch('serviceaddr','LXF021') >龙华街道清湖社区图书馆 (16)</a></li><li name='SSL0030' ><a title='龙华龙悦居 (13)' href=javascript:facetSearch('serviceaddr','SSL0030') >龙华龙悦居 (13)</a></li><li name='SSL0611' ><a title='招商观园 (13)' href=javascript:facetSearch('serviceaddr','SSL0611') >招商观园 (13)</a></li><li name='SSL0081' ><a title='龙华街道75212部队 (11)' href=javascript:facetSearch('serviceaddr','SSL0081') >龙华街道75212部队 (11)</a></li><li name='SSL0140' ><a title='龙华利金城科技工业园 (11)' href=javascript:facetSearch('serviceaddr','SSL0140') >龙华利金城科技工业园 (11)</a></li><li name='SSL0208' ><a title='观澜文化广场 (11)' href=javascript:facetSearch('serviceaddr','SSL0208') >观澜文化广场 (11)</a></li><li name='LXMZ11' ><a title='民治街道大岭社区图书馆 (10)' href=javascript:facetSearch('serviceaddr','LXMZ11') >民治街道大岭社区图书馆 (10)</a></li><li name='SSL0082' ><a title='民治丰泽湖山庄 (10)' href=javascript:facetSearch('serviceaddr','SSL0082') >民治丰泽湖山庄 (10)</a></li><li name='SSL0104' ><a title='大浪时尚创意园 (10)' href=javascript:facetSearch('serviceaddr','SSL0104') >大浪时尚创意园 (10)</a></li><li name='SSL0135' ><a title='龙华富士康L区 (10)' href=javascript:facetSearch('serviceaddr','SSL0135') >龙华富士康L区 (10)</a></li><li name='SSL0136' ><a title='龙华富士康J区 (10)' href=javascript:facetSearch('serviceaddr','SSL0136') >龙华富士康J区 (10)</a></li><li name='SSL0105' ><a title='大浪英泰工业园 (9)' href=javascript:facetSearch('serviceaddr','SSL0105') >大浪英泰工业园 (9)</a></li><li name='SSL0607' ><a title='福城办事处人民公园 (9)' href=javascript:facetSearch('serviceaddr','SSL0607') >福城办事处人民公园 (9)</a></li><li name='SSL0603' ><a title='观澜高尔夫 (8)' href=javascript:facetSearch('serviceaddr','SSL0603') >观澜高尔夫 (8)</a></li><li name='SSL0610' ><a title='东华明珠 (8)' href=javascript:facetSearch('serviceaddr','SSL0610') >东华明珠 (8)</a></li><li name='SSL0099' ><a title='大浪街道行政服务中心 (7)' href=javascript:facetSearch('serviceaddr','SSL0099') >大浪街道行政服务中心 (7)</a></li><li name='SSL0195' ><a title='水榭春天 (7)' href=javascript:facetSearch('serviceaddr','SSL0195') >水榭春天 (7)</a></li><li name='SSL0219' ><a title='龙华展华实验学校 (7)' href=javascript:facetSearch('serviceaddr','SSL0219') >龙华展华实验学校 (7)</a></li><li name='SSL0236' ><a title='龙华创业花园 (7)' href=javascript:facetSearch('serviceaddr','SSL0236') >龙华创业花园 (7)</a></li><li name='SSL0613' ><a title='石三小区 (7)' href=javascript:facetSearch('serviceaddr','SSL0613') >石三小区 (7)</a></li></ul></div>
						  
                      	<div class="tab_3_text" style="display:none;">
                      	
                          	<ul class="totallist">
							<li name='DPNA01' ><a title='大鹏新区南澳图书馆 (404)' href=javascript:facetSearch('serviceaddr','DPNA01') >大鹏新区南澳图书馆 (404)</a></li><li name='DPDP01' ><a title='大鹏新区大鹏图书馆 (334)' href=javascript:facetSearch('serviceaddr','DPDP01') >大鹏新区大鹏图书馆 (334)</a></li><li name='DPKC01' ><a title='大鹏新区葵涌图书馆 (288)' href=javascript:facetSearch('serviceaddr','DPKC01') >大鹏新区葵涌图书馆 (288)</a></li><li name='SSL0199' ><a title='南澳文体中心 (8)' href=javascript:facetSearch('serviceaddr','SSL0199') >南澳文体中心 (8)</a></li><li name='SSL0216' ><a title='大鹏新区管委会 (7)' href=javascript:facetSearch('serviceaddr','SSL0216') >大鹏新区管委会 (7)</a></li></ul></div></div></div></dt>			
       			
      	  			<dt>
                    	<span class="title"><span>
      					分类号
      					</span></span>
                    </dt>
                    <dd>
       	
      		<ul class="barlist">

      		
        	
	            <li><a href="javascript:facetSearch('classno','B')" >
	            B 哲学(606)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','C')" >
	            C 社会科学总论(164)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','D')" >
	            D 政治、法律(304)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','E')" >
	            E 军事(20)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','F')" >
	            F 经济(419)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','G')" title=G 文化、科学、教育、体育>
	            G 文化、科学、(1075)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','H')" >
	            H 语言、文字(723)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','I')" >
	            I 文学(15049)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','J')" >
	            J 艺术(6480)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','K')" >
	            K 历史、地理(1196)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','N')" >
	            N 自然科学总论(129)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','O')" title=O 数理科学和化学>
	            O 数理科学和化(59)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','P')" >
	            P 天文(70)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','Q')" >
	            Q 生物科学(374)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','R')" >
	            R 医药、卫生(332)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','S')" >
	            S 农业科学(3449)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','U')" >
	            U 交通运输(30)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','V')" >
	            V 航空、航天(1)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','X')" title=X 环境科学、安全科学>
	            X 环境科学、安(26)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','Z')" >
	            Z 综合性图书(307)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('classno','T')" >
	            T 工业技术(2361)</a></li>
	      
 	
          	
          	</ul>
       	 </dd>
       	
        			
       			
      	  			<dt>
                    	<span class="title"><span>
      					出版年
      					</span></span>
                    </dt>
                    <dd>
       	
      		<ul class="barlist">

      		
        	
	            <li><a href="javascript:facetSearch('publishyear','2018')" >
	            2018(975)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('publishyear','2017')" >
	            2017(1769)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('publishyear','2016')" >
	            2016(1768)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('publishyear','2015')" >
	            2015(1829)</a></li>
	      
 	
          	
        	
	            <li><a href="javascript:facetSearch('publishyear','2014')" >
	            2014(1848)</a></li>
	      
 	
          	
          	</ul>
       	 </dd>
       	
        
      	
   
 </dl>
 </div>


<script type="text/javascript">
/*
function getAllLibrary(query){
		
		$.ajax({
	    url: 'MoreLibrary.jsp?query='+escape(query)+'&value='+encodeURIComponent(''),	     	  
	    success: function(html){
	    	  $("#a1").parent().parent().html(html);
	         //$(this).parent().parent().html(html);
	    }
	});
}
*/
$(function(){
	$('.personalul li strong').toggle(function() {
			$(this).parents('li').addClass('show')
		}, function() {
			$(this).parents('li').removeClass('show')
		});
})



</script>



		</div>
		 <div class="con_top">
           
            	<div class="paginal paginal_1">                    
					<form name=EndForm method=post action=searchshow.jsp onsubmit="return EndGoPage()">
页码:<b>1</b>/<b>3348</b>页 每页 <b>10</b> &nbsp;&nbsp;&nbsp;&nbsp;

<font face=webdings color=#FF0000>9</font> 
<b><font color=red>1</font></b> 
<a href="javascript:GotoPage(2)"><b>2</b></a> 
<a href="javascript:GotoPage(3)"><b>3</b></a> 
<a href="javascript:GotoPage(4)"><b>4</b></a> 
<a href="javascript:GotoPage(5)"><b>5</b></a> 
<a href="javascript:GotoPage(6)"><b>6</b></a> 
<a href="javascript:GotoPage(7)"><b>7</b></a> 
<a href="javascript:GotoPage(8)"><b>8</b></a> 
<a href="javascript:GotoPage(9)"><b>9</b></a> 
<a href="javascript:GotoPage(10)"><b>10</b></a> 
<a href="javascript:GotoPage(11)" title=后10页><font face=webdings>8</font></a> 
<a href="javascript:GotoPage(3348)" title=尾页><font face=webdings>:</font></a>

<input type=hidden name=v_page  >  
</form>
<script language="javascript">
function EndGoPage()
{
document.PageForm.v_page.value = document.EndForm.v_page.value;
document.PageForm.submit();
return false;
}
</script>

            
           		</div>
      	
		 </div>				
	</div>
<script type="text/javascript">
function addExpress(metaid){

     $(".success_btn").show();
	

	

		location.href="../MyLibrary/Reader-Access.jsp?destPage=/Search/searchshow.jsp?v_value=%E8%8A%B1+&v_index=title&sortfield=score&sorttype=desc&v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&";
	
}




function reservat(metaid,tablename){


	
//	alert(22)
		location.href="../MyLibrary/Reader-Access.jsp?destPage=/Search/searchshow.jsp?v_value=%E8%8A%B1+&v_index=title&sortfield=score&sorttype=desc&v_tablearray=bibliosm,serbibm,apabibibm,mmbibm,&";
	
	

}




function login(){
	if(username.value==""||password.value==""){
		alert("请输入用户名和密码!");
		return false;		
	}	
	$.ajax({
	    url: '/MyLibrary/readerLoginM.jsp?username=' + username.value + '&password=' +$.md5(password.value),	     	  
	    success: function(xml){
	         $(xml).find('message').each(function(){
				var item_text = $(this).text();
			
				if(item_text == "OK") {
				location.href="/MyLibrary/login.jsp";
			     /* $("#login").hide();
			      loginName.innerText=username.value;
			      $("#loginInfo").show();
			      $(".loginbox").hide();*/
				}
				else {
					alert(item_text);
				}
			});
	    }
	});
	
	
}
$("#idTimeSpan1").text("0.134");
$("#idTimeSpan2").text("0.134");

  
	
$(document).ready(function(){
	
	$.ajax({
				dataType: 'xml',
			    url: 'getpreLoan.jsp?tableList=bibliosm,bibliosm,bibliosm,bibliosm,bibliosm,bibliosm,bibliosm,bibliosm,bibliosm,bibliosm,&metaidList=3775451,856509,153857,4141322,3070057,3281159,3515683,2937209,3074427,3163376,',
			    success: function(xml){    
			    		  $(xml).find("preloan").each(function(i){
			    		  		if($(this).text()=="true")
			    		  				$(".btn_1").eq(i).show();	    		  
			    		  
			    		  });	
			    		  $(xml).find("express").each(function(){
			    		  		if($(this).text()=="true")
			    		  				$(".delivery_btn").eq($(this).attr("no")).show();	    		  
			    		  
			    		  });	
			    		  
			    						
									
			   	 }
		});
	
	$.ajax({
				dataType: 'html',
			    url: 'gethotword.jsp?v_index=title',
			    success: function(html){    
			    		  
			    		$('#ts1').find("ul").html(html);
			    		$("#ts1").windstagball({    radius:80,			            speed:10       				});
   					
	   					 //$('#ts1').tagcloud({rotate_factor: 5,fps:24,centrex:100, centrey:80, init_motion_x:10, init_motion_y:10});
					
			   	 }
		});	
	
});


v_index.value="title";
document.getElementById("v_sortfield").value="score";
document.getElementById("v_sorttype").value="desc";
$(function(){
	$('.regtab input').add('.regtab select').focus(function(){
		$(this).next('div').show();
	}).blur(function(){
		$(this).next('div').hide();
	});
})

function pageNumChange(){
	document.PageForm.pageNum.value=v_pageNum.value;
	document.PageForm.submit();
}

function paixu(){
	
	//更改页面中的form里的变量的值，然后提交form
	document.PageForm.sortfield.value=document.getElementById("v_sortfield").value;

	document.PageForm.sorttype.value=document.getElementById("v_sorttype").value;
	document.PageForm.submit();
}


/*
$('.booklist li .see').each(function(i){
		var xuhao = i;
		alert("dd");
		$(this).toggle(function() {
			if($(this).parents('li').find('.holdingtab').html().length<1){//第一次点击发AJAX请求，再点就直接显示							
				var abc=this; //定义一个对象记录this对象，在success函数里this对象被覆盖了，或不可见了，反正用不了
				
				$.ajax({
					dataType: 'html',
		    		url: 'getpreholding.jsp?v_curtable=' + $(this).attr("name").substring(0,$(this).attr("name").indexOf(",")) + '&v_recno=' +$(this).attr("name").substring($(this).attr("name").indexOf(",")+1)+'',
		    		success: function(html){    
		    			var holdingtab= $(abc).parents('li').find('.holdingtab')[0];								
						$(holdingtab).html(html);	
						$(holdingtab).find('.tab_1 a').each(function(i){
							$(this).click(function(){
								$(holdingtab).find('.tab_1 a').eq(i).addClass('cur').siblings().removeClass('cur');
								$(holdingtab).find('.tab_1_main .tab_1_text').eq(i).show().siblings().hide();
								return false;
							});
						}).focus(function(){this.blur();});	
						$(holdingtab).find('.tab_1 a').eq(0).click();	
						$(holdingtab).find("a[class='detail']").click(function(){
							location.href($(".link2").eq(xuhao).attr('href'));
							

						});
		   			 }
				});
			}
			$(this).addClass('on').text('收起');
			$(this).parents('li').find('.holdingtab').slideDown();
		}, function() {
			$(this).removeClass('on').text('展开');
			$(this).parents('li').find('.holdingtab').slideUp();
		});
		
	}).focus(function(){this.blur();});
*/
</script>
<script type="text/javascript" charset="utf-8">
 $(function(){
    $(".searchbox select , .time_publish select").uniform();
 });
 
$(function(){
	$(".login_lib a").colorbox();
	
	$('.booklist li .title a').focus(function(){this.blur();});
	
	
	$('.tab_2_title a').each(function(i){
		$(this).click(function(){
			$('.tab_2_title a').eq(i).addClass('cur').siblings().removeClass('cur');
			$('.tab_2_text').eq(i).show().siblings().hide();
			return false;
		});
	}).focus(function(){this.blur();});
	
	
	$('.tab_3_title a').each(function(i){
		$(this).click(function(){
			$('.tab_3_title a').eq(i).addClass('cur').siblings().removeClass('cur');
			$('.tab_3_text').eq(i).show().siblings().hide();
			return false;
		});
	}).focus(function(){this.blur();});
	
	

	$('.booklist li .see').each(function(i){
		var xuhao = i;
		$(this).click(function(){
			if($(this).parents('li').find('.holdingtab').html().length<1){//第一次点击发AJAX请求，再点就直接显示							
				var abc=this; //定义一个对象记录this对象，在success函数里this对象被覆盖了，或不可见了，反正用不了
				
				$.ajax({
					dataType: 'html',
		    		url: 'getpreholding.jsp?v_curtable=' + $(this).attr("name").substring(0,$(this).attr("name").indexOf(",")) + '&v_recno=' +$(this).attr("name").substring($(this).attr("name").indexOf(",")+1)+'',
		    		success: function(html){    
		    			var holdingtab= $(abc).parents('li').find('.holdingtab')[0];								
						$(holdingtab).html(html);	
						$(holdingtab).find('.tab_2_title a').each(function(i){
							$(this).click(function(){
								$(holdingtab).find('.tab_2_title a').eq(i).addClass('cur').siblings().removeClass('cur');
								$(holdingtab).find('.tab_2_show .tab_2_text').eq(i).show().siblings().hide();
								return false;
							});
						}).focus(function(){this.blur();});	
						$(holdingtab).find('.tab_2_title a').eq(0).click();	
						$(holdingtab).find("a[class='detail']").click(function(){
							location.href($(".more").eq(xuhao).attr('href'));
							

						});
		   			 }
				});
			}
			//$('.booknum_con').eq(i).css({'display':'block'});
			$(this).next('.booknum_con').slideToggle();
			return false;			
		});
		
	});
	
	$('.booknum .close').click(function(){
		//$('.booklist .booknum_con').css({'display':'none'});
		$(this).parent().parent('.booknum_con').slideUp();
		return false;
	})
	

	
	/*$('.sidelist dt').addClass('active');
	$('.sidelist dt[id=\'tushu\']').removeClass('active');
	$('.sidelist dd').show();
	$('.sidelist dt').click(function(){
		if($(this).hasClass('active')){
			$(this).removeClass('active').next('dd').slideUp();
		}else{
			$(this).addClass('active').next('dd').slideDown();
			//$(this).siblings('dt').removeClass();
		}
	});
	
	$('.sidelist dt[id=\'tushu\']').mouseover(function(){///////////////怎能写死
		$(this).addClass('cur');
		$('.books_total').css({'display':'block'});
	}).mouseout(function(){
		$(this).removeClass('cur');
		$('.books_total').css({'display':'none'});
	});*/

	$('.sidelist dt').addClass('active');
	$('.sidelist dd').show();
	$('.sidelist dt').click(function(){
		if($(this).hasClass('active')){
			$(this).removeClass('active').next('dd').slideUp();
			$(this).removeClass('active').find('.books_total').slideUp();
		}else{
			$(this).addClass('active').next('dd').slideDown();
			$(this).addClass('active').find('.books_total').slideDown();
		}
	});

	$('#tushu span').removeClass('title_1');
	$('#tushu span').wrapInner("<span></span>"); 

	$('.tab_3_title a').each(function(i){
		$(this).mouseover(function(){
			$('.tab_3_title a').eq(i).addClass('cur').siblings().removeClass('cur');
			$('.tab_3_text').eq(i).show().siblings().hide();
			return false;
		})
	}).focus(function(){this.blur();});

	$('.books_total').mouseleave(function(){
		$('.tab_3_title a').removeClass('cur');
		$('.tab_3_text').hide();
	
	});
	
	
	
	
	$(function(){ $('#equalize').equalHeights();});
	////////////////////////
	
	
	
	
	
	
	
	
	
})


$(".con_r_top select , .books_sel select").uniform();

$(function(){
	   		
      autoCompleteInput($("#v_value"));  //设置要进行联想的页面对象，就是那个输入框$("#v_value") 
      	
});
</script>


	<div class="footer" style='text-align:center'>Copyright. 2003 -- 2010 All Rights Reserved.</div>
	<div class="success_out">
	
	
			<div class="success" id="success">
				<div class="success_icon">
					<img src="" />
					<div id='msgKD'></div>
				</div>
				<div class="success_btn">
					<a href="#" onclick="$.colorbox.close()"  class="continue">继续选择</a>
					<a href="/MyLibrary/newbookcart.jsp" class="seelist"  >查看图书</a>
				</div>
			</div>
		
		
		</div>
</div>
</body>
</html>
<!-- Piwik -->

		<script type="text/javascript">
		var pkBaseURL = (("https:" == document.location.protocol) ? " https://statistics.szlib.org.cn/piwik/" : " http://172.16.18.41/piwik/");
		document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
		</script><script type="text/javascript">
		try {
		
			var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 2);
		
		piwikTracker.trackPageView();
		piwikTracker.enableLinkTracking();
		} catch( err ) {}
		</script><noscript><p>
		
			<img src="https://statistics.szlib.org.cn/piwik/piwik.php?idsite=2" style="border:0" alt="" />
		
		</p></noscript>
	
<!-- End Piwik Tag -->
