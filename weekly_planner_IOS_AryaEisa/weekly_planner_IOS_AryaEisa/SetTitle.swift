//
//  SetTitle.swift
//  weekly_planner_IOS_AryaEisa
//
//  Created by Arya Pour Eisa on 2024-01-19.
//


import SwiftUI



struct SetTitle: View {
    @State private var todos = [Todolist(title: "build an app", days: .mandag)]
    @State var selectedDay = Days.mandag
    let days: [Days] = [.mandag, .tisdag, .onsdag, .torsdag, .fredag, .lordag, .sondag]
    //@State var todoObject : Todolist
    @State private var searchString = ""
    @State var textInput = ""
    private var filteredTodos: [Todolist] {
        guard !searchString.isEmpty else {
            return todos.filter { (todo: Todolist) -> Bool in
                return todo.days == selectedDay
            }
        }
        return todos.filter { (todo: Todolist) -> Bool in
            return todo.days == selectedDay && todo.title.uppercased().contains(searchString.uppercased())
        }
    }
    
    
    
    
    var body: some View {
        
            
            
            

            
            NavigationStack{
                
                List{
                    
                    VStack{
                        
                        Picker("Day:", selection: $selectedDay){
                            ForEach(days, id: \.self) {
                                Text($0.rawValue).foregroundStyle(Color.red)
                            }
                        }
                        .padding()
                    }.background(Color.gray)
                    Spacer()
                    ForEach(filteredTodos){ todo in
                        HStack{
                            Image(systemName:todo.isDone ? "checkmark.circle" : "circle")
                                .onTapGesture {
                                    if let index = todos.firstIndex(where: {
                                        $0.id == todo.id}){
                                        todos[index].isDone.toggle()
                                    }
                                    
                                }
                            Text(todo.title)
                        }
                    }
                    
                    
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            
                            todos.remove(at: index)
                            
                        }
                    })
                    
                    
                    TextField("Enter new ToDo",text: $textInput).textContentType(.emailAddress)
                        .foregroundColor(.white)
                        .onSubmit {
                            todos.append(Todolist(title: textInput, days: selectedDay))
                            textInput = ""
                        }
                        .font(.subheadline)
                        .foregroundColor(.purple)
                        .padding()
                        .background(.red.opacity(0.4))
                        .cornerRadius(10)
                }
                
                
                .scrollContentBackground(.hidden)
                .searchable(text: $searchString)
                .background{
                    Image(.background).resizable()
                        .frame(width: 400, height: 1100)
                        .foregroundColor(.white)
                        .colorMultiply(.pink)
                }
                .padding()
            }
            
            
        
            
            
       
        }
    }

       //done




#Preview {
    SetTitle()
}
