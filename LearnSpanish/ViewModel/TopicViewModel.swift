//
//  TopicViewModel.swift
//  LearnSpanish
//
//  Created by IS 543 on 10/22/24.
//

import Foundation
import Combine

class TopicViewModel: ObservableObject {
    // MARK: - Properties
//    @Published var topics: [Topic]
//
//    init(topic: Topic) {
//        self.topic = topic
//    }
    
    //var key = Key() // ??
    var preferences = Preferences()
    
    @Published var isShowingTranslation = false
    
    func flipFlashcard() {
        isShowingTranslation.toggle()
    }
    
    func tabChanged() {
        isShowingTranslation = false
    }
    
//    func checkFlashcards(topic: var Topic) {
//        topic.isFlashcardsCompleted.toggle()
//    }
//    func saveTopicState(topic: Topic) {
//        // This will be automatically handled by the didSet property observers in Topic
//        // So, if you modify the properties, they will be saved automatically.
//        
//        // Example: to save state after modifying properties, you can call:
//        if let index = topics.firstIndex(where: { $0.name == topic.name }) {
//            topics[index].isLessonRead = topic.isLessonRead
//            topics[index].isFlashcardsCompleted = topic.isFlashcardsCompleted
//            topics[index].isQuizCompleted = topic.isQuizCompleted
//        }
//    }
    
