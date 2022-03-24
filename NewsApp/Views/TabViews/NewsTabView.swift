//
//  NewsTabView.swift
//  NewsApp
//
//  Created by Mehdi MMS on 23/03/2022.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articlesNewsVM = ArticleNewsViewModel()
    
    
    var body: some View {
        NavigationView {
            ArticleListView(articles: articles)
                .overlay(overlayView)
            // everytime the timestamp changes, this function will trigger
                .task(id: articlesNewsVM.fetchTaskToken, loadTask)
            //pull to refresh method
                .refreshable(action: refreshTask)
                .navigationTitle(articlesNewsVM.fetchTaskToken.category.text)
                .navigationBarItems(trailing: menu)
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
            switch articlesNewsVM.phase {
                
            case .empty:
                 ProgressView()
            case .success(let articles) where articles.isEmpty:
                 EmptyPlaceholderView(text: "No articles", image: nil)
            case .failure(let error):
                 RetryView(text: error.localizedDescription, retryAction: refreshTask)

            default: EmptyView()
            }
    }

    @Sendable private func loadTask() async {
        await articlesNewsVM.loadArticles()
    }
    
    @Sendable private func refreshTask() {
        articlesNewsVM.fetchTaskToken = FetchTaskToken(category: articlesNewsVM.fetchTaskToken.category, token: Date())
    }
    
    // creating the options for you to click whichever category you want
    private var menu: some View {
        Menu {
            Picker("Category", selection: $articlesNewsVM.fetchTaskToken.category) {
                ForEach(Category.allCases) {
                    Text($0.text).tag($0)
                }
            }
        } label: {
            Image(systemName: "fiberchannel")
                .imageScale(.large)
        }
    }
    
    // getting the data from the enum
    private var articles: [Article] {
        if case let .success(articles) = articlesNewsVM.phase {
            return articles
        } else {
            return []
        }
    }
}

struct NewsTabView_Previews: PreviewProvider {
    
    @StateObject static var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    static var previews: some View {
        NewsTabView(articlesNewsVM: ArticleNewsViewModel(articles: Article.previewData))
            .environmentObject(articleBookmarkVM)
    }
}


