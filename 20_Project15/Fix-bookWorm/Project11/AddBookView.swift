//
//  AddBookView.swift
//  Project11
//
//  Created by Dean Thompson on 2022/01/17.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    var isValidInput: Bool {
        
        let titleTrim = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let authorTrim = author.trimmingCharacters(in: .whitespacesAndNewlines)
        let genreTrim = genre.trimmingCharacters(in: .whitespacesAndNewlines)
        let reviewTrim = review.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if titleTrim.isEmpty || authorTrim.isEmpty || genreTrim.isEmpty || reviewTrim.isEmpty {
            return false
        }
        
        return true
    }
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        newBook.date = Date.now
                        
                        try? moc.save()
                        dismiss()
                    }
                    .disabled(isValidInput == false)
                }
                
            }.navigationTitle("Add Book")
            
        }
        
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
