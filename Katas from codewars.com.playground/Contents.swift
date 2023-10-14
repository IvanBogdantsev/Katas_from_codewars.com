import Foundation

/*
 The most basic encryption method is to map a char to another char by a certain math rule. Because every char has an ASCII value, we can manipulate this value with a simple math expression. For example 'a' + 1 would give us 'b', because 'a' value is 97 and 'b' value is 98.
 
 You will need to write a method which does exactly that -
 
 get a string as text and an int as the rule of manipulation, and should return encrypted text. for example:
 
 encrypt("a",1) = "b"
 
 Full ascii table is used on our question (256 chars) - so 0-255 are the valid values.
 
 If the value exceeds 255, it should 'wrap'. ie. if the value is 345 it should wrap to 89.
 
 Good luck.
 */
func encrypt(text:String, rule:Int) -> String {
    return text.map { UnicodeScalar(Int(Int($0.asciiValue!) + rule) % 256)! }.map { String($0) }.joined()
}

/*
 Write a program that will calculate the number of trailing zeros in a factorial of a given number.
 
 N! = 1 * 2 * 3 *  ... * N
 
 Be careful 1000! has 2568 digits...
 
 For more info, see: http://mathworld.wolfram.com/Factorial.html
 Hint: You're not meant to calculate the factorial. Find another way to find the number of zeros.
 */
func zeros(_ n: UInt32) -> UInt32 {
    var result: UInt32 = 0
    var copy = n
    while copy >= 5 { result += copy / 5; copy /= 5 }
    return result
}

/*
 Task
 
 You'll have to translate a string to Pilot's alphabet (NATO phonetic alphabet).
 
 Input:
 
 If, you can read?
 
 Output:
 
 India Foxtrot , Yankee Oscar Uniform Charlie Alfa November Romeo Echo Alfa Delta ?
 
 Note:
 
 There are preloaded dictionary you can use, named NATO
 The set of used punctuation is ,.!?.
 Punctuation should be kept in your return string, but spaces should not.
 Xray should not have a dash within.
 Every word and punctuation mark should be seperated by a space ' '.
 There should be no trailing whitespace
 */

 func toNato(_ words: String) -> String {
 return words.map { natoAlphabet[$0.uppercased()] == nil ? String($0) : natoAlphabet[$0.uppercased()]! }.filter { $0 != " " }.joined(separator: " ")
 }
 
/*
 In this kata you have to correctly return who is the "survivor", ie: the last element of a Josephus permutation.
 
 Basically you have to assume that n people are put into a circle and that they are eliminated in steps of k elements, like this:
 
 n=7, k=3 => means 7 people in a circle
 one every 3 is eliminated until one remains
 [1,2,3,4,5,6,7] - initial sequence
 [1,2,4,5,6,7] => 3 is counted out
 [1,2,4,5,7] => 6 is counted out
 [1,4,5,7] => 2 is counted out
 [1,4,5] => 7 is counted out
 [1,4] => 5 is counted out
 [4] => 1 counted out, 4 is the last element - the survivor!
 
 The above link about the "base" kata description will give you a more thorough insight about the origin of this kind of permutation, but basically that's all that there is to know to solve this kata.
 
 Notes and tips: using the solution to the other kata to check your function may be helpful, but as much larger numbers will be used, using an array/list to compute the number of the survivor may be too slow; you may assume that both n and k will always be >=1.
 */
func josephusSurvivor(_ n: Int, _ k: Int) -> Int {
    n == 1 ? 1 : (josephusSurvivor(n-1, k) + k-1) % n + 1
}

/*
 Definition
 
 A number is a Special Number if it’s digits only consist 0, 1, 2, 3, 4 or 5
 
 Given a number determine if it special number or not .
 
 Notes
 
 The number passed will be positive (N > 0) .
 
 All single-digit numbers within the interval [1:5] are considered as special number.
 
 Input >> Output Examples
 
 specialNumber(2) ==> return "Special!!"
 Explanation:
 
 It's a single-digit number within the interval [1:5] .
 
 specialNumber(9) ==> return "NOT!!"
 Explanation:
 
 Although, it's a single-digit number but Outside the interval [1:5] .
 
 specialNumber(23) ==> return "Special!!"
 */
