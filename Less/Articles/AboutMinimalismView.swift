//
//  AboutMinimalism.swift
//  Less
//
//  Created by Petya Kantarska on 17.08.23.
//

import SwiftUI

struct AboutMinimalismView: View {
    
    @ObservedObject private var viewModel = ArticleViewModel()
    @State private var isExpanded = false

    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.articles) { article in
                    ScrollView {
                        Spacer(minLength: 20)
                        Text(article.title)
                            .font(.headline)
                        Text(article.content)
                            .font(.caption2)
                            .lineLimit(isExpanded ? nil : 2)
                            .padding()
                            .onTapGesture {
                                withAnimation {
                                isExpanded.toggle()
                                        }
                                    }
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }) {
                            Text(isExpanded ? "Read Less" : "Read More")
                                .font(.caption)
                                .foregroundColor(.blue)
                                //.padding()
                        }
                    }
                }
            }.onAppear{
                viewModel.fetchArticles()
            }
            .navigationTitle("💫 About Minimalism")
        }
    }
}

