# NewsApp
A simple news app using SwiftUI and NewsAPI

## Summary
This is a news app using the news api to fetch data and we can seperate the information by categories of topics, we can share them, bookmark them, and also search for topics of interest through the search tab.

## Built With
* [SwiftUI](https://developer.apple.com/tutorials/swiftui)
* [NewsAPI](https://newsapi.org/)

## Gif of App
![Gif](./NewsApp/Resources/Assets.xcassets/gif.dataset/gif.gif)

## Installation Steps For Local Running
1. Clone project.
2. Open terminal
3. cd 'your-desired-path'
4. git clone 'paste-link-here'
5. open project in Xcode and run

## Code Snippet Of Fetching Data
```swift
    func fetch(from category: Category) async throws -> [Article] {
        try await fetchArticles(from: generalNewsURL(from: category))

    }
    
    func search(for query: String) async throws -> [Article] {
        try await fetchArticles(from: generateSearchURL(from: query))
        
    }
    
    private func fetchArticles(from url: URL) async throws -> [Article] {
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            
            throw generateErrorCode(description: "Bad Response")
        }
        
    }
```


## Author

* **Mehdi Safari**

- [Link to Github](https://github.com/mehdisafari77)
- [Link to LinkedIn](https://www.linkedin.com/in/mehdi-safari-992799142/)
