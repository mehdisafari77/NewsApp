//
//  RetryView.swift
//  NewsApp
//
//  Created by Mehdi MMS on 23/03/2022.
//

import SwiftUI

struct RetryView: View {
    
    let text: String
    let retryAction: () -> ()
    
    var body: some View {
        VStack {
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Try again")
            }
        }
    }
}

struct RetryView_Previews: PreviewProvider {
    static var previews: some View {
        RetryView(text: "An error occurred") {
            
        }
    }
}

