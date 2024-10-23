//
//  ContentView.swift
//  LearnSpanish
//
//  Created by IS 543 on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TopicViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.topics, id: \.self) { topic in
                TopicCell(topic: topic, viewModel: viewModel)
            }
            .listStyle(.plain) // can change style
            .navigationTitle("Learn Spanish!")
        }
    }
}

struct TopicCell: View {
    let topic: Topic
    @ObservedObject var viewModel: TopicViewModel

    var body: some View {
        HStack {
            NavigationLink {
                TopicLessonView(topic: topic, viewModel: viewModel)
            } label: {
                Text(topic.name)
            }

        }
    }
}

struct TopicLessonView: View {

    @State var topic: Topic // needs to mutable so i can change the properties of this topic instance (like completion status for quiz, flashcards, and lesson
    @ObservedObject var viewModel: TopicViewModel

    var body: some View {

        VStack {
            HStack {
                NavigationLink {
                    QuizScreen(topic: topic, viewModel: viewModel)
                } label: {
                    Text("Take the Quiz")
                }
                .padding()
                Button(action:{
                    //viewModel.preferences.isQuizCompleted
                    
                    topic.toggleIsQuizCompleted()
                }) {
                    Text(topic.isQuizCompleted ? "Mark Quiz Incomplete" : "Mark Quiz Complete")
                }
                .padding()
            }
            .padding()
            HStack {
                NavigationLink {
                    FlashcardScreen(topic: topic, viewModel: viewModel)
                } label: {
                    Text("Practice Flashcards")
                }
                .padding()
                Button(action:{
                    topic.toggleIsFlashcardsCompleted()
                }) {
                    Text(topic.isFlashcardsCompleted ? "Mark Flashcards Incomplete" : "Mark Flashcards Complete")
                }
                .padding()
            }
            .padding()
            Button(action:{
                topic.toggleIsLessonRead()
            }) {
                Text(topic.isLessonRead ? "Mark Lesson Unread" : "Mark Lesson Read")
            }
            .padding()
            Text("Lesson for Topic: \(topic.name)")
                .font(.headline)
            Text("\(topic.lessonText)")
                .padding()
        }

    }
}
//            Form {
//                Section {
//                    Text("Question N goes here")
//                }
//                Section {
//                    Text("a. Answer 1")
//                    Text("b. Answer 2")
//                    Text("c. Answer 3")
//                    Text("d. Answer 4")
//                }
//            }
struct QuizScreen: View {
    let topic: Topic
    @ObservedObject var viewModel: TopicViewModel
    
    @State private var selectedAnswer: String? = nil
    
    var body: some View {
        VStack {
            ForEach(topic.quizQuestions, id: \.self) { question in
                VStack {
                    Text("\(question.question)")
                    if selectedAnswer == question.correctAnswer {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    }
                }
                ForEach(question.options, id: \.self) { option in
                    Button(action: {
                        selectedAnswer = option
                    }) {
                        HStack {
                            Text(option)
                            Spacer()
                            
                            
                        }
                    }
//                    Text(option.wrappedValue)
                }

            }
        }
    }
}


struct FlashcardScreen: View {
    let topic: Topic
    @ObservedObject var viewModel: TopicViewModel
    
    @State private var selectedTab = "" // ID is int and identifier is string
    @State private var shuffledVocabulary: [(key: String, value: String)] = []
    // see website and inclass video
    @State private var rotation: Double = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(shuffledVocabulary, id: \.key) { entry in // vocabulary.keys.shuffled()
                VStack {
                    Text(
                        (viewModel.isShowingTranslation ? entry.key : entry.value)
                    )
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                }
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                .padding()
                .rotation3DEffect(Angle(degrees: rotation),
                                  axis: (0, 1, 0)
                )
//                .modifier(Cardify(isFaceUp: rotation.truncatingRemainder(dividingBy: 90) == 0))
                .modifier(Cardify(isFaceUp: rotation <= 90))
//                .modifier(Cardify(isFaceUp: rotation <= 90))
                .onTapGesture {
                    withAnimation {
//
//                        rotation += 180
                        if rotation == 180 { // prevents my words from facing backwards
                            rotation = 0
                        } else {
                            rotation += 180
                        }
                        viewModel.flipFlashcard()
                        
                    }
                }
            }
            
        }
        .onAppear {
            shuffledVocabulary = topic.vocabulary.shuffled().map { ($0.key, $0.value) }
            selectedTab = shuffledVocabulary.first?.key ?? ""
        }
        .onChange(of: selectedTab) {
            viewModel.tabChanged() // Call the tabChanged function
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct Cardify: Animatable, ViewModifier {
    var isFaceUp: Bool {
        rotation < 90
    }

    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }

    var rotation: Double

    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180 //220 // 180
    }

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                if isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius(for: geometry.size)).fill(.white)
                    //RoundedRectangle(cornerRadius: cornerRadius(for: geometry.size)).stroke()
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius(for: geometry.size)).fill(.white)
                }

                content.opacity(isFaceUp ? 1 : 1) // this was used to keep one side blank but I just want to flip it
            }
            .rotation3DEffect(Angle(degrees: rotation), axis: (0, 1, 0)) // 0,1,0
        }
    }

    // MARK: - Drawing constants

    private func cornerRadius(for size: CGSize) -> Double {
        min(size.width, size.height) * 0.08
    }
}

#Preview {
    ContentView()
}
