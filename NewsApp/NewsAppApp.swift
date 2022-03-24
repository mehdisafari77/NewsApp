//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Mehdi MMS on 23/03/2022.
//

import SwiftUI

@main
struct NewsAppApp: App {

    @StateObject var articleBookMarkVM = ArticleBookmarkViewModel.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookMarkVM)
        }
    }
}
