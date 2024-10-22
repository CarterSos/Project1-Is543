//
//  ContentView.swift
//  LearnSpanish
//
//  Created by IS 543 on 10/15/24.
//

import SwiftUI

// organize each topic as a struct
// for each one store:
// title
// lesson text
// vocabulary list (array word:translation)
// quiz questions (custom type?)
// completed quiz AND completed flashcards
// high score (user preferences) (user defaults)
//          userDefaults.standard.bool(forKey: Key.soundEnabled from calculator)
// all of this in model^^^

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

let topics2: [Topic] = [
    Topic(
        name: "Basic Greetings and Farewells",
        lessonText: "In this lesson, you'll learn common greetings and farewells used in everyday conversations in Spanish.",
        isLessonRead: false,
        vocabulary: [
            "Hola": "Hello",
            "Adiós": "Goodbye",
            "Buenos días": "Good morning",
            "Buenas tardes": "Good afternoon",
            "Buenas noches": "Good night",
            "¿Cómo estás?": "How are you?",
            "Estoy bien": "I am fine",
            "Hasta luego": "See you later"
        ],
        shuffledVocabulary: [:],
        isFlashcardsCompleted: false,
        currentFlashcardIndex: 0,
        quizQuestions: [
            QuizQuestion(question: "What is the Spanish word for 'Goodbye'?", options: ["Adiós", "Hola", "Buenas noches"], correctAnswer: "Adiós"),
            QuizQuestion(question: "How do you say 'Good morning' in Spanish?", options: ["Buenos días", "Buenas tardes", "Adiós"], correctAnswer: "Buenos días"),
            QuizQuestion(question: "What is 'How are you?' in Spanish?", options: ["¿Cómo estás?", "Estoy bien", "Hola"], correctAnswer: "¿Cómo estás?"),
            QuizQuestion(question: "How do you say 'See you later' in Spanish?", options: ["Hasta luego", "Buenas noches", "Adiós"], correctAnswer: "Hasta luego"),
            QuizQuestion(question: "What is the meaning of 'Hola'?", options: ["Goodbye", "Hello", "Good morning"], correctAnswer: "Hello")
        ],
        quizScore: 0,
        highScore: 0,
        isQuizCompleted: false,
        timeLeft: 20,
        bonusPoints: 10,
        quizProgress: 0
    ),
    Topic(
        name: "Common Phrases",
        lessonText: "Learn essential phrases to navigate daily conversations in Spanish.",
        isLessonRead: false,
        vocabulary: [
            "Por favor": "Please",
            "Gracias": "Thank you",
            "De nada": "You're welcome",
            "Lo siento": "I'm sorry",
            "¿Cuánto cuesta?": "How much does it cost?",
            "¿Dónde está...?": "Where is...?",
            "Me gustaría": "I would like"
        ],
        shuffledVocabulary: [:],
        isFlashcardsCompleted: false,
        currentFlashcardIndex: 0,
        quizQuestions: [
            QuizQuestion(question: "How do you say 'Thank you' in Spanish?", options: ["Gracias", "Por favor", "De nada"], correctAnswer: "Gracias"),
            QuizQuestion(question: "What is 'I'm sorry' in Spanish?", options: ["Lo siento", "Gracias", "Me gustaría"], correctAnswer: "Lo siento"),
            QuizQuestion(question: "How do you say 'Please' in Spanish?", options: ["Por favor", "De nada", "Gracias"], correctAnswer: "Por favor"),
            QuizQuestion(question: "What is the meaning of 'De nada'?", options: ["You're welcome", "Thank you", "Please"], correctAnswer: "You're welcome"),
            QuizQuestion(question: "What is 'Where is...?' in Spanish?", options: ["¿Dónde está...?", "¿Cuánto cuesta?", "Me gustaría"], correctAnswer: "¿Dónde está...?")
        ],
        quizScore: 0,
        highScore: 0,
        isQuizCompleted: false,
        timeLeft: 20,
        bonusPoints: 10,
        quizProgress: 0
    ),
    Topic(
        name: "Numbers (1-10)",
        lessonText: "Learn how to count from 1 to 10 in Spanish.",
        isLessonRead: false,
        vocabulary: [
            "Uno": "1",
            "Dos": "2",
            "Tres": "3",
            "Cuatro": "4",
            "Cinco": "5",
            "Seis": "6",
            "Siete": "7",
            "Ocho": "8",
            "Nueve": "9",
            "Diez": "10"
        ],
        shuffledVocabulary: [:],
        isFlashcardsCompleted: false,
        currentFlashcardIndex: 0,
        quizQuestions: [
            QuizQuestion(question: "What is the Spanish word for '1'?", options: ["Uno", "Dos", "Tres"], correctAnswer: "Uno"),
            QuizQuestion(question: "How do you say '2' in Spanish?", options: ["Dos", "Tres", "Cuatro"], correctAnswer: "Dos"),
            QuizQuestion(question: "What is 'Five' in Spanish?", options: ["Cinco", "Seis", "Cuatro"], correctAnswer: "Cinco"),
            QuizQuestion(question: "How do you say '8' in Spanish?", options: ["Siete", "Ocho", "Nueve"], correctAnswer: "Ocho"),
            QuizQuestion(question: "What is 'Ten' in Spanish?", options: ["Diez", "Nueve", "Ocho"], correctAnswer: "Diez")
        ],
        quizScore: 0,
        highScore: 0,
        isQuizCompleted: false,
        timeLeft: 20,
        bonusPoints: 10,
        quizProgress: 0
    ),
    Topic(
        name: "Colors",
        lessonText: "Learn the names of different colors in Spanish.",
        isLessonRead: false,
        vocabulary: [
            "Rojo": "Red",
            "Azul": "Blue",
            "Verde": "Green",
            "Amarillo": "Yellow",
            "Negro": "Black",
            "Blanco": "White",
            "Naranja": "Orange",
            "Rosa": "Pink"
        ],
        shuffledVocabulary: [:],
        isFlashcardsCompleted: false,
        currentFlashcardIndex: 0,
        quizQuestions: [
            QuizQuestion(question: "What is the Spanish word for 'Red'?", options: ["Rojo", "Azul", "Verde"], correctAnswer: "Rojo"),
            QuizQuestion(question: "How do you say 'Blue' in Spanish?", options: ["Azul", "Verde", "Amarillo"], correctAnswer: "Azul"),
            QuizQuestion(question: "What is 'Yellow' in Spanish?", options: ["Amarillo", "Rojo", "Negro"], correctAnswer: "Amarillo"),
            QuizQuestion(question: "How do you say 'White' in Spanish?", options: ["Blanco", "Negro", "Azul"], correctAnswer: "Blanco"),
            QuizQuestion(question: "What is 'Pink' in Spanish?", options: ["Rosa", "Naranja", "Verde"], correctAnswer: "Rosa")
        ],
        quizScore: 0,
        highScore: 0,
        isQuizCompleted: false,
        timeLeft: 20,
        bonusPoints: 10,
        quizProgress: 0
    ),
    // Family Members
    Topic(
        name: "Family Members",
        lessonText: "Learn how to talk about family members in Spanish.",
        isLessonRead: false,
        vocabulary: [
            "Madre": "Mother",
            "Padre": "Father",
            "Hermano": "Brother",
            "Hermana": "Sister",
            "Abuelo": "Grandfather",
            "Abuela": "Grandmother",
            "Tío": "Uncle",
            "Tía": "Aunt"
        ],
        shuffledVocabulary: [:],
        isFlashcardsCompleted: false,
        currentFlashcardIndex: 0,
        quizQuestions: [
            QuizQuestion(question: "What is the Spanish word for 'Mother'?", options: ["Madre", "Padre", "Hermana"], correctAnswer: "Madre"),
            QuizQuestion(question: "How do you say 'Grandfather' in Spanish?", options: ["Abuelo", "Padre", "Tío"], correctAnswer: "Abuelo"),
            QuizQuestion(question: "What is 'Sister' in Spanish?", options: ["Hermana", "Hermano", "Tía"], correctAnswer: "Hermana"),
            QuizQuestion(question: "How do you say 'Uncle' in Spanish?", options: ["Tío", "Tía", "Abuelo"], correctAnswer: "Tío"),
            QuizQuestion(question: "What is the Spanish word for 'Father'?", options: ["Padre", "Madre", "Hermano"], correctAnswer: "Padre")
        ],
        quizScore: 0,
        highScore: 0,
        isQuizCompleted: false,
        timeLeft: 20,
        bonusPoints: 10,
        quizProgress: 0
    ),

    // Food and Drink
    Topic(
        name: "Food and Drink",
        lessonText: "Learn the names of common foods and drinks in Spanish.",
        isLessonRead: false,
        vocabulary: [
            "Agua": "Water",
            "Comida": "Food",
            "Pan": "Bread",
            "Fruta": "Fruit",
            "Carne": "Meat",
            "Verdura": "Vegetable",
            "Café": "Coffee",
            "Té": "Tea"
        ],
        shuffledVocabulary: [:],
        isFlashcardsCompleted: false,
        currentFlashcardIndex: 0,
        quizQuestions: [
            QuizQuestion(question: "What is the Spanish word for 'Water'?", options: ["Agua", "Café", "Té"], correctAnswer: "Agua"),
            QuizQuestion(question: "How do you say 'Bread' in Spanish?", options: ["Pan", "Comida", "Fruta"], correctAnswer: "Pan"),
            QuizQuestion(question: "What is 'Coffee' in Spanish?", options: ["Café", "Té", "Agua"], correctAnswer: "Café"),
            QuizQuestion(question: "How do you say 'Vegetable' in Spanish?", options: ["Verdura", "Carne", "Fruta"], correctAnswer: "Verdura"),
            QuizQuestion(question: "What is the Spanish word for 'Meat'?", options: ["Carne", "Pan", "Verdura"], correctAnswer: "Carne")
        ],
        quizScore: 0,
        highScore: 0,
        isQuizCompleted: false,
        timeLeft: 20,
        bonusPoints: 10,
        quizProgress: 0
    ),

    // Common Adjectives
    Topic(
        name: "Common Adjectives",
        lessonText: "Learn how to describe things using common adjectives in Spanish.",
        isLessonRead: false,
        vocabulary: [
            "Grande": "Big",
            "Pequeño": "Small",
            "Bonito": "Beautiful",
            "Feo": "Ugly",
            "Feliz": "Happy",
            "Triste": "Sad",
            "Interesante": "Interesting",
            "Aburrido": "Boring"
        ],
        shuffledVocabulary: [:],
        isFlashcardsCompleted: false,
        currentFlashcardIndex: 0,
        quizQuestions: [
            QuizQuestion(question: "What is the Spanish word for 'Big'?", options: ["Grande", "Pequeño", "Bonito"], correctAnswer: "Grande"),
            QuizQuestion(question: "How do you say 'Sad' in Spanish?", options: ["Triste", "Feliz", "Feo"], correctAnswer: "Triste"),
            QuizQuestion(question: "What is 'Beautiful' in Spanish?", options: ["Bonito", "Feo", "Grande"], correctAnswer: "Bonito"),
            QuizQuestion(question: "How do you say 'Happy' in Spanish?", options: ["Feliz", "Interesante", "Aburrido"], correctAnswer: "Feliz"),
            QuizQuestion(question: "What is the Spanish word for 'Interesting'?", options: ["Interesante", "Aburrido", "Bonito"], correctAnswer: "Interesante")
        ],
        quizScore: 0,
        highScore: 0,
        isQuizCompleted: false,
        timeLeft: 20,
        bonusPoints: 10,
        quizProgress: 0
    ),

    // Days of the Week
    Topic(
        name: "Days of the Week",
        lessonText: "Learn how to say the days of the week in Spanish.",
        isLessonRead: false,
        vocabulary: [
            "Lunes": "Monday",
            "Martes": "Tuesday",
            "Miércoles": "Wednesday",
            "Jueves": "Thursday",
            "Viernes": "Friday",
            "Sábado": "Saturday",
            "Domingo": "Sunday"
        ],
        shuffledVocabulary: [:],
        isFlashcardsCompleted: false,
        currentFlashcardIndex: 0,
        quizQuestions: [
            QuizQuestion(question: "What is the Spanish word for 'Wednesday'?", options: ["Miércoles", "Martes", "Viernes"], correctAnswer: "Miércoles"),
            QuizQuestion(question: "How do you say 'Saturday' in Spanish?", options: ["Sábado", "Domingo", "Viernes"], correctAnswer: "Sábado"),
            QuizQuestion(question: "What is 'Monday' in Spanish?", options: ["Lunes", "Martes", "Miércoles"], correctAnswer: "Lunes"),
            QuizQuestion(question: "How do you say 'Sunday' in Spanish?", options: ["Domingo", "Jueves", "Viernes"], correctAnswer: "Domingo"),
            QuizQuestion(question: "What is the Spanish word for 'Friday'?", options: ["Viernes", "Martes", "Jueves"], correctAnswer: "Viernes")
        ],
        quizScore: 0,
        highScore: 0,
        isQuizCompleted: false,
        timeLeft: 20,
        bonusPoints: 10,
        quizProgress: 0
    ),

    // Weather Vocabulary
    Topic(
        name: "Weather Vocabulary",
        lessonText: "Learn how to describe the weather in Spanish.",
        isLessonRead: false,
        vocabulary: [
            "Hace sol": "It's sunny",
            "Hace frío": "It's cold",
            "Está nublado": "It's cloudy",
            "Llueve": "It's raining",
            "Nieva": "It's snowing",
            "Hace calor": "It's hot"
        ],
        shuffledVocabulary: [:],
        isFlashcardsCompleted: false,
        currentFlashcardIndex: 0,
        quizQuestions: [
            QuizQuestion(question: "What is the Spanish word for 'It's sunny'?", options: ["Hace sol", "Hace frío", "Está nublado"], correctAnswer: "Hace sol"),
            QuizQuestion(question: "How do you say 'It's raining' in Spanish?", options: ["Llueve", "Nieva", "Hace calor"], correctAnswer: "Llueve"),
            QuizQuestion(question: "What is 'It's cold' in Spanish?", options: ["Hace frío", "Hace sol", "Hace calor"], correctAnswer: "Hace frío"),
            QuizQuestion(question: "How do you say 'It's cloudy' in Spanish?", options: ["Está nublado", "Llueve", "Nieva"], correctAnswer: "Está nublado"),
            QuizQuestion(question: "What is the Spanish word for 'It's hot'?", options: ["Hace calor", "Llueve", "Nieva"], correctAnswer: "Hace calor")
        ],
        quizScore: 0,
        highScore: 0,
        isQuizCompleted: false,
        timeLeft: 20,
        bonusPoints: 10,
        quizProgress: 0
    ),

    // Common Verbs
    Topic(
        name: "Common Verbs",
        lessonText: "Learn how to use common action words (verbs) in Spanish.",
        isLessonRead: false,
        vocabulary: [
            "Ser": "To be",
            "Estar": "To be",
            "Tener": "To have",
            "Hacer": "To do/make",
            "Ir": "To go",
            "Comer": "To eat",
            "Beber": "To drink",
            "Hablar": "To speak"
        ],
        shuffledVocabulary: [:],
        isFlashcardsCompleted: false,
        currentFlashcardIndex: 0,
        quizQuestions: [
            QuizQuestion(question: "What is the Spanish word for 'To eat'?", options: ["Comer", "Beber", "Hablar"], correctAnswer: "Comer"),
            QuizQuestion(question: "How do you say 'To drink' in Spanish?", options: ["Beber", "Comer", "Hablar"], correctAnswer: "Beber"),
            QuizQuestion(question: "What is 'To be' in Spanish (permanent state)?", options: ["Ser", "Estar", "Tener"], correctAnswer: "Ser"),
            QuizQuestion(question: "How do you say 'To go' in Spanish?", options: ["Ir", "Hacer", "Hablar"], correctAnswer: "Ir"),
            QuizQuestion(question: "What is the Spanish word for 'To have'?", options: ["Tener", "Ser", "Hacer"], correctAnswer: "Tener")
        ],
        quizScore: 0,
        highScore: 0,
        isQuizCompleted: false,
        timeLeft: 20,
        bonusPoints: 10,
        quizProgress: 0
    )
]

