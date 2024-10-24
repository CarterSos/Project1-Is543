//
//  ContentView.swift
//  LearnSpanish
//
//  Created by IS 543 on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TopicViewModel()
    
    // display checks for lesson, quiz, and flashcards to show progress on home screen
    
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
                if let topicIndex = viewModel.topics.firstIndex(of: topic) {
                    TopicLessonView(topicIndex: topicIndex, topic: $viewModel.topics[topicIndex], viewModel: viewModel) // topicIndex: topicIndex
                }
//                TopicLessonView(topic: topic, viewModel: viewModel)
            } label: {
                Text(topic.name)
            }

        }
    }
}

struct TopicLessonView: View {
    // TO DO:
    // also display all flashcards below lesson
    // does it scroll?
    // display quiz high score on this screen?
    
    
    let topicIndex: Int //start of new changes
    @Binding var topic: Topic // needs to mutable so i can change the properties of this topic instance (like completion status for quiz, flashcards, and lesson
    @ObservedObject var viewModel: TopicViewModel
//    @State private var isQuizCompleted: Bool
//    @Binding var topic: Topic
//    topic = viewModel.topics[topicIndex]
    var body: some View {
//        var topic = viewModel.topics[topicIndex]
        
//        _  = { isQuizCompleted = topic.isQuizCompleted}()
        
        VStack {
            HStack {
                NavigationLink {
                    QuizScreen(topicIndex: topicIndex, topic: topic, viewModel: viewModel)
                } label: {
                    Text("Take the Quiz")
                }
                .foregroundColor(.white)  // Text color
                .padding()
                .background(Color.blue)    // Button background color
                .cornerRadius(10)
                .padding()
                Toggle(
                    "Quiz Completed",
                    isOn:
                        $topic.isQuizCompleted
//                        $viewModel.topics[topicIndex].isQuizCompleted
//                        Binding(
//                        get: { viewModel.topics[topicIndex].isQuizCompleted },
//                        set: { newValue in
//                            viewModel.topics[topicIndex].isQuizCompleted = newValue
//                        }
//                    )
                )
                
                .padding()
//                Toggle(
//                    "Quiz Completed",
//                    isOn: $viewModel.preferences.isQuizCompleted //$viewModel.topics[0].isQuizCompleted
//                )
                Button(action:{
//                    viewModel.topics[0].toggleIsQuizCompleted()
                    topic.toggleIsQuizCompleted()//viewModel.topics[topicIndex].toggleIsQuizCompleted()
//                    if viewModel.preferences.isQuizCompleted {
//                        viewModel.preferences.isQuizCompleted = false
//                    } else {
//                        viewModel.preferences.isQuizCompleted = true
//                    }
////                    topic.toggleIsQuizCompleted()
                }) {
                    Text(topic.isQuizCompleted ? "Mark Quiz Incomplete" : "Mark Quiz Complete")//viewModel.topics[topicIndex].isQuizCompleted //viewModel.topics[0].isQuizCompleted // topic.isQuizCompleted
                        .foregroundColor(.white)  // Text color
                        .padding()
                        .frame(maxWidth: .infinity)  // Makes button fill available space horizontally
                        .background(topic.isQuizCompleted ? Color.green : Color.red) // Conditional background color
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            HStack {
                // NavigationLink Button for Flashcards
                NavigationLink {
                    FlashcardScreen(topic: topic, viewModel: viewModel)
                } label: {
                    Text("Practice Flashcards")
                        .foregroundColor(.white)  // Text color
                        .padding()
                        .background(Color.blue)    // Button background color
                        .cornerRadius(10)          // Rounded corners
                }
                .padding()
                
                Toggle(
                    "Flashcards Completed",
                    isOn:
                        $viewModel.topics[topicIndex].isFlashcardsCompleted
                        // should be the same$topic.isFlashcardsCompleted
//                        $viewModel.topics[topicIndex].isQuizCompleted
//                        Binding(
//                        get: { viewModel.topics[topicIndex].isQuizCompleted },
//                        set: { newValue in
//                            viewModel.topics[topicIndex].isQuizCompleted = newValue
//                        }
//                    )
                )
                
                .padding()

                // Button to Mark Flashcards as Complete/Incomplete
                Button(action:{
                    viewModel.topics[topicIndex].toggleIsFlashcardsCompleted()
                    //topic.isFlashcardsCompleted.toggle()
//                    topic.toggleIsFlashcardsCompleted()
                }) {
                    Text(topic.isFlashcardsCompleted ? "Mark Flashcards Incomplete" : "Mark Flashcards Complete")
                        .foregroundColor(.white)  // Text color
                        .padding()
                        .frame(maxWidth: .infinity)  // Makes button fill available space horizontally
                        .background(topic.isFlashcardsCompleted ? Color.green : Color.red) // Conditional background color
                        .cornerRadius(10)          // Rounded corners
                }
                .padding()
            }
            .padding()

            Toggle(
                "Lesson Completed",
                isOn:
                    $topic.isLessonRead
//                        $viewModel.topics[topicIndex].isQuizCompleted
//                        Binding(
//                        get: { viewModel.topics[topicIndex].isQuizCompleted },
//                        set: { newValue in
//                            viewModel.topics[topicIndex].isQuizCompleted = newValue
//                        }
//                    )
            )
            Button(action:{
                //topic.toggleIsLessonRead()
                viewModel.topics[topicIndex].isLessonRead.toggle()
            }) {
                Text(topic.isLessonRead ? "Mark Lesson Unread" : "Mark Lesson Read")
            }
                .foregroundColor(.white)  // Text color
                .padding()
                .frame(maxWidth: .infinity)  // Makes button fill available space horizontally
                .background(topic.isLessonRead ? Color.green : Color.red) // Conditional background color
                .cornerRadius(10)
                .padding()
            Text("Lesson for Topic: \(topic.name)")
                .font(.headline)
            Text("\(topic.lessonText)")
                .padding()
        }
        
//        ForEach(Array(topic.vocabulary), id: \.key) { vocab in // viewModel.topics[topicIndex].
//            Text(vocab.key)
//                .font(.subheadline)
//                .padding()
//        }
        VocabularyGridView(vocabulary: topic.vocabulary)

    }
}


struct VocabularyGridView: View {
    let vocabulary: [String: String] // Assuming you have a vocabulary dictionary

    // Define grid items
    let columns = [
        GridItem(.adaptive(minimum: 100)) // Adjust the minimum size for the cards
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(Array(vocabulary), id: \.key) { vocab in
                VStack {
                    Text(vocab.key)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2)) // Card background color
                        .cornerRadius(10) // Rounded corners
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Optional shadow
                    // Optionally display the definition or additional info
                    Text(vocab.value)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                }
                .padding(.horizontal) // Padding around the card
            }
        }
        .padding() // Padding around the grid
    }
}


