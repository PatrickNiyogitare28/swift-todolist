//
//  ContentView.swift
//  TodoApp
//
//  Created by Patrick Niyo on 02/01/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ToDoItem.isCompleted) private var toDoItems: [ToDoItem]
    
    @State private var isAlertShowing = false
    @State private var toDoTitle = ""
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(toDoItems){ toDoItem in
                    HStack{
                        Button {
                            toDoItem.isCompleted.toggle()
                        } label: {
                            Image(systemName: toDoItem.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                        
                        Text(toDoItem.title)
                    }
                }
                .onDelete(perform: deleteToDoItem)
            }
            .navigationTitle(Text("Todo App"))
            .toolbar {
                Button {
                    isAlertShowing.toggle()
                }
                label: {
                    Image(systemName: "plus.circle")
                }
            }
            .alert("Add Todo", isPresented: $isAlertShowing){
                TextField("Enter ToDo", text: $toDoTitle)
                
                Button {
                    modelContext.insert(ToDoItem(title: toDoTitle, isCompleted: false))
                    
                    // Reset todo title
                    toDoTitle = ""
                }
                label : {
                    Text("Add")
                }
            }
            // Render on first launch
            .overlay {
               if toDoItems.isEmpty {
                   ContentUnavailableView("Nothing to do here", systemImage: "checkmark.circle.fill")
                }
            }
        }
    }
    
    func deleteToDoItem(_ indexSet: IndexSet) {
        for index in indexSet {
            let toDoItem = toDoItems[index]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
}
