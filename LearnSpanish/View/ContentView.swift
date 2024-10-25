//
//  ContentView.swift
//  LearnSpanish
//
//  Created by IS 543 on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TopicViewModel()
    
    // display check marks for lesson, quiz, and flashcards to show progress on home screen
    
    var body: some View {
        NavigationStack {
            Text("Quiz, Flashcards, Lesson")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.caption)
                .padding()
            List(viewModel.topics, id: \.self) { topic in
                TopicCell(topic: topic, viewModel: viewModel)
            }
            .listStyle(.plain)
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
                    TopicLessonView(topicIndex: topicIndex, topic: $viewModel.topics[topicIndex], viewModel: viewModel)
                }
            } label: {
                Text(topic.name)
//                    .foregroundColor(.blue)
            }
            HStack {
                HStack {
                    // From symbols finder on mac
                    Image(systemName: topic.isQuizCompleted ? "checkmark.circle.fill" : "xmark.circle")//book.square.stack book
//                        .resizable()
//                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(topic.isQuizCompleted ? .green : .red)

//                    Text("Q")
//                        .font(.caption)
//                        .foregroundColor(.primary)
                }

                HStack {
                    // Flashcards Completion Indicator
                    Image(systemName: topic.isFlashcardsCompleted ? "lightbulb.fill" : "lightbulb") //book.square.stack
//                        .resizable()
//                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(topic.isFlashcardsCompleted ? .green : .red)

//                    Text("F")
//                        .font(.caption)
//                        .foregroundColor(.primary)
                }

                HStack {
                    // Lesson Read Completion Indicator
                    Image(systemName: topic.isLessonRead ? "book.fill" : "book")
//                        .resizable()
//                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(topic.isLessonRead ? .green : .red)

//                    Text("L")
//                        .font(.caption)
//                        .foregroundColor(.primary)
                }
            }
            .padding(.trailing, 8) // Add some spacing between the indicators and the topic name

            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
//        .shadow(radius: 2)
    }
}


struct TopicLessonView: View {
    
    let topicIndex: Int
    @Binding var topic: Topic // needs to mutable so i can change the properties of this topic instance (like completion status for quiz, flashcards, and lesson
    @ObservedObject var viewModel: TopicViewModel