struct QuizScreen: View {
    // need to have Q's on all flashcards
    // score +10 for correct + bonus = (20 - elapsedTime) / 2 round up
    // animate to show bonus time (see concentration app like pie)
    // If correct: play sound and/or animation
    // If incorrect: play sound or animate showing it was wrong
    // User navigate to next question
    // display running score
    // if total > highscore then update highscore
    
    let topicIndex: Int
    let topic: Topic
    @ObservedObject var viewModel: TopicViewModel
    
    @State private var selectedAnswer: String? = nil
    
    @State private var showResult = false
    @State private var isCorrectAnswer = false
    
    
    var body: some View {
        
        VStack {
            if viewModel.currentQuizIndex < topic.quizQuestions.count { //viewModel.topics[topicIndex].quizQuestions.count
                VStack {
                    
                    
                    Text("Score: \(viewModel.currentScore)")
                        .font(.headline)
                        .padding()
                    // Time-based bonus indicator
                    ProgressView(value: viewModel.quizElapsedTime, total: 20)
                        .padding()
                    
                    Text(topic.quizQuestions[viewModel.currentQuizIndex].question)
                        .font(.title2)
                        .padding()
                        .onAppear { // when question appears start timer
                            viewModel.startQuizTimer()
                            viewModel.numQuestions = topic.quizQuestions.count
                            viewModel.currentTopicIndex = topicIndex
                        }
                    
                    ForEach(topic.quizQuestions[viewModel.currentQuizIndex].options, id: \.self) { option in
                        Button(action: {
                            viewModel.stopQuizTimer()
                            selectedAnswer = option
                            if selectedAnswer == topic.quizQuestions[viewModel.currentQuizIndex].correctAnswer { // if correct
                                //                        Image(systemName: "checkmark")
                                //                            .foregroundColor(.green)
                                isCorrectAnswer = true
                                viewModel.correctAnswer()
                                showResult = true
                            } else {
                                isCorrectAnswer = false
                                viewModel.incorrectAnswer()
                                showResult = true
                            }
                            //                    isCorrectAnswer = viewModel.checkQuizAnswer(option)
                            //                    showResult = true
                            
                        }) {
                            Text(option)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                    }
                    Spacer()
                    
                    
                } // end VStack
                .alert(isPresented: $showResult) {
                    Alert(
                        title: Text(isCorrectAnswer ? "Correct!" : "Incorrect"),
                        message: Text(isCorrectAnswer ? "Well done!" : "The correct answer is \(topic.quizQuestions[viewModel.currentQuizIndex].correctAnswer)"),
                        dismissButton: .default(Text("Next Question")) {
                            viewModel.nextQuizQuestion()
                            viewModel.startQuizTimer()
                        }
                    )
                }
                .navigationTitle("Quiz")
                
            } else {
                VStack {
                    Text("You have completed the quiz!")
                        .font(.largeTitle)
                        .padding()
                    Text("Your Score: \(viewModel.currentScore)")
                        .font(.title)
                        .padding()
                        .onAppear(){
                            viewModel.updateHighScore()
                        }
                    if viewModel.currentScore >= topic.highScore {
                        Text("Congrats! You got a new high score of \(viewModel.currentScore)!!")
                            .font(.headline)
                            .foregroundColor(.green)
                            .padding()
                            //.onAppear()
                        VStack {
                            Text("😎😎😎")
                                .font(.largeTitle)
                        }.rotation3DEffect(Angle(degrees: 1080),axis: (0, 0, 1))
                        
                    } else {
                        VStack {
                            Text("😎")
                                .font(.largeTitle)
                        }.rotation3DEffect(Angle(degrees: 360),axis: (0, 0, 1))
                    }

                    Button("Restart Quiz") {
                        viewModel.resetQuiz()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    // Update progress
                    //                Button(action: {
                    //                    if !viewModel.topic.isQuizCompleted {
                    //                        viewModel.topic.isQuizCompleted = true
                    //                        progressViewModel.updateQuizCompletion(
                    //                            for: viewModel.topic.id,
                    //                            score: viewModel.currentScore
                    //                        )
                    //                    }
                    //                }) {
                    //                    Text("Complete Quiz")
                    //                }
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
                                      axis: (1, 1, 0) // 0,1,0
                    )
                    //                .modifier(Cardify(isFaceUp: rotation.truncatingRemainder(dividingBy: 90) == 0))
                    .modifier(Cardify(isFaceUp: rotation >= 0)) // <= 90
                    //                .modifier(Cardify(isFaceUp: rotation <= 90))
                    .onTapGesture {
                        withAnimation {
                            //
                            rotation += 360
                            //                        if rotation == 180 { // prevents my words from facing backwards
                            //                            rotation = 0
                            //                        } else {
                            //                            rotation += 180
                            //                        }
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
    
    
    //            ForEach(topic.quizQuestions, id: \.self) { question in
    //                VStack {
    //                    Text("\(question.question)")
    //                    if selectedAnswer == question.correctAnswer {
    //                        Image(systemName: "checkmark")
    //                            .foregroundColor(.green)
    //                    }
    //                }
    //                .onAppear {
    //                    viewModel.startQuizTimer()
    //                }
    //                ForEach(question.options, id: \.self) { option in
    //                    Button(action: {
    //                        viewModel.stopQuizTimer()
    //                        selectedAnswer = option
    //
    //                    }) {
    //                        HStack {
    //                            Text(option)
    //                            Spacer()
    //
    //
    //                        }
    //                    }
    //                    Text(option.wrappedValue)
    //                }
    //
    //            }

