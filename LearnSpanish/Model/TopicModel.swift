//
//  TopicModel.swift
//  LearnSpanish
//
//  Created by IS 543 on 10/22/24.
//

import Foundation

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
    @Published var highScore: Int {
        didSet {
            UserDefaults.standard.set(highScore, forKey: Key.highScore(for: name))
        }
    }
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
        static func highScore(for topicName: String) -> String {
            return "highScore_\(topicName.replacingOccurrences(of: " ", with: "_"))"
        }
    }

    init(name: String, lessonText: String, vocabulary: [String: String], shuffledVocabulary: [String: String], currentFlashcardIndex: Int, quizQuestions: [QuizQuestion], quizScore: Int,  timeLeft: Int, bonusPoints: Int, quizProgress: Int) { // highScore: Int,
        self.name = name
        self.lessonText = lessonText
        self.vocabulary = vocabulary
        self.shuffledVocabulary = shuffledVocabulary
        self.currentFlashcardIndex = currentFlashcardIndex
        self.quizQuestions = quizQuestions
        self.quizScore = quizScore
        self.timeLeft = timeLeft
        self.bonusPoints = bonusPoints
        self.quizProgress = quizProgress
        
        // for the variables that get loaded from user defaults, I need to initialize them this way
        self.isLessonRead = UserDefaults.standard.bool(forKey: Key.isLessonRead(for: name))
        self.isFlashcardsCompleted = UserDefaults.standard.bool(forKey: Key.isFlashcardsCompleted(for: name))
        self.isQuizCompleted = UserDefaults.standard.bool(forKey: Key.isQuizCompleted(for: name))
        self.highScore = UserDefaults.standard.integer(forKey: Key.highScore(for: name))
    }
    
    // from stack overflow --> makes my class conform to hashable and equatable
    static func == (lhs: Topic, rhs: Topic) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}


struct QuizQuestion: Hashable {
    let question: String
    let options: [String]
    let correctAnswer: String
}

extension Topic { // I didn't end up using these but I kept the extension to remember what an extension is for the midterm
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

// This was how I first tested doing UserDefaults to have variable values persist but then I realized I need each topic to
// be connected with variables like it
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

// This is my original model
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
