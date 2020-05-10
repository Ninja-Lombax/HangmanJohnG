// Hangman final project for IMT 107
// Created by John Grasser

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
var hint = 0
var chooseWord = Int.random(in: minNumber ... (wordGuessArrayLength - 1))
var wordToGuess = wordGuessArray[chooseWord]
var wordToGuessLength = wordToGuess.count
var numberofChances = 1
let maximumChances = 8
var playerGuess:[String] = []

print("Welcome to my Hangman game. You have seven chances to guess the word and a one time use hint function. If you guess the word, you win. If you run out of chances you lose. Good luck!")
sleep(1)

func addUsedLetter(playersChosenLetter:String)
{
    var i = 0
    
    let usedLetters = Array(usedLetterArray)
    //let playersLetter = Array(playersChosenLetter)
    var findLetter = 0
    
    while i < (usedLetters.count)
    {
        
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
        print("\nThe letter you chose was \(playersChosenLetter). That letter has already been chosen. Please choose another letter. (You have \(loopRun) out of \(maximumChances) possible chances.)")
       
        incrementChance = 1
        sleep(1)
        
    }
}

func displayWordToGuess()
    
{
 
    print("\n\n\nThe word you are trying to guess is: ")
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
    
    
    addUsedLetter(playersChosenLetter: playersChosenLetter)
    
}

func wordHint()
{
    var blankSpot = 0
    //var playersChosenLetter:[String] = []
    
    let wordToGuessArray = Array(wordToGuess)
    var playersChosenLetter = wordToGuessArray[0]
    var randomLetter:Int
    if hint == 0
    {
            hint = 1
            
            
            print("You have activated the hint function.")

        
            while(blankSpot == 0)
            {
                randomLetter = Int.random(in: minNumber ... (wordToGuess.count - 1))
                playersChosenLetter = wordToGuessArray[randomLetter]
                //let playersChosen = String(playersChosenLetter)
                if(playerGuess[randomLetter] == "_")
                {

                        compareLetters(playersChosenLetter:String(playersChosenLetter))
                        blankSpot = 1
                        break
                        
                }
                
            }
            

            
        
    }
    else
    {
            print("You have already used the hint function. Please select another letter.")
        
    }

    
}

func chooseLetter()
{
    print("\nPlease choose a letter:")
    sleep(1)
    let randomLetter = Int.random(in: minNumber ... (letterArrayLength))
    //var randomLetter = 26
    if(randomLetter == letterArrayLength)
    {
        wordHint()
        
    }
    else{
    let playersChosenLetter = letterArray[randomLetter]
    
    compareLetters(playersChosenLetter:playersChosenLetter)
   
    sleep(1)
    }
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


while(loopRun <= 7 && winState == false)
{
    displayWordToGuess()
    //printUsedLetters()
    alreadyUsedLetters()
    chooseLetter()
    winOrLose()
    sleep(1)
}

if(winState == true)
{
    print("\n\nYou won the game. The word was \(wordToGuess). Congratulations!")
    
}
else
{
    print("\n\nYou lost. The word was \(wordToGuess). Please try again.")
}
