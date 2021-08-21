//
//  ContentView.swift
//  MyToDos
//
//  Created by Abdul Wahab on 8/18/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore : DataStore
    @State var modelType : ModelType? = nil
    
    var body: some View {
        NavigationView{
            List(){
                ForEach(dataStore.toDos){ ToDo in
                    Button(action: {
                        modelType = .update(ToDo)
                    }, label: {
                        Text(ToDo.name)
                            .font(.title3)
                            .strikethrough(ToDo.complete)
                            .foregroundColor(ToDo.complete ? .green : Color(.label))
                    })
                }
                .onDelete(perform: { indexSet in
                    dataStore.deleteToDo(at: indexSet)
                })
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar{
                //item for header
                ToolbarItem(placement: .principal){
                    Text("ToDo")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                
                //item for add toDo
                ToolbarItem{
                    Button(action: {
                        modelType = .new
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            }
            .sheet(item: $modelType) { $0 }
            .alert(item: $dataStore.appError) { appError in
                Alert(title: Text("Oh"), message: Text(appError.error.localizedDescription))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())
    }
}
