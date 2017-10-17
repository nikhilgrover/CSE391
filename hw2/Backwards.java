/*
 * Nikhil Grover
 * CSE391
 * Homework 2
 *
 * Task 2
 *
 * Backwards.java takes command line arguments 
 * and prints back the argument, with each string backwards
 */
public class Backwards {
    public static void main(String[] args) {
	//Loop through args, grab each string, reverse it
	for(int i = 0; i < args.length; i++) {
	    String cur = args[i];
	    while(cur.length() > 0) {
		System.out.print(cur.charAt(cur.length() - 1));
		cur = cur.substring(0, cur.length() -1);
	    }
	    System.out.println();
	}
    }
}
