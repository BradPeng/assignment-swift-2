import UIKit

//Challenge 1, Question 1: Find all pairs for a given sum
//Code written by Brad Peng, June 2020, for the purpose of the Game of Apps summer intern application.

//constants provided for testing
let testArray = [2, 4, 5, 1, 3, 5, 4]
let targetSum = 6

//function to check if a tuple matches any in an array of tuples. For this use case, (3, 1) == (1, 3)
func checkTuple(tupleToCheck: (Int, Int), tupleArray:[(Int, Int)]) -> Bool {
    for i in tupleArray {
        if (i.0 == tupleToCheck.0 && i.1 == tupleToCheck.1) || (i.1 == tupleToCheck.0 && i.0 == tupleToCheck.1) {
            return true
        }
    }
    return false
}

//function signature provided: DO NOT CHANGE
func findPairs(in array: [Int], withSum sum: Int) {
    
    var dictionary: [Int: Int] = [:] //Used to store [complementary numbers in array: index] in first for loop
    var list: [(Int, Int)] = [] //stores the tuples of expected pairs
    var current_value: Int //the current value in array being used
    
    //loop cycles through array and stores [complementary numbers: index] into dictionary
    //dictionaries can only have unique keys. If we see the same number twice in array, we set the dictionary to value to the index of the newest occurance of said number. This approach produces the results we are looking for.
    for index in 0...array.count - 1 {
        current_value = array[index]
        dictionary[sum - current_value] = index //complementary number is the number we need to add to form the sum value. Eg: complement of 2 for target 6 is 4
    }
    
    //loop through values in array and check if any of them are complementary to the other values in the array
    for index in 0...array.count - 1 {
        if let pair = dictionary[array[index]] { //safely unwrap the dictionary values and also check if the dictionary has a complementary value as a key
            // check 2 more conditions to determine if we have a valid pair.
            // 1: make sure the tuple is not already in the list
            // 2: make sure we are not matching dictionary key and value to itself. Edge case for situations where we have a number * 2 = sum
            //    eg: (1, 3, 1) and summing to 6 won't return (3, 3) as a pair.
            if !checkTuple(tupleToCheck: (array[index], array[pair]), tupleArray: list) && index != dictionary[array[index]] {
                list.append((array[index], array[pair]))
            }
        }
        //if the dictionary key unwraps to nil, continue for loop
    }
    
    print(list)
}


findPairs(in: testArray, withSum: targetSum) // [(2, 4), (5, 1)]
findPairs(in: [1, 2, 3, 4, 5, 6, 0], withSum: 6) // [(1, 5), (2, 4), (6, 0)]
findPairs(in: [12, 1, 3, 5, 2, 5, 3, 3], withSum: 0) // []
findPairs(in: [12, 1, 3, 5, 2, 5, 3, 3], withSum: -2) // []
findPairs(in: [-1, -3, -4, 0, 2, -6], withSum: -4) // [(-1, -3), (-4, 0), (2, -6)]

