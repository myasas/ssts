package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.swing.JOptionPane;

/**
 * 
 * @author Yasas De Silva
 *
 */
public class InputVoiceController {

    private ArrayList<String> repeatedWordsArrayOut = new ArrayList<>();
    private ArrayList<Integer> caughtIndexArrayOut = new ArrayList<>();
    private HashMap<String, Integer> stutteredWordsnCountsHashMap = new HashMap<String, Integer> ();  

    public InputVoiceController analyzeRecognizedVoiceInput(String recognizedVoiceInput){
        InputVoiceController stutteredWordsObj = new InputVoiceController();
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
//                        System.out.println(i);
//                        System.out.println(splittedArray[i] + " " + splittedArray[i + 1]);
//                        System.out.println(splittedArray[i + 2] + " " + splittedArray[i + 3]);
                        i = i + 2;
                    }
                }
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Exception from two words repeated to log :" + e);
        }
        
//*detects if three words repeadedly pronounced (And I am)
        try {
            for (int i = 0; i < splittedArray.length - 3; i++) {
                //has the 3rd word from here repeated?
                if (splittedArray.length >= 6) {                  
                    if (splittedArray[i].equalsIgnoreCase(splittedArray[i + 3]) && splittedArray[i + 1].equalsIgnoreCase(splittedArray[i + 4]) && splittedArray[i + 2].equalsIgnoreCase(splittedArray[i + 5])) {
                caughtIndexArray.add(i);
                repeatedWordsArray.add(splittedArray[i]+" "+splittedArray[i+1]+" "+splittedArray[i+2]);  
//                        System.out.println(i);
//                        System.out.println(splittedArray[i] + " " + splittedArray[i + 1]);
//                        System.out.println(splittedArray[i + 2] + " " + splittedArray[i + 3]);
                        i = i + 3;
                    }
                }
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Exception from 3 words repeated to log :" + e);
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
