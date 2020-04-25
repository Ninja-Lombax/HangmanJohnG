import UIKit

var str = "Hello, playground"

var letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
//var letterArray:Character = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
var wordGuessArray = ["STEAK","CHICKEN","PIZZA","HAMBURGER","SPAGHETTI","APPLE","BANANA","TACOS","SHRIMP","LASAGNA","PEAR","CAKE","PANCAKES","WINGS","FRIES","SALAD","FISH","COOKIES","CHILI","PEAS","RICE","CARROTS","CELERY","POPCORN","CORN","MOSTACCIOLI","SUSHI","RAMEN","SPINACH","LETTUCE","CHEESE","CHIPS","CHERRIES","EGGPLANT","PIES","BREADS","BISCUIT"]

var letterArrayLength = letterArray.count
var wordGuessArrayLength = wordGuessArray.count
var minNumber = 0
var loopRun = 0
var incrementChance = 0, winState = 0
//var playerGuessString:String
var chooseWord = Int.random(in: minNumber ... (wordGuessArrayLength - 1))
var wordToGuess = wordGuessArray[chooseWord]
var wordToGuessLength = wordToGuess.count
var numberofChances = 0
let maximumChances = 7
var playerGuess:[String] = []



func displayWordToGuess()
{
    //print(playerGuess)
    print("\nThe word you are trying to guess is: ")
    let playerGuessString = playerGuess.joined()
    //var playerGuessString = String(playerGuess)
    print(playerGuessString)
    sleep(1)
}

func compareLetters(playersChosenLetter:String)
{
    var i = 0
    var wordToGuessLetter = Array(wordToGuess)
    //wordToGuessLetter = Array(wordToGuess)
    //var playerGuessS = Array(playerGuess)
    var playersChosen = Array(playersChosenLetter)
    incrementChance = 0

    while(i <= (wordToGuess.count - 1))
    {
        
        //if(playersChosenLetter == Array(repeating: wordToGuess[i]) //This is where I am stuck. I am trying to compare it by element because I need to replace underscores in another array
        
        if wordToGuessLetter[i] == playersChosen[0] //wordToGuess.contains(playersChosenLetter)//wordToGuess[wordToGuess.index(wordToGuess.startIndex, offsetBy: i)] == playersChosenLetter]
        {
            
            //playerGuessString.replacingOccurrences(of: "_", with: "A")
            //print("In the comparison")
            //playerGuessS[i] = wordToGuessLetter[i]
            //playerGuessS.replaceSubrange(Range<1>, with: "a")
            playerGuess.replaceSubrange(i...i, with: [playersChosenLetter])
            incrementChance = 1
            //print(playerGuessS)
        }
        i = i + 1
        
    }
    
    //playerGuess = Array(playerGuessS)
    displayWordToGuess()
}

func chooseLetter()
{
    print("\nPlease choose a letter:")
    sleep(1)
    let randomLetter = Int.random(in: minNumber ... (letterArrayLength - 1))
    let playersChosenLetter = letterArray[randomLetter]
    
    compareLetters(playersChosenLetter:playersChosenLetter)
    print("\nThe letter you have chosen is: \(playersChosenLetter)")
    sleep(1)
    
}

func winOrLose()
{
    var i = 0
    winState = 1
    if incrementChance == 0
    {
        loopRun = loopRun + 1
        print("\nSorry you didn't find a letter. Please try again. You have \(loopRun) out of \(maximumChances) possible chances.")
        sleep(1)
    }
    
    while(i <= (playerGuess.count - 1))
    {
        if playerGuess[i] == "_"
        {
            //incrementChance = 6
            winState = 0
            //break
        }
        i = i + 1
        
    }
    
}


for _ in wordToGuess
{
    playerGuess.append("_")
    
}


while(loopRun <= 6 && winState == 0)
{
    displayWordToGuess()
    chooseLetter()
    winOrLose()

    sleep(1)
}

if(winState == 1)
{
    print("\nYou won the game. Congratulations!")
    
}
else
{
    print("\nYou lost. Please try again.")
}
