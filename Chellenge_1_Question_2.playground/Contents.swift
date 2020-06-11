import UIKit

//Challenge 1, Question 2: Is Palindrome?
//Code written by Brad Peng for the purpose of the Game of Apps summer intern application.

func isPalindrome(_ word: String) -> Bool {
    
    //lowercase the entire word and remove spaces
    let formattedWord = word.lowercased().replacingOccurrences(of: " ", with: "")
    
    //compare the reversed word and the original word. String() needed to convert result to type String
    if String(formattedWord.reversed()) == formattedWord {
        return true
    }
    
    return false
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