func specialNumber(_ number: Int) -> String {
    return number.description.map { (0...5).contains($0.wholeNumberValue!) }.reduce(true, {$0 && $1}) ? "Special!!" : "NOT!!"
}

/*
 Simple, given a string of words, return the length of the shortest word(s).
 
 String will never be empty and you do not need to account for different data types.
 */
func find_short(_ str: String) -> Int {
    str.components(separatedBy: .whitespaces).sorted { $0.count < $1.count }.first!.count
}

/*
 Count the number of Duplicates
 
 Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
 
 Example
 
 "abcde" -> 0  # no characters repeats more than once
 "aabbcde" -> 2  # 'a' and 'b'
 "aabBcde" -> 2  # 'a' occurs twice and 'b' twice (`b` and `B`)
 "indivisibility" -> 1  # 'i' occurs six times
 "Indivisibilities" -> 2  # 'i' occurs seven times and 's' occurs twice
 "aA11" -> 2  # 'a' and '1'
 "ABBA" -> 2  # 'A' and 'B' each occur twice
 */
func countDuplicates(_ s: String) -> Int {
    s.reduce(into: [:]) { $0[$1.lowercased(), default: 0] += 1 }.filter { $0.value > 1 }.count
}

/*
 Trolls are attacking your comment section!
 
 A common way to deal with this situation is to remove all of the vowels from the trolls' comments, neutralizing the threat.
 
 Your task is to write a function that takes a string and return a new string with all vowels removed.
 
 For example, the string "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".
 
 Note: for this kata y isn't considered a vowel.
 */
func disemvowel(_ s: String) -> String {
    s.filter { !"aeiou".contains($0.lowercased()) }
}

/*
 Return the century of the input year. The input will always be a 4 digit string, so there is no need for validation.
 
 Examples
 
 "1999" --> "20th"
 "2011" --> "21st"
 "2154" --> "22nd"
 "2259" --> "23rd"
 "1124" --> "12th"
 "2000" --> "20th"
 */
func whatCentury(_ year: String) -> String {
    var century = Int((Double(year)! / 100).rounded(.up)).description
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter.string(from: NSNumber(value: Int(century)!))!
}

/*
 Write a simple camelCase function for strings. All words must have their first letter capitalized and all spaces removed.

 For instance:

 camelCase("hello case"); // ==> "HelloCase"
 camelCase("camel case word"); // ==> "CamelCaseWord"
 Don't forget to rate this kata! Thanks :)
 */
func camelCase(_ str: String) -> String {
    str.components(separatedBy: .whitespaces).map { $0.capitalized }.joined()
}

/*
 Welcome. In this kata, you are asked to square every digit of a number and concatenate them.

 For example, if we run 9119 through the function, 811181 will come out, because 92 is 81 and 12 is 1. (81-1-1-81)

 Example #2: An input of 765 will/should return 493625 because 72 is 49, 62 is 36, and 52 is 25. (49-36-25)

 Note: The function accepts an integer and returns an integer.

 Happy Coding!
 */
func squareDigits(_ num: Int) -> Int {
    Int(num.description.map { ($0.wholeNumberValue! * $0.wholeNumberValue!).description }.joined())!
}

/*
 Write a method that will search an array of strings for all strings that contain another string, ignoring capitalization. Then return an array of the found strings.

 The method takes two parameters, the query string and the array of strings to search, and returns an array.

 If the string isn't contained in any of the strings in the array, the method returns an array containing a single string: "Empty" (or Nothing in Haskell, or "None" in Python and C)

 Examples

 If the string to search for is "me", and the array to search is ["home", "milk", "Mercury", "fish"], the method should return ["home", "Mercury"].
 */
func wordSearch(_ str:String, _ arr:[String]) -> [String] {
    let res = arr.filter { $0.lowercased().contains(str.lowercased()) }
    return res.isEmpty ? ["Empty"] : res
}

