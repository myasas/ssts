package util;

import java.util.Random;

public class RandomIndexGenerator {

	public Integer generateRandomIndex(int Low, int High) {
		Random random = new Random();
		int randomIndex = random.nextInt((High+1)-Low) + Low;
		return randomIndex;
	}
	
	
//	public static void main(String[] args) {
//
//		RandomIndexGenerator ri = new RandomIndexGenerator();
//		
//		System.out.println(ri.generateRandomIndex(1, 5));
//		
//	}	
}
