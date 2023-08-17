//
//  DeclutteringChallenge.swift
//  Less
//
//  Created by Petya Kantarska on 17.08.23.
//

import SwiftUI

struct MinimalismChallengeView: View {
    var challengeTexts = [
        "1. Stay offline for one day", "2. Meditate for 15 minutes" , "3. Declutter your digital life", "4. No-complaint day", "5. List 3 to 6 priorities for you life", "6. Follow a morning routine", "7. Streamline your reading list", "8. Learn to enjoy solitude", "9. Downsize your beauty collection", "10. No social media until lunch", "11. Evaluate your commitments", "12. Define your goals for this year.", "13. Declutter your closet", "14. Learn one new thing", "15. Review you routines and habits", "No buy day", "practice single-tasking", "Declutter frinds list in social media", "Go for a walk and be present", "Do one load of laundry, start to finish", "Choose 10 toys, kids'books, or knicknacks to donate", ""
    ]
    
    var body: some View {
        ScrollView {
                ForEach(0..<challengeTexts.count, id: \.self) { index in
                    ChallengeButtonView(dayText: challengeTexts[index])
                                }
                        }
            .padding()
        }
    }
    
    struct ChallengeButtonView: View {
        @State private var isCompleted = false
        var dayText: String
        
        var body: some View {
                VStack {
                    Button {
                        isCompleted.toggle()
                    } label: {
                        Text(isCompleted ? "Completed" : dayText)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(isCompleted ? Color.primary : Color.mint)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .opacity(isCompleted ? 0.5 : 1.0)
                    }
                }.navigationTitle("30 days challenge")
                
        }
    }
