import UIKit

var str = "Hello, playground"

var letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
var usedLetterArray:[String] = []
//var letterArray:Character = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
var wordGuessArray = ["STEAK","CHICKEN","PIZZA","HAMBURGER","SPAGHETTI","APPLE","BANANA","TACOS","SHRIMP","LASAGNA","PEAR","CAKE","PANCAKES","WINGS","FRIES","SALAD","FISH","COOKIES","CHILI","PEAS","RICE","CARROTS","CELERY","POPCORN","CORN","MOSTACCIOLI","SUSHI","RAMEN","SPINACH","LETTUCE","CHEESE","CHIPS","CHERRIES","EGGPLANT","PIES","BREADS","BISCUIT","SOUP"]

var letterArrayLength = letterArray.count
var wordGuessArrayLength = wordGuessArray.count
var minNumber = 0
var loopRun = 0
var incrementChance = 0, winState = false

var chooseWord = Int.random(in: minNumber ... (wordGuessArrayLength - 1))
var wordToGuess = wordGuessArray[chooseWord]
var wordToGuessLength = wordToGuess.count
var numberofChances = 0
let maximumChances = 7
var playerGuess:[String] = []

func addUsedLetter(playersChosenLetter:String)
{
    var i = 0
    
    let usedLetters = Array(usedLetterArray)
    //let playersLetter = Array(playersChosenLetter)
    var findLetter = 0
    
    while i < (usedLetters.count)
    {
        //if
        if usedLetters[i] == playersChosenLetter
        {
            
            //usedLetterArray.append(playersChosenLetter)
            findLetter = 1
            break
        }
        

        i = i + 1
    }
    
    if findLetter == 0
    {
         print("\nThe letter you have chosen is: \(playersChosenLetter)")
        usedLetterArray.append(playersChosenLetter)
        
    }
    else
    {
        print("\nThe letter you chose was \(playersChosenLetter). That letter has already been chosen. Please choose another letter.")
        loopRun = loopRun - 1
        sleep(1)
        
    }
}

func displayWordToGuess()
    
{
 
    print("\nThe word you are trying to guess is: ")
    let playerGuessString = playerGuess.joined()

    print(playerGuessString)
    sleep(1)
}

func compareLetters(playersChosenLetter:String)
{
    var i = 0
    let wordToGuessLetter = Array(wordToGuess)

    let playersChosen = Array(playersChosenLetter)
    incrementChance = 0

    while(i <= (wordToGuess.count - 1))
    {
        
        
        
        if wordToGuessLetter[i] == playersChosen[0]
        {
            

            playerGuess.replaceSubrange(i...i, with: [playersChosenLetter])
            incrementChance = 1
            
        }
        i = i + 1
        
    }
    
    //playerGuess = Array(playerGuessS)
    addUsedLetter(playersChosenLetter: playersChosenLetter)
    //displayWordToGuess()
}

func chooseLetter()
{
    print("\nPlease choose a letter:")
    sleep(1)
    let randomLetter = Int.random(in: minNumber ... (letterArrayLength - 1))
    let playersChosenLetter = letterArray[randomLetter]
    
    compareLetters(playersChosenLetter:playersChosenLetter)
   
    sleep(1)
    
}

func winOrLose()
{
    var i = 0
    winState = true
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
            
            winState = false
           
        }
        i = i + 1
        
    }
    
}

func alreadyUsedLetters()
{
    
    print("\nThe letters you have already used are:\n \(usedLetterArray)")
    
}


for _ in wordToGuess
{
    playerGuess.append("_")
    
}


while(loopRun <= 6 && winState == false)
{
    displayWordToGuess()
    chooseLetter()
    winOrLose()
    alreadyUsedLetters()
    sleep(1)
}

if(winState == true)
{
    print("\nYou won the game. The word was \(wordToGuess). Congratulations!")
    
}
else
{
    print("\nYou lost. The word was \(wordToGuess). Please try again.")
}
