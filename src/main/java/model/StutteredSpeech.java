package model;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * 
 * @author Yasas De Silva
 *
 */
public class StutteredSpeech {

	private ArrayList<String> repeatedWordsArrayOut;
    private ArrayList<Integer> caughtIndexArrayOut;
    private HashMap<String, Integer> stutteredWordsnCountsHashMap;

//  Getters and Setter    
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
