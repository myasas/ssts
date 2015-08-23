<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.HashMap"%>
<%@page import="controller.InputVoiceController"%>
<%@page import="configuration.StaticReferences"%>
    
    
<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>
<%} else {

%>    
    
<html>
<head>

<!-- Test -->
  <link rel="stylesheet" type="text/css" href="/css/result-light.css">
  <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.1/css/foundation.min.css">
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.1/js/foundation.min.js"></script><meta class="foundation-data-attribute-namespace"><meta class="foundation-mq-xxlarge"><meta class="foundation-mq-xlarge"><meta class="foundation-mq-large"><meta class="foundation-mq-medium"><meta class="foundation-mq-small"><style></style>
  <style type="text/css">
    @media only screen and (max-width: 40em) {
    .title-area {
    }
    .name {
    }
    .name img {
            height:35px;
            margin-top:5px;
            margin-left:5px;
    }
}
.name img {
    margin-left:20px;
    
}
  </style>

<script type="text/javascript">//<![CDATA[
$(window).load(function(){
$(document).foundation();
});//]]> 
</script>
<meta class="foundation-mq-topbar">
<!-- Test -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
    


<title>Smart Speech Therapist</title>		
</head>
<body>


	<div data-role="page" id="page-1" data-theme="a">
<!-- Left panel -->	
		<div data-role="panel" id="panel-1" data-theme="b">
			<ul data-role="listview" id="listview-1">
				<li><a href="" onclick="location.href='success.jsp'">Home</a></li>
				<li><a href="#">Configurations</a></li>
				<li><a href="#page-2">Help</a></li>		
				<li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>					
			</ul>
	</div>

<!-- Top bar -->	
		<div data-role="header" data-theme="b">
<nav class="top-bar" data-topbar="">
  <ul class="title-area">
    <li class="name">
    <a href="#panel-1" id="button-1" class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all">MainMenu</a>
        <a href="#"><img src="img/ssts_logo_150px.png" ></a>
    </li>
     <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
    <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
  </ul>
  
<section class="top-bar-section">
    <!-- Right Nav Section -->
    <ul class="right">
      <li class="active"><a href="#"><%=session.getAttribute(StaticReferences.ssnUserlogindisplay)%></a></li>
      <li class="has-dropdown not-click">
        <a href="#">Account</a>
        <ul class="dropdown"><li class="title back js-generated"><h5><a href="javascript:void(0)">Back</a></h5></li>
          <li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>
        </ul>
      </li>
    </ul>
  </section></nav>
		</div>	
		
		
<!-- White Paragraph  -->					
		<div data-role="content">		
		<form >		

	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Smart Therapy</h4>		
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
			<p>Please click the microphone icon when you are ready. Then read the paragraph below.</p>
			
			<p>Please read this out loud :</p>
			<textarea rows="4" cols="50" name="paratoread" readonly>My mom and I are very best friends. We even go to shopping together.</textarea>
			<br>
			<p>Speech Output :</p>
<div class="si-wrapper">
	<textarea name=speechoutput rows="4" cols="50" class="si-input" placeholder="Please read the text" ></textarea>
	<a href="" class="si-btn ui-btn ui-icon-grid ui-btn-icon-left ui-corner-all ui-btn-b"><span class="si-mic"></span> <span class="si-holder"></span></a>
</div>		
		<input type="Submit" value="Finished !" onclick="location.href='redirect.jsp'" />
</div>
		
		</form>
<script src="js/speech-input.js"></script>		
		</div>		
		
<%
String spIn = request.getParameter("paratoread");
String spOut = request.getParameter("speechoutput");

if (spOut == null) {
// myText is null when the page is first requested, 
// so do nothing
} else { 
if (spOut.length() == 0) {
// There was a querystring like ?myText=
// but no text, so myText is not null, but 
// a zero length string instead.
session.setAttribute(StaticReferences.ssnRedirectPage, "speech.jsp#dialog-nospeechinput");
response.sendRedirect("redirect.jsp");%>   
<% } else { 
   session.setAttribute(StaticReferences.ssnRedirectPage, "speech.jsp#page-2"); 
   session.setAttribute("spout", spOut); 
   session.setAttribute("spin", spIn);    
   response.setHeader("refresh", "1");
   response.sendRedirect("redirect.jsp");   

}
}
%>	
		
		<div data-role="footer" data-theme="b">
			<h4>-</h4>
		</div>
	</div>		



<div data-role="page" id="page-2" data-theme="a">
<!-- Left panel -->	
	<div data-role="panel" id="panel-1" data-theme="b">
			<ul data-role="listview" id="listview-1">
				<li><a href="" onclick="location.href='success.jsp'">Home</a></li>
				<li><a href="#">Configurations</a></li>
				<li><a href="#page-2">Help</a></li>		
				<li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>					
			</ul>
	</div>
<!-- Top bar -->	
		<div data-role="header" data-theme="b">
<nav class="top-bar" data-topbar="">
  <ul class="title-area">
    <li class="name">
    <a href="#panel-1" id="button-1" class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all">MainMenu</a>
        <a href="#"><img src="img/ssts_logo_150px.png" ></a>
    </li>
     <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
    <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
  </ul>
  
<section class="top-bar-section">
    <!-- Right Nav Section -->
    <ul class="right">
      <li class="active"><a href="#"><%=session.getAttribute(StaticReferences.ssnUserlogindisplay)%></a></li>
      <li class="has-dropdown not-click">
        <a href="#">Account</a>
        <ul class="dropdown"><li class="title back js-generated"><h5><a href="javascript:void(0)">Back</a></h5></li>
          <li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>
        </ul>
      </li>
    </ul>
  </section></nav>
		</div>	

<!-- White Paragraph  -->					
		<div data-role="content">		


	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Speech Results</h4>		
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
			<p>Following are your results.</p>
		<form >					

		
	<%
	String paraToRead=null;   
	String speechOutput=null;  	
	String html = null;
    if ((session.getAttribute("spout") == null) || (session.getAttribute("spout") == "")) {
	%>
No input is received. If you received this message while refreshing the page, please go back and retry.<br/>

<%} else {
	paraToRead = session.getAttribute("spin").toString().toLowerCase();   
    speechOutput = session.getAttribute("spout").toString().toLowerCase();   

	InputVoiceController ivc = new InputVoiceController();

	ivc = ivc.analyzeRecognizedVoiceInput(speechOutput);
	ivc.calculateSttuteredWordsAndCount(ivc.getRepeatedWordsArrayOut());

	HashMap<String , Integer> repeatedWordsAndCount = new HashMap<>();
	repeatedWordsAndCount = ivc.calculateSttuteredWordsAndCount(ivc.getRepeatedWordsArrayOut());
	
	html= ivc.hashmapToHtml(repeatedWordsAndCount);
%>	

<!-- Test2 -->
  <style type="text/css">
    ins {
  background-color: #73c1db;
  text-decoration: none; }
  del {
    background-color: #ffc6c6; }
      table th {
        width: 30%; }
  </style>
<script type="text/javascript" src="http://google-diff-match-patch.googlecode.com/svn/trunk/javascript/diff_match_patch.js"></script>
      <script type="text/javascript" src="https://rawgithub.com/arnab/jQuery.PrettyTextDiff/master/jquery.pretty-text-diff.js"></script>  
<script type="text/javascript">//<![CDATA[
$(window).load(function(){

    $("#wrapper tr").prettyTextDiff({
        cleanup: $("#cleanup").is(":checked")
    });


});//]]> 
</script>	  
<!-- Test2 -->	
 <div id="wrapper">
    <table class="table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <th>Original Sentence</th>
                <th>Voiced Sentence</th>
                <th>Result (<ins>Missed</ins> / <del>Not Expected</del>)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="changed"><%= paraToRead %></td>
                <td class="original"><%= speechOutput %></td>                
                <td class="diff"></td>
            </tr>
        </tbody>
    </table>
</div>		
	
	<%if(repeatedWordsAndCount.isEmpty()){
// If no words are repeated - Do not show repeated words lable.
	}else{
	%>
	<p>Following words are repeated,</p>
	<%= html %>
	
	<%
	}
%>


<%	
}	
%>			
		
		</form>
		
		<a href="#" data-role="button" data-rel="back" data-icon="back">Do it again</a>
		<a href="X" data-role="button" data-icon="action">Submit Results</a>
			</div>
		</div>	
<!-- footer -->
	<div data-role="footer" data-theme="b">
		<h4>-</h4>
	</div>			
			
	</div>





	<div data-role="page" data-dialog="true" id="dialog-nospeechinput" data-theme="b">
		<div data-role="header">
			<h1>No speech input</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Please speak first and then click "Finished!"</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		
	
</body>
</html> 
<%
    }
%>