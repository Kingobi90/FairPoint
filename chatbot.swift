//
//  chatbot.swift
//  FairPointt
//
//  Created by Obinna Chukwu on 2/26/25.
//

import Foundation
import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUserMessage: Bool
}
struct ChatBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isUserMessage {
                Spacer() // push bubble to the right for user messages
            }
            
            Text(message.text)
                .padding()
                .foregroundColor(message.isUserMessage ? .white : .black)
                .background(message.isUserMessage ? Color.yellow : Color.gray.opacity(0.2))
                .cornerRadius(16)
            
            if !message.isUserMessage {
                Spacer() // push bubble to the left for non-user messages
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
struct ChatView: View {
    @State private var messages: [ChatMessage] = [
        ChatMessage(text: "Now, was the driver robbed in 2021? I keep hearing about that last lap.", isUserMessage: true),
        ChatMessage(text: "Yeah, that final race was crazy! I mean, have you heard both perspectives?", isUserMessage: false),
        ChatMessage(text: "I’ve heard both sides.", isUserMessage: true),
        ChatMessage(text: "Alright. Some fans say one thing, others say something else. What’s your verdict?", isUserMessage: false)
    ]
    
    @State private var newMessageText: String = ""
    
    var body: some View {
        VStack {
            // MARK: - Header
            HStack {
                Text("FairPoint by HorizonWebWorX")
                    .font(.headline)
                    .foregroundColor(.black)
                
                // Small green indicator
                Circle()
                    .fill(Color.green)
                    .frame(width: 8, height: 8)
                    .padding(.leading, 4)
                
                Spacer()
            }
            .padding()
            
            // MARK: - Chat Messages
            ScrollView {
                ScrollViewReader { proxy in
                    VStack(spacing: 0) {
                        ForEach(messages) { msg in
                            ChatBubble(message: msg)
                        }
                    }
                    .onChange(of: messages.count) { _ in
                        // Scroll to the bottom whenever a new message is added
                        if let lastMessage = messages.last {
                            withAnimation {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            
            // MARK: - Input Bar
            HStack {
                // Text Field
                TextField("Write your message", text: $newMessageText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                
                // Mic Button
                Button(action: {
                    // Handle mic action
                    print("Mic tapped")
                }) {
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 8)
                
                // Send Button
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.yellow)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
    
    // MARK: - Send Message
    private func sendMessage() {
        guard !newMessageText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        // Create a new user message
        let userMsg = ChatMessage(text: newMessageText, isUserMessage: true)
        messages.append(userMsg)
        
        // Clear text field
        newMessageText = ""
        
        // TODO: If you have a bot or AI reply, you’d add another message here
        // after some delay or an API call, e.g.:
        // let botReply = ChatMessage(text: "Thanks for your message!", isUserMessage: false)
        // messages.append(botReply)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
