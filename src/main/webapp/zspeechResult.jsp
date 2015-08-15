<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">

<title>Speech In</title>		
</head>
<body>

	<div data-role="page" id="page-2" data-theme="c">
		<div data-role="header" data-theme="a">
<!-- 			<a href="#" data-role="button" data-rel="back" data-icon="back">Back</a> -->
			<h1 id="heading-1" class="ui-bar ui-bar-a ui-corner-all">Smart Speech Therapist</h1>
			
		</div>
		
		<form method="post" action="speechIn.jsp">		
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
			<p>Please click the microphone icon when you are ready. Then read the paragraph below.</p>
			
			<p>Please read this out loud :</p>
			<textarea rows="4" cols="50" name="paratoread"   disabled="disabled"  >"My mom and I are very best friends. We even goto shopping together."</textarea>
			<br>
			<p>Speech Output :</p>
<div class="si-wrapper">
	<textarea name=speechoutput rows="4" cols="50" class="si-input" placeholder="Please read the text"></textarea>
	<a href="" class="si-btn ui-btn ui-icon-grid ui-btn-icon-left ui-corner-all ui-btn-b"><span class="si-mic"></span> <span class="si-holder"></span></a>
</div>		
		<input type="submit" value="Finished !" />
		</div>
		
		</form>
		
		<div data-role="footer" data-theme="a">
			<h4>-</h4>
		</div>
	</div>
	
	
<script src="js/speech-input.js"></script>	
</body>
</html>