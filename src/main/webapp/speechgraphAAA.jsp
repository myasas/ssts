<%@page import="model.Feedback"%>
<%@ page import ="dao.FeedbackDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import ="controller.UserController" %>
<%@page import="configuration.StaticReferences"%>
<%@page import="configuration.StaticPanels"%>

<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>
<%} else {

%>  

<!DOCTYPE html>  
    
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
<script type="text/javascript" src="/js/lib/dummy.js"></script>
 <link rel="stylesheet" type="text/css" href="/css/result-light.css">

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
    alert("Error in getUserMedia: " + e);
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

<!-- Title bar - Title of page -->
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
	

	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Speech with DAF</h4>		
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
			<p>Following is the speech graph with DAF</p>
			<p>Graph:</p>
			<canvas id="canvas" width="500" height="256"></canvas>
			<p>Frequency:</p>
			<p id="arrayIndex">0</p>
			<a href="" onclick="myAnalyzer();">Start Analyzer</a>			
		</div>	
		</div>		
<!-- footer -->
		<div data-role="footer" data-theme="b">
			<h4>-</h4>
		</div>
	</div>		

<!-- Dialog box if needed -->
	<div data-role="page" data-dialog="true" id="dialog-1" data-theme="b">
		<div data-role="header">
			<h1>Dialog Title</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Dialog content</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		
	
</body>
</html> 
<%
    }
%>