    var body: some View {

        VStack {
            // This is the HStack for the check boxes on top
            HStack {
                // Quiz Completion
                VStack {
                    Image(systemName: topic.isQuizCompleted ? "checkmark.circle.fill" : "xmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(topic.isQuizCompleted ? .green : .red)
                    Text("Quiz")
                        .font(.caption)
                    Text("Complete")
                        .font(.caption)
                    Toggle(isOn: $topic.isQuizCompleted) {
                        EmptyView()
                    }
                    .frame(width: 50)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(topic.isQuizCompleted ? Color.green : Color.red, lineWidth: 2)
                )
                .frame(maxWidth: .infinity, alignment: .center)
                
                
                // Flashcards Completion
                VStack {
                    Image(systemName: topic.isFlashcardsCompleted ? "lightbulb.fill" : "lightbulb")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(topic.isFlashcardsCompleted ? .green : .red)
                    Text("Flashcards")
                        .font(.caption)
                    Text("Complete")
                        .font(.caption)
                    Toggle(isOn: $topic.isFlashcardsCompleted) {
                        EmptyView() // Use an empty view to hide the default label
                    }
                    .frame(width:50)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(topic.isFlashcardsCompleted ? Color.green : Color.red, lineWidth: 2)
                )
                .frame(maxWidth: .infinity, alignment: .center)
                

                
                // Lesson Read Completion
                VStack {
                    Image(systemName: topic.isLessonRead ? "book.fill" : "book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(topic.isLessonRead ? .green : .red)
                    Text("Lesson")
                        .font(.caption)
                    Text("Complete")
                        .font(.caption)
                    Toggle(isOn: $topic.isLessonRead) {
                        EmptyView() // Use an empty view to hide the default label
                    }
                    .frame(width: 50)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(topic.isLessonRead ? Color.green : Color.red, lineWidth: 2)
                )
                .frame(maxWidth: .infinity, alignment: .center)
                
            }
            .padding()
            
            HStack {
 
                NavigationLink {
                    FlashcardScreen(topic: topic, viewModel: viewModel)
                } label: {
                    Text("Practice Flashcards")
                        
                }
                .frame(width: 100, height: 50)
//                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.white)
                .padding(.vertical)
                .background(.blue)
                .cornerRadius(10)

                
                // GO TO QUIZ
                NavigationLink {
                    QuizScreen(topicIndex: topicIndex, topic: topic, viewModel: viewModel)
                } label: {
                    Text("Take the Quiz")
                }
                .frame(width: 100, height: 50)
//                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.white)
                .padding(.vertical)
                .background(.blue)
                .cornerRadius(10)
//                .padding()
                .onAppear() {
                    viewModel.resetQuiz()
                    // this makes it so when I go back into the quiz after getting a high score the quiz starts over
                }
                
                Text("Quiz High Score: \(topic.highScore)")
                    .frame(width: 100, height: 50)
//                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.blue)
                    .padding(.vertical)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .cornerRadius(10)
                    .onAppear() {
                        // this makes sure that it opens a new quiz instead of
                        viewModel.resetQuiz()
                    }
            }
            .padding()

            Text("Lesson for Topic: \(topic.name)")
                .font(.headline)
                .padding()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Scroll for more information and vocab.")
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .frame(alignment: .center)
                        .padding(.horizontal)
                    Text(topic.lessonText)
                        .padding()

                    VocabularyGridView(vocabulary: topic.vocabulary)
                }
                .padding()
            }
        }
    }
}

struct VocabularyGridView: View {
    let vocabulary: [String: String]

    let columns = [
        // 2 columns looked better than having dynamic changing columns (plus the words are visible)
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(Array(vocabulary), id: \.key) { vocab in
                VStack {
                    Text(vocab.key)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .background(.blue.opacity(0.2))
                        .cornerRadius(10)

                    Text(vocab.value)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
            }
        }
        .padding()
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
    
    @State private var rotation: Double = 0
    
    
    var body: some View {
        
        VStack {
            if viewModel.currentQuizIndex < topic.quizQuestions.count {
                VStack {
                    Text("Score: \(viewModel.currentScore)")
                        .font(.headline)
                        .padding()
                    
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
                                isCorrectAnswer = true
                                viewModel.correctAnswer()
                                showResult = true
                            } else {
                                isCorrectAnswer = false
                                viewModel.incorrectAnswer()
                                showResult = true
                            }
                            
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
                }
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
                    Text("You Finished the Quiz!")
                        .font(.largeTitle)
                        .padding()
                    Text("Your Score: \(viewModel.currentScore)")
                        .font(.title)
                        .padding()
                        .onAppear(){
                            viewModel.updateHighScore()
                            viewModel.checkWin()
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
                        }
//                            .rotation3DEffect(Angle(degrees: 1080),axis: (0, 0, 1))
////                            .modifier(Cardify(isFaceUp: true))
//                            .onTapGesture {
//                                withAnimation {
//                                    rotation += 360
//                                }
//                            }
                        
                        
                    } else {
                        VStack {
                            Text("😎")
                                .font(.largeTitle)
                            Text("Get all quiz questions correct to complete the quiz!")
                                .font(.headline)
                        }
//                        .rotation3DEffect(Angle(degrees: 360),axis: (0, 0, 1))
////                        .modifier(Cardify(isFaceUp: true))
//                        .onTapGesture {
//                            withAnimation {
//                                rotation += 360
//                            }
//                        }
                    }

                    Button("Restart Quiz") {
                        viewModel.resetQuiz()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    
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
    
