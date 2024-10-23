//
//  TopicModel.swift
//  LearnSpanish
//
//  Created by IS 543 on 10/22/24.
//

// high score (user preferences) (user defaults)
//          userDefaults.standard.bool(forKey: Key.soundEnabled from calculator)
// all of this in model^^^


import Foundation

struct Topic: Hashable {
    let name: String
    let lessonText: String
    var isLessonRead: Bool
//    {
//        didSet {
//            UserDefaults.standard.set(isLessonRead, forKey: Key.isLessonCompleted)
//        }
//    }
    let vocabulary: [String: String]
    var shuffledVocabulary: [String: String]
    var isFlashcardsCompleted: Bool
//    {
//        didSet {
//            UserDefaults.standard.set(isFlashcardsCompleted, forKey: Key.isFlashcardsCompleted)
//        }
//    }
    var currentFlashcardIndex: Int // didn't end up using this
    let quizQuestions: [QuizQuestion]
    var quizScore: Int
    var highScore: Int
    var isQuizCompleted: Bool
//    {
//        didSet {
//            UserDefaults.standard.set(isQuizCompleted, forKey: Key.isQuizCompleted)
//        }
//    }
    var timeLeft: Int
    var bonusPoints: Int
    var quizProgress: Int
    
//    private struct Key {
//        static let isQuizCompleted = "IsQuizCompleted_\(Key.self)"
//        static let isFlashcardsCompleted = "IsFlashCompleted_\(Key.self)"
//        static let isLessonCompleted = "IsLessonCompleted_\(Key.self)"
//    }
    
    // do i need to initialize every property?
//    init(name: String, lessonText: String, isLessonRead: Bool = false, isFlashcardsCompleted: Bool = false, isQuizCompleted: Bool = false, vocabulary: [String: String] = [:]) {
//        self.name = name
//        self.lessonText = lessonText
//        self.isLessonRead = UserDefaults.standard.bool(forKey: Key.isLessonCompleted) // Load from UserDefaults
//        self.isFlashcardsCompleted = UserDefaults.standard.bool(forKey: Key.isFlashcardsCompleted) // Load from UserDefaults
//        self.isQuizCompleted = UserDefaults.standard.bool(forKey: Key.isQuizCompleted) // Load from UserDefaults
//        self.vocabulary = vocabulary
//        self.shuffledVocabulary = vocabulary // Initialize shuffled vocabulary if needed
//        self.currentFlashcardIndex = 0 // or any default value
//        self.quizQuestions = [] // Initialize as needed
//        self.quizScore = 0 // Initialize as needed
//        self.highScore = 0 // Initialize as needed
//        self.timeLeft = 0 // Initialize as needed
//        self.bonusPoints = 0 // Initialize as needed
//        self.quizProgress = 0 // Initialize as needed
//    }
}

struct QuizQuestion: Hashable {
    let question: String
    let options: [String]
    let correctAnswer: String
}

extension Topic {
    mutating func toggleIsLessonRead() {
        isLessonRead.toggle()
    }
    
    mutating func toggleIsFlashcardsCompleted() {
        isFlashcardsCompleted.toggle()
    }
    
    mutating func toggleIsQuizCompleted() {
        isQuizCompleted.toggle()
    }
}

//struct Preferences {
////    var soundIsEnabled = UserDefaults.standard.bool(forKey: Key.soundEnabled) {
////        didSet {
////            UserDefaults.standard.set(soundIsEnabled, forKey: Key.soundEnabled)
////        }
////    }
//
////    private struct Key {
////        static let soundEnabled = "EnableSound"
////    }
//    
//    var isQuizCompleted = UserDefaults.standard.bool(forKey: Key.isQuizCompleted){
//        didSet {
//            UserDefaults.standard.set(isQuizCompleted, forKey: Key.isQuizCompleted)
//        }
//    }
//    
//    var isFlashcardsCompleted = UserDefaults.standard.bool(forKey: Key.isFlashcardsCompleted){
//        didSet {
//            UserDefaults.standard.set(isFlashcardsCompleted, forKey: Key.isFlashcardsCompleted)
//        }
//    }
//    
//    var isLessonCompleted = UserDefaults.standard.bool(forKey: Key.isLessonCompleted){
//        didSet {
//            UserDefaults.standard.set(isLessonCompleted, forKey: Key.isLessonCompleted)
//        }
//    }
//    
//    
//}
