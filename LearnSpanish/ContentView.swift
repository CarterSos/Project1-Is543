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
            List(topics, id: \.self) { topic in
                TopicCell(topic: topic)
            }
            .listStyle(.plain) // can change style
            .navigationTitle("Learn Spanish!")
        }
    }
}

struct TopicCell: View {
    let topic: String

    var body: some View {
        HStack {
            NavigationLink {
                TopicLessonView(topic: topic)
            } label: {
                Text(topic)
            }

        }
    }
}

struct TopicLessonView: View {

    let topic: String

    var body: some View {

        VStack {
            Text("Lesson about topic \(topic) goes here.")

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
    "one":"uno"
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
