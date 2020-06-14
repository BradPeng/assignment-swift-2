import UIKit

//Challenge 1, Question 2: Is Palindrome? Create a function that checks if a string is a palindrome and returns true or false.
//Code written by Brad Peng, June 2020, for the purpose of the Game of Apps summer intern application.

//Function signature provided: DO NOT CHANGE
func isPalindrome(_ word: String) -> Bool {
    
    if Array(word).count == 0 {
        return false
    }
    
    //lowercase the entire word and remove spaces. Convert to array to compare letters.
    let formattedWord = Array(word.lowercased().replacingOccurrences(of: " ", with: ""))
    
    //slightly faster than using .reverse() because we don't need to reverse an entire string before comparing letters. We can return false as soon as a mismatch is detected. In the case where it is a palindrome, the two methods should take the same amount of time.
    for letterIndex in 0...formattedWord.count/2 - 1 { //range automatically floors fractional values
        if formattedWord[letterIndex] != formattedWord[formattedWord.count - letterIndex - 1] {
            return false
        }
    }
    
    return true
    
}

//Should print true:
print(isPalindrome("radar"))
print(isPalindrome("bob"))
print(isPalindrome("asdfdsa"))
print(isPalindrome("Radar")) //test case for mixed-case letters
print(isPalindrome("r a d a r")) //test case for spaces
print(isPalindrome("R a D a R")) //test case for both spaces and mixed-case letters

//Should print false:
print(isPalindrome("dog"))
print(isPalindrome("cat"))
print(isPalindrome("Dog")) //test case for mixed-case letters
print(isPalindrome(" d o g")) //test case for spaces
print(isPalindrome("DoG")) //test case for both spaces and mixed-case letters
