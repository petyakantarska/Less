//
//  DeclutteringChallenge.swift
//  Less
//
//  Created by Petya Kantarska on 17.08.23.
//

import SwiftUI

struct MinimalismChallengeView: View {
    var challengeTexts = [
        "1. Stay offline for one day",
        "2. Meditate for 15 minutes" ,
        "3. Declutter your digital life",
        "4. No-complaint day",
        "5. List 3 to 6 priorities for you life",
        "6. Follow a morning routine",
        "7. Streamline your reading list",
        "8. Learn to enjoy solitude",
        "9. Downsize your beauty collection",
        "10. No social media until lunch",
        "11. Evaluate your commitments",
        "12. Define your goals for this year.",
        "13. Declutter your closet",
        "14. Take a step towards learning new skill",
        "15. Examine your daily habits",
        "16. No buy day",
        "17. Practice single-tasking",
        "18. Unfollow and unfriend",
        "19. Go for a walk and be present",
        "20. No TV all day, read instead",
        "21. Journal for 20 minutes",
        "22. Create a relaxing bedtime routine",
        "23. Go bare-faced",
        "24. Practice gratitude",
        "25. Leave a whole day unplanned",
        "26. identify your stress triggers",
        "27. Clean out your junk drawer",
        "28. Let go of a goal",
        "29. Turn off notifications",
        "30. Evaluate your last 5 purchases"
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<challengeTexts.count, id: \.self) { index in
                    ChallengeButtonView(dayText: challengeTexts[index])
                }
                .padding()
            }
            .navigationTitle("🎯 30 days challenge")
        }
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
                    .background(isCompleted ? Color.secondary.opacity(1.0) : Color.brown.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    //.opacity(isCompleted ? 0.5 : 2.0)
            }
        }
    }
}
