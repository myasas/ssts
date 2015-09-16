<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Activity"%>
<%@page import="util.RandomIndexGenerator"%>
<%@page import="dao.ActivityDAO"%>
<%@page import="configuration.StaticReferences"%>
<%@page import="java.util.HashMap"%>
<%@page import="controller.StutteredSpeechController"%>    
<%@page import="configuration.StaticPanels"%>
    
  

    
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
    
<!-- Script - Speech Graph with DAF -->    
  <script type="text/javascript">//<![CDATA[
function myAnalyzer(){  

var canvasCtx = document.getElementById('canvas').getContext('2d');
var bufferSize = 4096;
var audioContext;

try {
    window.AudioContext = window.AudioContext || window.webkitAudioContext;
    audioContext = new AudioContext();
} catch (e) {
    alert('Web Audio API is not supported in this browser');
}

// Check if there is microphone input.
try {
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia ||     navigator.mozGetUserMedia || navigator.msGetUserMedia;
    var hasMicrophoneInput = (navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia);
} catch (e) {
    alert("getUserMedia() is not supported in your browser");
}

// Create analyser node.
var analyser = audioContext.createAnalyser();

analyser.fftsize = 512;
analyser.smoothingTimeConstant = 0.9;
var bufferLength = analyser.frequencyBinCount;
var dataArray = new Uint8Array(bufferLength);

var errorCallback = function (e) {
    alert("Please provide sufficient permission to access microphone. Error in getUserMedia: " + e);
};

// Get access to the microphone and start pumping data through the  graph.
navigator.getUserMedia({
    audio: true
}, function (stream) {
    // microphone -&gt; myPCMProcessingNode -&gt; destination.
    var microphone = audioContext.createMediaStreamSource(stream);
    microphone.connect(analyser);
    analyser.connect(audioContext.destination);
    //microphone.start(0);
}, errorCallback);

// draw an oscilloscope of the current audio source

function draw() {

    drawVisual = requestAnimationFrame(draw);

    analyser.getByteFrequencyData(dataArray);

    canvasCtx.fillStyle = 'rgb(200, 200, 200)';
    var WIDTH = 500;
    var HEIGHT = 256;
    canvasCtx.clearRect(0, 0, WIDTH, HEIGHT);

    for (var i = 0; i < dataArray.length; i++) {
      barHeight = HEIGHT - dataArray[i];
      canvasCtx.fillRect(i * 2, barHeight, 1, dataArray[i]);
      // It is a bad idea to update an element in this loop:
      // However, if I do, the following line always gives 0, which seems like a bug.
      document.getElementById("arrayIndex").innerHTML = dataArray[i];
      // This line works though.
      document.getElementById("arrayIndex").innerHTML = dataArray[50];
    }
};

draw();
}//]]> 
</script>
<!-- Script - Speech Graph with DAF -->


<title>Smart Speech Therapist</title>		
</head>
<body>


	<div data-role="page" id="page-1" data-theme="a">
<!-- Left panel -->	
<%=StaticPanels.homePanelVisitor %>

<!-- Top bar -->	
		<div data-role="header" data-theme="b">
<nav class="top-bar" data-topbar="">
  <ul class="title-area">
    <li class="name">
    <a href="#panel-userhome" id="button-1" class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all">MainMenu</a>
        <a href="#"><img src="img/ssts_logo_150px.png" ></a>
    </li>
     <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
    <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
  </ul>
  
<section class="top-bar-section">
    <!-- Right Nav Section -->
    <ul class="right">
      <li class="active"><a href="#">Visitor</a></li>
      <li class="has-dropdown not-click">
        <a href="#">Options</a>
        <ul class="dropdown"><li class="title back js-generated"><h5><a href="javascript:void(0)">Back</a></h5></li>
          <li><a href="" onclick="location.href='index.html'">Home Page</a></li>
          <li><a href="" onclick="location.href='index.html#register-art'">Get Registered</a></li>          
        </ul>
      </li>
    </ul>
  </section></nav>
		</div>	
		
<% 	
	

	ActivityDAO activityDao = new ActivityDAO();
	Activity activity = new Activity();
	RandomIndexGenerator rig = new RandomIndexGenerator();
	
	activity = activityDao.getMinMaxIDs();
	int randomIndexNumber = rig.generateRandomIndex(activity.getMinID(), activity.getMaxID());
	String randomIndexNumberString = String.valueOf(randomIndexNumber);
	
	activity.setActID(randomIndexNumberString);
	
