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
    let vocabulary: [String: String]
    var shuffledVocabulary: [String: String]
    var isFlashcardsCompleted: Bool
    var currentFlashcardIndex: Int
    let quizQuestions: [QuizQuestion]
    var quizScore: Int
    var highScore: Int
    var isQuizCompleted: Bool
    var timeLeft: Int
    var bonusPoints: Int
    var quizProgress: Int
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

struct Preferences {
    var soundIsEnabled = UserDefaults.standard.bool(forKey: Key.soundEnabled) {
        didSet {
            UserDefaults.standard.set(soundIsEnabled, forKey: Key.soundEnabled)
        }
    }

    private struct Key {
        static let soundEnabled = "EnableSound"
    }
}
