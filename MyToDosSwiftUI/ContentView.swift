//
//  ContentView.swift
//  MyToDosSwiftUI
//
//  Created by Yunus Emre Taşdemir on 23.06.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment (\ .modelContext) var context
    
    @State private var showCreate = false
    @Query private var items: [ToDoltem]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            if item.isCritical {
                                Image (systemName: "exclamationmark.3")
                                    .symbolVariant(.fill)
                                    .foregroundColor(.red)
                                    .font(.largeTitle)
                                    .bold()
                            }
                            
                            Text (item.title)
                                .font(.largeTitle)
                                .bold()
                            
                            Text ("\(item.timestamp, format: Date.FormatStyle (date: .numeric, time: .shortened))")
                                .font (.callout)
                        }
                        
                        Spacer ()
                        
                        Button {
                            withAnimation {
                                item.isCompleted.toggle()
                            }
                        } label: {
                            Image (systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isCompleted ? .green : .gray) . font (.largeTitle)
                        }
                        .buttonStyle(.plain)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                context.delete(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .symbolVariant (.fill)
                        }
                    }
                }
            }
            .navigationTitle("My To Do List")
            .toolbar {
                ToolbarItem {
                    Button (action: {
                        showCreate.toggle ()
                    }, label: {
                        Label ("Add Item", systemImage: "plus")
                    })
                }
            }
            .sheet(isPresented: $showCreate,
                    content: {
                NavigationStack {
                    CreateView()
                }
                .presentationDetents ([. medium])
            })
        }
    }
}

#Preview {
    ContentView()
}
