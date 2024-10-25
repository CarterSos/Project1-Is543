# Project1-Is543

I really enjoyed this project! I went through all the required tasks and I believe I achieved them all.

I would say I deserve an A (95% ish) on this project because I completed all the important tasks. Read below for specifically what I did, but the only thing I didn't get exactly right is that you cannot see the short lesson text in landscape mode (although the app functionality works).

The other potential thing that may mark me down is that my Model started as a struct but I changed it to a class because I had some rendering problems. I spent 4 hours alone just trying to make it work with a struct but for some reason, I could only get it to work as a class. I know in class we traditionally created our Models as structs, so I commented out what my struct used to look like in the model file below it.

I would say I went above and beyond in making the quiz fun. I included a little easter egg because the screen is different and plays special sound effects when the user achieves a new high score compared to just completing a quiz. The quiz sound effects are from different games and I learned how to do a delay to play multiple sounds in sequence after one trigger.

Thanks for the help getting this app started!

## Required Tasks

1. I completed the language learning app
2. I used the Spanish language assets given and had chatGPT generate more assets like questions and short lessons.
3. Lesson text is easily accessible in each lesson and can be marked as complete. (Can scroll to fit the lesson text and vocab words on each lesson Home screen)
4. Flashcards: Users can flip them to see translations(animation), Can swipe between cards, cards are shuffled upon opening the flashcard activity)
5. Quiz: Quiz questions are all multiple choice. I implemented the correct point calculations based on the timer. I added a progress bar showing their bonus time animation at the top of the quiz question screen. When a question is answered correctly, an alert pops up and it plays the "YES!" sound effect. When answered incorrectly, an alert displays the actual correct answer and it plays two sound effects ("bonk" and "starKO"). Users then choose "Next Question" to proceed to the next one. The running score is displayed at the top. When all questions are answered correctly the quiz is automatically marked complete.
(I play some fun sounds when the quiz is completed, but if a new high score is achieved, I included an easter egg of playiing some Mario victory sounds and other game sounds! The screen also has more emojis than the normal Quiz Complete screen.)
6. On the home screen, I used variables for each topic to track progress. I used Symbols Finder to implement symbols for Quiz, Flashcards, and Lesson. They are green if completed and red if incomplete.
7. Within each lesson, the user can mark quiz, flashcards, or lesson as incomplete. I displayed this in a similar way changing the color and symbol when toggled to complete.
8. THIS ONE TOOK A WHILE FOR ME but progress for each topic and high scores persist across each app. (I started by copying code from our calculator app using UserDefaults for sound but it was tricky for me because each topic needed variables in UserDefaults. This was very satisfying when I finally got it working)
9. My app was designed for portrait and landscape mode. The app runs perfectly in portrait. Everything works in landscape except you cannot see the lesson text when in landscape (but you can do flashcards, quiz, and all toggles)
10. I had chatGPT create a fun app icon for my app called "Word Buddy." This logo is implemnted in the Home Screen and follows traditional sizing rules (1024x1024)
11. I did my best to follow Swift/SwiftUI principles and best practices. I pulled concepts from Calculator (lazyVgrid, Userdefaults), concentration(animations and timers), and in-class principles like private variables, observable objects, navigation links, etc.
