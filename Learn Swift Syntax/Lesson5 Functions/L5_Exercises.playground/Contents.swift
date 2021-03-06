//: # Lesson 5 Exercises - Defining and Calling Functions

import UIKit

//: __Problem 1.__
//:
//:Earlier we used the method, removeAtIndex() to remove the first letter of a string. This method belongs to the String class. See if you can use this same method to return the last letter of a string.

//:Test out your discovery below by returning the last letter of the String, "bologna".
var word = "bologna"

word.endIndex
word.distance(from: word.startIndex, to: word.endIndex)
word.remove(at: word.index(before: word.endIndex))
word.startIndex
word.endIndex

//: __Problem 2__
//:
//: Write a function called combineLastCharacters. It should take in an array of strings, collect the last character of each string and combine those characters to make a new string to return. Use the strategy you discovered in Problem 1 along with a for-in loop to write combineLastCharacters. Then try it on the nonsenseArray below.
var nonsenseArray = ["bungalow", "buffalo", "indigo", "although", "Ontario", "albino", "%$&#!"]


func combineLastCharacters(inputStringArray : [String]) -> String {
    
    var newString : String = ""
    
    for string in inputStringArray {
        
        var str = string
        newString = newString  + "\(str.remove(at: str.index(before: str.endIndex)))"
        
    }
    
    return newString
}

print (combineLastCharacters(inputStringArray: nonsenseArray))



//: __Problem 3__
//:
//: Imagine you are writing an app that keeps track of what you spend during the week. Prices of items purchased are entered into a "price" textfield. The "price" field should only allow numbers, no letters.

//: NSCharacterSet.decimalDigitCharacterSet() is used below to define a set that is only digits. Using that set, write a function that takes in a String and returns true if that string is numeric and false if it contains any characters that are not numbers.

//: __3a.__ Write a signature for a function that takes in a String and returns a Bool

func isPrice (price : String) -> Bool {

    let digits = CharacterSet.decimalDigits
    
    let charSetPrice = CharacterSet(charactersIn: price)
    
    
    if digits.isSubset(of: charSetPrice){
        print("subst")
    }
    
    
    
    if digits.isDisjoint(with: charSetPrice) {
            return false
    }
    
    return true
    
}

isPrice(price: "34")


//: __3b.__ Write a for-in loop that checks each character of a string to see if it is a member of the "digits" set. Use the .unicodeScalars property to access all the characters in a string. Hint: the method longCharacterIsMember may come in handy.

let digits = CharacterSet.decimalDigits


// real solution

func digitsOnly(_ word: String) -> Bool {
    
    for character in word.unicodeScalars {
        if !digits.contains(UnicodeScalar(character.value)!) {
            return false
        }
    }
    return true
}

digitsOnly("33")
//: __Problem 4__
//:
//: Write a function that takes in an array of dirtyWord strings, removes all of the four-letter words, and returns a clean array.
let dirtyWordsArray = ["phooey", "darn", "drat", "blurgh", "jupiters", "argh", "fudge"]


func removeFourLetterWord (wordArray : [String]) -> [String] {
    
    var newArray = wordArray
    
    var count = 0
    for word in newArray {
        if word.distance(from: word.startIndex, to: word.endIndex) == 4 {
            newArray.remove(at: count)
        }else{
            count += 1
        }
        
    }
    
    return newArray
    
    
    
}

removeFourLetterWord(wordArray: dirtyWordsArray)
//: __Problem 5__
//:
//: Write a method, filterByDirector, that belongs to the MovieArchive class.  This method should take in a dictionary of movie titles and a string representing the name of a director and return an array of movies created by that director. You can use the movie dictionary below. To test your method, instantiate an instance of the MovieArchive class and call filterByDirector from that instance.

var movies:Dictionary<String,String> = [ "Boyhood":"Richard Linklater","Inception":"Christopher Nolan", "The Hurt Locker":"Kathryn Bigelow", "Selma":"Ava Du Vernay", "Interstellar":"Christopher Nolan"]

class MovieArchive {
    
    func filterByDirector(movies : Dictionary<String, String>, thatDirector : String) -> [String] {
        
        
        var moviesByDirector = [String]()
        
        for (movie, director) in movies {
            
            if director == thatDirector {
                
                moviesByDirector.append(movie)
            }
            
            
        }
        
        
        return moviesByDirector
    }

}

var myMovieArchive = MovieArchive()

myMovieArchive.filterByDirector(movies: movies, thatDirector: "Christopher Nolan")





