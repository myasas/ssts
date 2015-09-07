package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import configuration.StaticReferences;


/**
 * 
 * @author Yasas De Silva
 *
 */
public class StutteredSpeechController {
	private static final Logger LOGGER= Logger.getLogger(StutteredSpeechController.class);  
	public StutteredSpeechController() {
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
	}
	
    private ArrayList<String> repeatedWordsArrayOut = new ArrayList<>();
    private ArrayList<Integer> caughtIndexArrayOut = new ArrayList<>();
    private HashMap<String, Integer> stutteredWordsnCountsHashMap = new HashMap<String, Integer> ();  

    public StutteredSpeechController analyzeRecognizedVoiceInput(String recognizedVoiceInput){
        StutteredSpeechController stutteredWordsObj = new StutteredSpeechController();
        String[] splittedArray = stutteredWordsObj.textTotArray(recognizedVoiceInput);
        
        ArrayList<String> repeatedWordsArray = new ArrayList<>();
        ArrayList<Integer> caughtIndexArray = new ArrayList<>();        
        
//*detects if one word has repeately pronounced (Eg : I)
        for(int i=0 ; i<splittedArray.length-1 ; i++){
            //has the next word rpeated?
            if(splittedArray[i+1] !=null &&splittedArray[i].equalsIgnoreCase(splittedArray[i+1])){
                caughtIndexArray.add(i);
                repeatedWordsArray.add(splittedArray[i]);  
            }
        }
 
//*detects if two words repeatedly pronounced (Eg : I am)
        try {
            for (int i = 0; i < splittedArray.length - 2; i++) {
                //has the next two words rpeated?
                if (splittedArray.length >= 4) {                  
                    if (splittedArray[i].equalsIgnoreCase(splittedArray[i + 2]) && splittedArray[i + 1].equalsIgnoreCase(splittedArray[i + 3])) {
                caughtIndexArray.add(i);
                repeatedWordsArray.add(splittedArray[i]+" "+splittedArray[i+1]);  

                        i = i + 2;
                    }
                }
            }
        } catch (Exception e) {
        	LOGGER.error("Exception in -2words repeated-", e);            
        }
        
//*detects if three words repeadedly pronounced (And I am)
        try {
            for (int i = 0; i < splittedArray.length - 3; i++) {
                //has the 3rd word from here repeated?
                if (splittedArray.length >= 6) {                  
                    if (splittedArray[i].equalsIgnoreCase(splittedArray[i + 3]) && splittedArray[i + 1].equalsIgnoreCase(splittedArray[i + 4]) && splittedArray[i + 2].equalsIgnoreCase(splittedArray[i + 5])) {
                caughtIndexArray.add(i);
                repeatedWordsArray.add(splittedArray[i]+" "+splittedArray[i+1]+" "+splittedArray[i+2]);  

                        i = i + 3;
                    }
                }
            }
        } catch (Exception e) {
//			Log error	
        	LOGGER.error("Exception in -3words repeated-", e);        	            
        }    
//Returns Repeated words in an Array with out any modification
        stutteredWordsObj.setRepeatedWordsArrayOut(repeatedWordsArray);
//Returns Index to the starting repeated word in the same order as in Repeated Words Array        
        stutteredWordsObj.setCaughtIndexArrayOut(caughtIndexArray);          
        return stutteredWordsObj;
    }
    
    
    public HashMap calculateSttuteredWordsAndCount(ArrayList<String> repeatedWordsArray){         
//        Search the array list
            while(!repeatedWordsArray.isEmpty()){
               String currentWord =repeatedWordsArray.get(0);
               
               if(stutteredWordsnCountsHashMap.get(currentWord)!=null){
                 int countOfCurrentWord = stutteredWordsnCountsHashMap.get(currentWord);
                stutteredWordsnCountsHashMap.put(currentWord.toLowerCase(), countOfCurrentWord+1);              
               }else{
                stutteredWordsnCountsHashMap.put(currentWord.toLowerCase(), 1);                 
               }
               repeatedWordsArray.remove(0);
            }
        return stutteredWordsnCountsHashMap;         
    }
    
	public String hashmapToHtml(HashMap<String, Integer> stutteredWordCountHashMap) {

		StringBuilder htmlBuilder = new StringBuilder();
		htmlBuilder.append("<table border=5>");
		htmlBuilder.append("<tr><td align=\"center\"><b>Word</b></td><td align=\"center\"><b>Count<b></td></tr>");

		for (Entry<String, Integer> entry : stutteredWordCountHashMap.entrySet()) {
			htmlBuilder.append(String.format("<tr><td align=\"center\">%s</td><td align=\"center\">%d</td></tr>",
					entry.getKey(), entry.getValue()));
		}
		htmlBuilder.append("</table>");
		String html = htmlBuilder.toString();
		
		return html;
	}
    
//Total repeated word count from the hash map
	public Integer totalRepeated(HashMap<String, Integer> hashMap) {
		int count = 0;
		for (int f : hashMap.values()) {
			count += f;
		}

		return count;
	}	
	
//Calculate the score for the speech output	
	public String calculateScore(Integer speechOutputLength, Integer totalRepeatedWords) {
		float decimal = ((float) totalRepeatedWords) / speechOutputLength;
		float decimalInvert = 1-decimal;
		float percentage = decimalInvert * 100;
		String score = String.format("%2.00f", percentage);		
		return score;
	}	
	
//    Getters and Setter
    public String[] textTotArray(String inputText){
        String[] splitted = inputText.split("\\s+");
        return splitted;
    }

    /**
     * @return the repeatedWordsArrayOut
     */
    public ArrayList<String> getRepeatedWordsArrayOut() {
        return repeatedWordsArrayOut;
    }

    /**
     * @param repeatedWordsArrayOut the repeatedWordsArrayOut to set
     */
    public void setRepeatedWordsArrayOut(ArrayList<String> repeatedWordsArrayOut) {
        this.repeatedWordsArrayOut = repeatedWordsArrayOut;
    }

    /**
     * @return the caughtIndexArrayOut
     */
    public ArrayList<Integer> getCaughtIndexArrayOut() {
        return caughtIndexArrayOut;
    }

    /**
     * @param caughtIndexArrayOut the caughtIndexArrayOut to set
     */
    public void setCaughtIndexArrayOut(ArrayList<Integer> caughtIndexArrayOut) {
        this.caughtIndexArrayOut = caughtIndexArrayOut;
    }

    /**
     * @return the stutteredWordsnCountsHashMap
     */
    public HashMap<String, Integer> getStutteredWordsnCountsHashMap() {
        return stutteredWordsnCountsHashMap;
    }

    /**
     * @param stutteredWordsnCountsHashMap the stutteredWordsnCountsHashMap to set
     */
    public void setStutteredWordsnCountsHashMap(HashMap<String, Integer> stutteredWordsnCountsHashMap) {
        this.stutteredWordsnCountsHashMap = stutteredWordsnCountsHashMap;
    }
    
}