/*
 The Language

 MiniStringFuck is a derivative of the famous Brainfuck which contains a memory cell as its only form of data storage as opposed to a memory tape of 30,000 cells in Brainfuck. The memory cell in MiniStringFuck initially starts at 0. MiniStringFuck contains only 2 commands as opposed to 8:

 + - Increment the memory cell. If it reaches 256, wrap to 0.
 . - Output the value of the memory cell as a character with code point equal to the value
 For example, here is a MiniStringFuck program that outputs the string "Hello, World!":

 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.+++++++++++++++++++++++++++++.+++++++..+++.+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.+++++++++++++++++++++++++++++++++++++++++++++++++++++++.++++++++++++++++++++++++.+++.++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.
 And here is another program that prints the uppercase English alphabet:

 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.
 Any characters in a MiniStringFuck program other than + or . are simply non-command characters (no-ops, i.e. do nothing) and therefore can serve as comments in the program.

 The Task

 Time to write your first Esolang interpreter :D

 Your task is to implement a MiniStringFuck interpreter myFirstInterpreter()/my_first_interpreter()/Interpreter()/interpret() MyFirstInterpreter() (depending on your language) which accepts exactly 1 required argument code/$code/strng which is the MiniStringFuck program to be executed. The output of the program should then be returned by your interpreter as a string.

 Since this is the first time you are about to write an interpreter for an Esolang, here are a few quick tips:

 If you are afraid that your interpreter will be confused by non-command characters appearing in the MiniStringFuck program, you can try to remove all non-command characters from the code input before letting your interpreter interpret it
 The memory cell in MiniStringFuck only ever contains a single integer value - think of how it can be modelled in your interpreter
 If you are stuck as to how to interpret the string as a program, try thinking of strings as an array of characters. Try looping through the "program" like you would an array
 Writing an interpreter for an Esolang can sometimes be quite confusing! It never hurts to add a few comments in your interpreter as you implement it to remind yourself of what is happening within the interpreter at every stage
 NOTE: If you would not like to name your interpreter as myFirstInterpreter()/my_first_interpreter(), you can optionally rename it to either miniStringFuck()/mini_string_fuck() or interpreter() instead - the test cases will handle the rest for you. Not available in Java, Go, Swift, TypeScript, Haskell, Elixir, C++, C#, Rust, R, Erlang, F#, Factor, COBOL and NASM; irrelevant to Brainfuck solvers ;)

 Good luck :D
 */
func interpreter(_ prog: String) -> String {
    var cell = 0
        
    return prog
        .filter { $0 == "+" || $0 == "." }
        .components(separatedBy: .punctuationCharacters)
        .dropLast()
        .map {
            cell = (cell + $0.count) % 256
            let scalar = UnicodeScalar(cell)
            return String(scalar!)
        }
        .joined()
}

/*
 The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

 Examples

 "din"      =>  "((("
 "recede"   =>  "()()()"
 "Success"  =>  ")())())"
 "(( @"     =>  "))(("
 Notes

 Assertion messages may be unclear about what they display in some languages. If you read "...It Should encode XXX", the "XXX" is the expected result, not the input!
 */
func duplicateEncode(_ word: String) -> String {
    let dict = Dictionary(word.lowercased().map {($0, 1)}, uniquingKeysWith: +)
    return word.lowercased().map { dict[$0] == 1 ? "(" : ")" }.joined()
}

/*
 If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

 Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in. Additionally, if the number is negative, return 0 (for languages that do have them).

 Note: If the number is a multiple of both 3 and 5, only count it once.
 */
func solution(_ num: Int) -> Int {
   num <= 0 ? 0 : (0..<num).filter { $0 % 3 == 0 || $0 % 5 == 0 }.reduce(0, +)
}

/*
 Given an array of integers, find the one that appears an odd number of times.

 There will always be only one integer that appears an odd number of times.

 Examples

 [7] should return 7, because it occurs 1 time (which is odd).
 [0] should return 0, because it occurs 1 time (which is odd).
 [1,1,2] should return 2, because it occurs 1 time (which is odd).
 [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
 [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).
 */
func findIt(_ seq: [Int]) -> Int {
  seq.reduce(0, ^)
}

