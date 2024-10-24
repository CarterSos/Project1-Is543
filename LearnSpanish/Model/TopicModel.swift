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
// class with initializer
// I had a rendering problem and spent 4 hours just trying to fix it
// the thing that finally fixed it was changing my struct to a class
// hopefully my model as a class is accceptable
class Topic: ObservableObject, Hashable {
    let name: String
    let lessonText: String
    @Published var isLessonRead: Bool {
        didSet {
            UserDefaults.standard.set(isLessonRead, forKey: Key.isLessonRead(for: name))
        }
    }
    let vocabulary: [String: String]
    var shuffledVocabulary: [String: String]
    @Published var isFlashcardsCompleted: Bool {
        didSet {
            UserDefaults.standard.set(isFlashcardsCompleted, forKey: Key.isFlashcardsCompleted(for: name))
        }
    }
    var currentFlashcardIndex: Int
    let quizQuestions: [QuizQuestion]
    var quizScore: Int
    var highScore: Int
    @Published var isQuizCompleted: Bool {
        didSet {
            UserDefaults.standard.set(isQuizCompleted, forKey: Key.isQuizCompleted(for: name))
        }
    }
    var timeLeft: Int
    var bonusPoints: Int
    var quizProgress: Int
    
    private struct Key {
        static func isQuizCompleted(for topicName: String) -> String {
            return "IsQuizCompleted_\(topicName.replacingOccurrences(of: " ", with: "_"))"
        }
        static func isFlashcardsCompleted(for topicName: String) -> String {
            return "IsFlashcardsCompleted_\(topicName.replacingOccurrences(of: " ", with: "_"))"
        }
        static func isLessonRead(for topicName: String) -> String {
            return "IsLessonRead_\(topicName.replacingOccurrences(of: " ", with: "_"))"
        }
    }

    // Custom initializer to set default values for isLessonRead, isFlashcardsCompleted, and isQuizCompleted
    init(name: String, lessonText: String, vocabulary: [String: String], shuffledVocabulary: [String: String], currentFlashcardIndex: Int, quizQuestions: [QuizQuestion], quizScore: Int, highScore: Int, timeLeft: Int, bonusPoints: Int, quizProgress: Int) {
        self.name = name
        self.lessonText = lessonText
        self.vocabulary = vocabulary
        self.shuffledVocabulary = shuffledVocabulary
        self.currentFlashcardIndex = currentFlashcardIndex
        self.quizQuestions = quizQuestions
        self.quizScore = quizScore
        self.highScore = highScore
        self.timeLeft = timeLeft
        self.bonusPoints = bonusPoints
        self.quizProgress = quizProgress
        
        // Initialize isLessonRead, isFlashcardsCompleted, and isQuizCompleted from UserDefaults
        self.isLessonRead = UserDefaults.standard.bool(forKey: Key.isLessonRead(for: name))
        self.isFlashcardsCompleted = UserDefaults.standard.bool(forKey: Key.isFlashcardsCompleted(for: name))
        self.isQuizCompleted = UserDefaults.standard.bool(forKey: Key.isQuizCompleted(for: name))
    }
    
    // Hashable and Equatable conformance
        static func == (lhs: Topic, rhs: Topic) -> Bool {
            return lhs.name == rhs.name
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
}
//
//struct Topic: Hashable {
//    let name: String
//    let lessonText: String
//    var isLessonRead: Bool {
//        didSet {
//            UserDefaults.standard.set(isLessonRead, forKey: Key.isLessonRead(for: name))
//        }
//    }
//    let vocabulary: [String: String]
//    var shuffledVocabulary: [String: String]
//    var isFlashcardsCompleted: Bool {
//        didSet {
//            UserDefaults.standard.set(isFlashcardsCompleted, forKey: Key.isFlashcardsCompleted(for: name))
//        }
//    }
//    var currentFlashcardIndex: Int // didn't end up using this
//    let quizQuestions: [QuizQuestion]
//    var quizScore: Int
//    var highScore: Int
//    var isQuizCompleted: Bool {
//        didSet {
//            UserDefaults.standard.set(isQuizCompleted, forKey: Key.isQuizCompleted(for: name))
//        }
//    }
//    var timeLeft: Int
//    var bonusPoints: Int
//    var quizProgress: Int
//    
//    struct Key {
//        static func isQuizCompleted(for topicName: String) -> String {
//            return "IsQuizCompleted_\(topicName.replacingOccurrences(of: " ", with: "_"))" // example: "IsQuizCompleted_Basic_Greetings_and_Farewells"
//        }
//        static func isFlashcardsCompleted(for topicName: String) -> String {
//            return "IsFlashcardsCompleted_\(topicName.replacingOccurrences(of: " ", with: "_"))"
//        }
//        static func isLessonRead(for topicName: String) -> String {
//            return "IsLessonRead_\(topicName.replacingOccurrences(of: " ", with: "_"))"
//        }
//    }
//    
//    init(name: String, lessonText: String, vocabulary: [String: String], shuffledVocabulary: [String: String], currentFlashcardIndex: Int, quizQuestions: [QuizQuestion], quizScore: Int, highScore: Int, timeLeft: Int, bonusPoints: Int, quizProgress: Int) {
//        self.name = name
//        self.lessonText = lessonText
//        self.vocabulary = vocabulary
//        self.shuffledVocabulary = shuffledVocabulary
//        self.currentFlashcardIndex = currentFlashcardIndex
//        self.quizQuestions = quizQuestions
//        self.quizScore = quizScore
//        self.highScore = highScore
//        self.timeLeft = timeLeft
//        self.bonusPoints = bonusPoints
//        self.quizProgress = quizProgress
//        
//        // Initialize UserDefaults values
//        self.isLessonRead = UserDefaults.standard.bool(forKey: Key.isLessonRead(for: name))
//        self.isFlashcardsCompleted = UserDefaults.standard.bool(forKey: Key.isFlashcardsCompleted(for: name))
//        self.isQuizCompleted = UserDefaults.standard.bool(forKey: Key.isQuizCompleted(for: name))
//    }
//
//}

struct QuizQuestion: Hashable {
    let question: String
    let options: [String]
    let correctAnswer: String
}

extension Topic {
    func toggleIsLessonRead() {
        isLessonRead.toggle()
    }
    
    func toggleIsFlashcardsCompleted() {
        isFlashcardsCompleted.toggle()
    }
    
    func toggleIsQuizCompleted() {
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

struct Preferences {
    var isQuizCompleted = UserDefaults.standard.bool(forKey: Key.isQuizCompleted){
        didSet {
            UserDefaults.standard.set(isQuizCompleted, forKey: Key.isQuizCompleted)
        }
    }

    var isFlashcardsCompleted = UserDefaults.standard.bool(forKey: Key.isFlashcardsCompleted){
        didSet {
            UserDefaults.standard.set(isFlashcardsCompleted, forKey: Key.isFlashcardsCompleted)
        }
    }

    var isLessonCompleted = UserDefaults.standard.bool(forKey: Key.isLessonCompleted){
        didSet {
            UserDefaults.standard.set(isLessonCompleted, forKey: Key.isLessonCompleted)
        }
    }

    private struct Key {
        static let isQuizCompleted = "IsQuizCompleted"//_\(Key.self)"
        static let isFlashcardsCompleted = "IsFlashCompleted"//_\(Key.self)"
        static let isLessonCompleted = "IsLessonCompleted"//_\(Key.self)"
    }
}