let topics = [
    "Basic Greetings and Farewells",
    "Common Phrases",
    "Numbers (1-10)",
    "Colors",
    "Family Members",
    "Food and Drink",
    "Common Adjectives",
    "Days of the Week",
    "Weather Vocabulary",
    "Common Verbs"
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(topics2, id: \.self) { topic in
                TopicCell(topic: topic)
            }
            .listStyle(.plain) // can change style
            .navigationTitle("Learn Spanish!")
        }
    }
}

struct TopicCell: View {
    let topic: Topic

    var body: some View {
        HStack {
            NavigationLink {
                TopicLessonView(topic: topic)
            } label: {
                Text(topic.name)
            }

        }
    }
}

struct TopicLessonView: View {

    let topic: Topic

    var body: some View {

        VStack {
            Text("\(topic.lessonText)")

            NavigationLink {
                QuizScreen()
            } label: {
                Text("Take the Quiz")
            }
            NavigationLink {
                FlashcardScreen()
            } label: {
                Text("Practice Flashcards")
            }
        }

    }
}

struct QuizScreen: View {
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Question N goes here")
                }
                Section {
                    Text("a. Answer 1")
                    Text("b. Answer 2")
                    Text("c. Answer 3")
                    Text("d. Answer 4")
                }
            }

        }
    }
}

let vocabulary = [
    "Hello":"Adios",
    "english":"spanish",
    "one":"uno",
    "test":"please"
]

struct FlashcardScreen: View {
    @State private var selectedTab = "" // ID is int and identifier is string
    
    // see website and inclass video
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(vocabulary.keys.shuffled(), id: \.self) { key in
                VStack {
                    Text("\(key)")
                        .font(.system(size: 60.0))
                        .padding()
                    Text("\(selectedTab)")
                        .font(.subheadline)
                }
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                .padding()
                
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    ContentView()
}
