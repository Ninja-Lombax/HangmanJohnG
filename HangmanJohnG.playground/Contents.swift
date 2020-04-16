import UIKit

var str = "Hello, playground"

var letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

var wordGuessArray = ["STEAK","CHICKEN","PIZZA","HAMBURGER","SPAGHETTI","APPLE","BANANA","TACOS","SHRIMP","LASAGNA","PEAR","CAKE","PANCAKES","WINGS","FRIES","SALAD","FISH","COOKIES","CHILI","PEAS","RICE","CARROTS","CELERY","POPCORN","CORN","MOSTACCIOLI","SUSHI","RAMEN","SPINACH","LETTUCE","CHEESE","CHIPS","CHERRIES","EGGPLANT","PIES","BREADS","BISCUIT"]

var letterArrayLength = letterArray.count
var wordGuessArrayLength = wordGuessArray.count
var minNumber = 0
//var playerGuessString:String
var chooseWord = Int.random(in: minNumber ... (wordGuessArrayLength - 1))

var wordToGuess:String = wordGuessArray[chooseWord]
var playerGuess:[String] = []


func displayWordToGuess()
{
    //print(playerGuess)
    let playerGuessString = playerGuess.joined()
    //var playerGuessString = String(playerGuess)
    print(playerGuessString)
}

func compareLetters(playersChosenLetter:String)
{
    var i = 0
    var wordToGuessLetter = Array(wordToGuess)
    //wordToGuessLetter = Array(wordToGuess)
    while(i <= wordGuessArrayLength)
    {
        
        
        if(playersChosenLetter[0] == wordToGuessLetter.index(i)) //This is where I am stuck. I am trying to compare it by element because I need to replace underscores in another array
        {
            
            
        }
        
    }
    
}

func chooseLetter()
{
    var i = 0
    let randomLetter = Int.random(in: minNumber ... (letterArrayLength - 1))
    let playersChosenLetter:String = letterArray[randomLetter]
    
    compareLetters(playersChosenLetter:playersChosenLetter)
    
}



for _ in wordToGuess
{
    playerGuess.append("_")
    
}
 displayWordToGuess()

