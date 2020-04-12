import UIKit

var str = "Hello, playground"

var letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

var wordGuessArray = ["STEAK","CHICKEN","PIZZA","HAMBURGER","SPAGHETTI","APPLE","BANANA","TACOS","SHRIMP","LASAGNA","PEAR","CAKE","PANCAKES","WINGS","FRIES","SALAD","FISH","COOKIES","CHILI","PEAS","RICE","CARROTS","CELERY","POPCORN","CORN","MOSTACCIOLI","SUSHI","RAMEN","SPINACH","LETTUCE","CHEESE","CHIPS","CHERRIES","EGGPLANT","PIES","BREADS","BISCUIT"]

var letterArrayLength = letterArray.count
var wordGuessArrayLength = wordGuessArray.count
var minNumber = 0
//var playerGuessString:String
var chooseWord = Int.random(in: minNumber ... (wordGuessArrayLength - 1))

var wordToGuess = wordGuessArray[chooseWord]
var playerGuess:[String] = []


func displayWordToGuess()
{
    //print(playerGuess)
    let playerGuessString = playerGuess.joined()
    //var playerGuessString = String(playerGuess)
    print(playerGuessString)
}

for _ in wordToGuess
{
    playerGuess.append("_")
    
}
 displayWordToGuess()