    @Published var topics: [Topic] = [
        Topic(
            name: "Basic Greetings and Farewells",
            lessonText: """
            In any language, learning how to greet others and say goodbye is one of the first steps toward effective communication. In Spanish, basic greetings such as \"Hola\" (Hello) and farewells like \"Adiós\" (Goodbye) are essential for starting and ending conversations politely. You will also come across greetings specific to different times of day, like \"Buenos días\" (Good morning) and \"Buenas tardes\" (Good afternoon). These phrases will help you connect with Spanish speakers in everyday situations.

            As you move through this lesson, you will learn common expressions like \"¿Cómo estás?\" (How are you?), which is used to ask someone about their well-being, and simple responses like \"Estoy bien\" (I am fine). Mastering these phrases will give you the confidence to greet others, show politeness, and express yourself in Spanish with ease.
            """,
//            isLessonRead: UserDefaults.standard.bool(forKey: Topic.Key.isLessonRead(for: "Basic Greetings and Farewells")),
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
//            isFlashcardsCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isFlashcardsCompleted(for: "Basic Greetings and Farewells")),
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
//            isQuizCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isQuizCompleted(for: "Basic Greetings and Farewells")),
            timeLeft: 20,
            bonusPoints: 10,
            quizProgress: 0
        ),
        Topic(
            name: "Common Phrases",
            lessonText: """
            Common phrases are the building blocks of daily conversations. In this lesson, you\'ll learn useful expressions that can help you navigate a variety of situations, from asking politely with \"Por favor\" (Please) to showing gratitude with \"Gracias\" (Thank you). These phrases are incredibly versatile, allowing you to express politeness, gratitude, and even ask for help.

            As you practice, pay special attention to questions such as \"¿Cuánto cuesta?\" (How much does it cost?) and \"¿Dónde está...?\" (Where is...?), which are vital for shopping or finding your way in a Spanish-speaking country. This lesson will give you the tools to communicate basic needs and responses, making interactions smoother.
            """,
//            isLessonRead: UserDefaults.standard.bool(forKey: Topic.Key.isLessonRead(for: "Common Phrases")),
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
//            isFlashcardsCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isFlashcardsCompleted(for: "Common Phrases")),
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
//            isQuizCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isQuizCompleted(for: "Common Phrases")),
            timeLeft: 20,
            bonusPoints: 10,
            quizProgress: 0
        ),
        Topic(
            name: "Numbers (1-10)",
            lessonText: """
            Numbers are everywhere in daily life, from telling time to making purchases. In this lesson, you’ll learn how to count from one to ten in Spanish, starting with \"Uno\" (1) and ending with \"Diez\" (10). These foundational numbers are essential for expressing quantities, handling transactions, and even discussing age or dates.

            As you go through the lesson, take note of how numbers are used in various contexts. Mastering these will help you build confidence as you expand into larger numbers and use them in more advanced conversations. Whether you’re ordering at a café or asking for directions, knowing how to express numbers is a key skill.
            """,
//            isLessonRead: UserDefaults.standard.bool(forKey: Topic.Key.isLessonRead(for: "Numbers (1-10)")),
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
//            isFlashcardsCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isFlashcardsCompleted(for: "Numbers (1-10)")),
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
//            isQuizCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isQuizCompleted(for: "Numbers (1-10)")),
            timeLeft: 20,
            bonusPoints: 10,
            quizProgress: 0
        ),
        Topic(
            name: "Colors",
            lessonText: """
            Colors play an important role in describing the world around us. In this lesson, you’ll explore basic colors in Spanish, such as \"Rojo\" (Red), \"Azul\" (Blue), and \"Verde\" (Green). These terms will help you describe objects, people, and even emotions as color is often associated with moods or characteristics.

            By the end of the lesson, you’ll be able to talk about your favorite color or describe everyday items in detail. From clothing and food to the natural world, color vocabulary will enrich your conversations and deepen your ability to express yourself visually and creatively.
            """,
//            isLessonRead: UserDefaults.standard.bool(forKey: Topic.Key.isLessonRead(for: "Colors")),
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
//            isFlashcardsCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isFlashcardsCompleted(for: "Colors")),
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
//            isQuizCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isQuizCompleted(for: "Colors")),
            timeLeft: 20,
            bonusPoints: 10,
            quizProgress: 0
        ),
        // Family Members
        Topic(
            name: "Family Members",
            lessonText: """
            Family is an important aspect of Spanish-speaking cultures, and knowing how to talk about family members is essential. This lesson introduces key terms such as \"Madre\" (Mother), \"Padre\" (Father), and \"Hermano\" (Brother), allowing you to describe your own family or ask others about theirs. In many Spanish-speaking countries, family relationships are a core part of social life.

            As you work through this lesson, you’ll become more comfortable discussing familial connections. Whether you’re introducing someone to your family or learning about someone else\'s, these terms will provide a foundation for deeper conversations.
            """,
//            isLessonRead: UserDefaults.standard.bool(forKey: Topic.Key.isLessonRead(for: "Family Members")),
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
//            isFlashcardsCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isFlashcardsCompleted(for: "Family Members")),
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
//            isQuizCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isQuizCompleted(for: "Family Members")),
            timeLeft: 20,
            bonusPoints: 10,
            quizProgress: 0
        ),

        // Food and Drink
        Topic(
            name: "Food and Drink",
            lessonText: """
            Food is a central part of culture, and knowing basic food and drink vocabulary will be incredibly useful when traveling or socializing. In this lesson, you will learn terms like \"Agua\" (Water), \"Comida\" (Food), and \"Pan\" (Bread), which are key to ordering meals, discussing preferences, or preparing for mealtimes.

            By the end of this lesson, you’ll be able to express your likes and dislikes, ask for specific items at a restaurant, and engage in conversations about meals. Food is a common topic, and this vocabulary will make your conversations much richer and more enjoyable.
            """,
//            isLessonRead: UserDefaults.standard.bool(forKey: Topic.Key.isLessonRead(for: "Food and Drink")),
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
//            isFlashcardsCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isFlashcardsCompleted(for: "Food and Drink")),
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
//            isQuizCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isQuizCompleted(for: "Food and Drink")),
            timeLeft: 20,
            bonusPoints: 10,
            quizProgress: 0
        ),

        // Common Adjectives
        Topic(
            name: "Common Adjectives",
            lessonText: """
            Adjectives help bring descriptions to life, whether you\'re talking about people, places, or things. In this lesson, you'll learn basic adjectives such as \"Grande\" (Big), \"Pequeño\" (Small), and \"Feliz\" (Happy), which will allow you to describe a variety of subjects more vividly.

            As you progress, you'll see how adjectives change based on what you're describing, and how they can be used to express emotions, opinions, and attributes. These words will give you more flexibility in conversations, helping you communicate your thoughts and feelings more accurately.
            """,
//            isLessonRead: UserDefaults.standard.bool(forKey: Topic.Key.isLessonRead(for: "Common Adjectives")),
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
//            isFlashcardsCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isFlashcardsCompleted(for: "Common Adjectives")),
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
//            isQuizCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isQuizCompleted(for: "Common Adjectives")),
            timeLeft: 20,
            bonusPoints: 10,
            quizProgress: 0
        ),

        // Days of the Week
        Topic(
            name: "Days of the Week",
            lessonText: """
            Being able to talk about time is crucial in any language. In this lesson, you will learn the days of the week, starting with \"Lunes\" (Monday) and ending with \"Domingo\" (Sunday). These terms are essential for making plans, scheduling appointments, or simply talking about daily routines.

            Understanding how to use the days of the week will help you in both casual and formal conversations, from discussing work schedules to planning vacations. By the end of this lesson, you'll be able to refer to days confidently and keep track of time more easily in Spanish.
            """,
//            isLessonRead: UserDefaults.standard.bool(forKey: Topic.Key.isLessonRead(for: "Days of the Week")),
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
//            isFlashcardsCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isFlashcardsCompleted(for: "Days of the Week")),
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
//            isQuizCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isQuizCompleted(for: "Days of the Week")),
            timeLeft: 20,
            bonusPoints: 10,
            quizProgress: 0
        ),

        // Weather Vocabulary
        Topic(
            name: "Weather Vocabulary",
            lessonText: """
            Weather is a common topic of conversation, no matter where you are. In this lesson, you will learn important weather terms such as \"Hace sol\" (It's sunny) and \"Hace frío\" (It's cold), which will help you discuss the weather with others, whether it’s a casual chat or something more practical like planning your day.

            By mastering these weather phrases, you'll be able to engage in small talk and understand weather reports. This knowledge will also help when traveling, as you'll be able to ask locals about the forecast or share your experiences of the climate.
            """,
//            isLessonRead: UserDefaults.standard.bool(forKey: Topic.Key.isLessonRead(for: "Weather Vocabulary")),
            vocabulary: [
                "Hace sol": "It's sunny",
                "Hace frío": "It's cold",
                "Está nublado": "It's cloudy",
                "Llueve": "It's raining",
                "Nieva": "It's snowing",
                "Hace calor": "It's hot"
            ],
            shuffledVocabulary: [:],
//            isFlashcardsCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isFlashcardsCompleted(for: "Weather Vocabulary")),
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
//            isQuizCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isQuizCompleted(for: "Weather Vocabulary")),
            timeLeft: 20,
            bonusPoints: 10,
            quizProgress: 0
        ),

        // Common Verbs
        Topic(
            name: "Common Verbs",
            lessonText: """
            Verbs are the action words of any language, and they are essential for forming sentences and expressing ideas. In this lesson, you will explore common Spanish verbs such as \"Ser\" (To be), \"Tener\" (To have), and \"Hacer\" (To do/make). These verbs are fundamental and will be used in nearly every conversation you have in Spanish.

            Understanding these verbs and how they function in sentences will give you the foundation for more complex language skills. As you practice, focus on conjugating the verbs and using them in different contexts to describe actions, states, and possessions.
            """,
//            isLessonRead: UserDefaults.standard.bool(forKey: Topic.Key.isLessonRead(for: "Common Verbs")),
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
//            isFlashcardsCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isFlashcardsCompleted(for: "Common Verbs")),
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
//            isQuizCompleted: UserDefaults.standard.bool(forKey: Topic.Key.isQuizCompleted(for: "Common Verbs")),
            timeLeft: 20,
            bonusPoints: 10,
            quizProgress: 0
        )
    ]
    
    
}