// 	ActivityDAO getActDao = new ActivityDAO();	
	activity = activityDao.getActivityBySettingValues(activity);
	
	String actSession=activity.getActSession();
	
%>		
<!-- White Paragraph  -->					
		<div data-role="content">		
		<form >		

	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Speech Activities</h4>		
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
		<p><em>(This exercise is DAF enabled. It is advised to choose a calm environment or to wearing headsets while performing this exercise.)</em></p>
		<p><strong>Please click the black color button and read out following paragraph loud and slow :</strong></p>

			<textarea rows="4" cols="50" name="paratoread" readonly><%=actSession %></textarea>
			<br>
			<table border="0">
            <tr>
				<th>Voice Frequency:</th>
				<th id="arrayIndex">0</th>
            </tr>			
			</table>
<!-- 			<p>Frequency:</p> -->
<!-- 			<p id="arrayIndex">0</p> -->
			<p><ins><strong>Graph:</strong></ins></p>
			<canvas id="canvas" width="500" height="220"></canvas>
			
<div class="si-wrapper">						
	<p><ins><strong>Speech Output :</strong></ins></p>
	<textarea name=speechoutput rows="4" cols="50" class="si-input" placeholder="Please read the text" ></textarea>

<a href="" class="si-btn ui-btn ui-icon-grid ui-btn-icon-left ui-corner-all ui-btn-b" onclick="myAnalyzer();"><span class="si-mic"></span> <span class="si-holder"></span></a>
</div>		
	
		<input type="Submit" value="Finished !" onclick="location.href='redirectvisitor.jsp'" />
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
session.setAttribute(StaticReferences.ssnRedirectPage, "speechvisitor.jsp#dialog-nospeechinput");
response.sendRedirect("redirectvisitor.jsp");%>   
<% } else { 
   session.setAttribute(StaticReferences.ssnRedirectPage, "speechvisitor.jsp#page-2"); 
   session.setAttribute("spout", spOut); 
   session.setAttribute("spin", spIn);    
   response.setHeader("refresh", "1");
   response.sendRedirect("redirectvisitor.jsp");   

}
}
%>	
		
		<div data-role="footer" data-theme="b">
			<h4>-</h4>
		</div>
	</div>		



<div data-role="page" id="page-2" data-theme="a">
<!-- Left panel -->	
<%=StaticPanels.homePanelVisitor %>

<!-- Top bar -->	
		<div data-role="header" data-theme="b">
<nav class="top-bar" data-topbar="">
  <ul class="title-area">
    <li class="name">
    <a href="#panel-userhome" id="button-1" class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all">MainMenu</a>
        <a href="#"><img src="img/ssts_logo_150px.png" ></a>
    </li>
     <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
    <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
  </ul>
  
<section class="top-bar-section">
    <!-- Right Nav Section -->
    <ul class="right">
      <li class="active"><a href="#">Visitor</a></li>
      <li class="has-dropdown not-click">
        <a href="#">Options</a>
        <ul class="dropdown"><li class="title back js-generated"><h5><a href="javascript:void(0)">Back</a></h5></li>
          <li><a href="" onclick="location.href='index.html'">Home Page</a></li>
          <li><a href="" onclick="location.href='index.html#register-art'">Get Registered</a></li>  
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

	StutteredSpeechController ssc = new StutteredSpeechController();

	ssc = ssc.analyzeRecognizedVoiceInput(speechOutput);
	ssc.calculateSttuteredWordsAndCount(ssc.getRepeatedWordsArrayOut());

	HashMap<String , Integer> repeatedWordsAndCount = new HashMap<>();
	repeatedWordsAndCount = ssc.calculateSttuteredWordsAndCount(ssc.getRepeatedWordsArrayOut());
	
	//Calculate Score
	int speechOutputLength = ssc.textTotArray(speechOutput).length;
	int totalRepeatedWords = ssc.totalRepeated(repeatedWordsAndCount);
	String score = ssc.calculateScore(speechOutputLength, totalRepeatedWords);
	
	//Print HTML output
	html= ssc.hashmapToHtml(repeatedWordsAndCount);
%>	
	<p>Your score(beta) for the lesson is <b><%=score%>%</b>.</p>	
	
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