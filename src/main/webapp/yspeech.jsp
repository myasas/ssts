<%@page import="java.util.HashMap"%>
<%@page import="controller.InputVoiceController"%>
<%@page import="data.DatabaseConnection"%>
<%@ page import ="java.sql.*" %>
<%
	String paraToRead = request.getParameter("paratoread");   
    String speechOutput = request.getParameter("speechoutput");   
 

InputVoiceController ivc = new InputVoiceController();

	ivc = ivc.analyzeRecognizedVoiceInput(speechOutput);
	ivc.calculateSttuteredWordsAndCount(ivc.getRepeatedWordsArrayOut());

	HashMap<String , Integer> repeatedWordsAndCount = new HashMap<>();
	repeatedWordsAndCount = 	ivc.calculateSttuteredWordsAndCount(ivc.getRepeatedWordsArrayOut());
	
	String html= ivc.hashmapToHtml(repeatedWordsAndCount);
	
	
	out.println("What you were given to read :"+paraToRead+"<br>");
	out.println("What you read :"+speechOutput+"<br><br>");
	
	out.println("Your score for this exercise is : BEST to be implemented in 1 hour <br><br>");		
	
	out.println("Your repeated words and counts for this exercise are,"+speechOutput);
	out.println(html);

%>