/*
 Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that checks whether the two arrays have the "same" elements, with the same multiplicities (the multiplicity of a member is the number of times it appears). "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

 Examples

 Valid arrays

 a = [121, 144, 19, 161, 19, 144, 19, 11]
 b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
 comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

 a = [121, 144, 19, 161, 19, 144, 19, 11]
 b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
 Invalid arrays

 If, for example, we change the first number to something else, comp is not returning true anymore:

 a = [121, 144, 19, 161, 19, 144, 19, 11]
 b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
 comp(a,b) returns false because in b 132 is not the square of any number of a.

 a = [121, 144, 19, 161, 19, 144, 19, 11]
 b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
 comp(a,b) returns false because in b 36100 is not the square of any number of a.

 Remarks

 a or b might be [] or {} (all languages except R, Shell).
 a or b might be nil or null or None or nothing (except in C++, COBOL, Crystal, D, Dart, Elixir, Fortran, F#, Haskell, Nim, OCaml, Pascal, Perl, PowerShell, Prolog, PureScript, R, Racket, Rust, Shell, Swift).
 If a or b are nil (or null or None, depending on the language), the problem doesn't make sense so return false.

 Note for C

 The two arrays have the same size (> 0) given as parameter in function comp.
 */
func comp(_ a: [Int], _ b: [Int]) -> Bool {
    a.map { $0 * $0 }.sorted() == b.sorted()
}

/*
 Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

 Examples:

 spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
 spinWords( "This is a test") => returns "This is a test"
 spinWords( "This is another test" )=> returns "This is rehtona test"
 */
func spinWords(in sentence: String) -> String {
    sentence.components(separatedBy: .whitespaces).map {
        $0.count >= 5 ? String($0.reversed()) : $0
    }.joined(separator: " ")
}

/*
 Given the triangle of consecutive odd numbers:

              1
           3     5
        7     9    11
    13    15    17    19
 21    23    25    27    29
 ...
 Calculate the sum of the numbers in the nth row of this triangle (starting at index 1) e.g.: (Input --> Output)

 1 -->  1
 2 --> 3 + 5 = 8
 */
func rowSumOddNumbers(_ row: Int) -> Int {
    return Int(pow(Double(row), Double(3)))
}

/*
 The Arara are an isolated tribe found in the Amazon who count in pairs. For example one to eight is as follows:

 1 = anane
 2 = adak
 3 = adak anane
 4 = adak adak
 5 = adak adak anane
 6 = adak adak adak
 7 = adak adak adak anane
 8 = adak adak adak adak

 Take a given number and return the Arara's equivalent.
 */
func countArare(_ n: Int) -> String {
    return (String(repeating: "adak ", count: n/2) + String(repeating: "anane", count: n%2)).trimmingCharacters(in: .whitespaces)
}

/*
 The rgb function is incomplete. Complete it so that passing in RGB decimal values will result in a hexadecimal representation being returned. Valid decimal values for RGB are 0 - 255. Any values that fall out of that range must be rounded to the closest valid value.

 Note: Your answer should always be 6 characters long, the shorthand with 3 will not work here.

 The following are examples of expected output values:

 kata.rgb(255, 255, 255) -- returns FFFFFF
 kata.rgb(255, 255, 300) -- returns FFFFFF
 kata.rgb(0, 0, 0) -- returns 000000
 kata.rgb(148, 0, 211) -- returns 9400D3
 */
func rgb(_ red: Int, _ green: Int, _ blue: Int) -> String {
  return [red, green, blue].map { min(max($0, 0), 255) }.map { String(format: "%02X", $0) }.joined()
}

var dict: [Int : Int] = [1 : 1]
dict[1] = 0
dict[1]

/*
 In the morning all the doors in the school are closed. The school is quite big: there are N doors. Then pupils start coming. It might be hard to believe, but all of them want to study! Also, there are exactly N children studying in this school, and they come one by one.

 When these strange children pass by some doors they change their status (i.e. Open -> Closed, Closed -> Open). Each student has their number, and each i-th student alters the status of every i-th door. For example: when the first child comes to the schools, he changes every first door (he opens all of them). The second one changes the status of every second door (he closes some doors: the 2nd, the 4th and so on). Finally, when the last one – the n-th – comes to the school, he changes the status of each n-th door (there's only one such door, though).

 You need to count how many doors are left opened after all the students have come.
 */

func doors(_ n: Int) -> Int {
    return Array(1...n).map { sqrt(Double($0)).truncatingRemainder(dividingBy: 1) == 0}.filter { $0 }.count
}
