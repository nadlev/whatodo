//
//  ContentView.swift
//  Whatodo
//
//  Created by Надежда Левицкая on 4/11/23.
//

import SwiftUI
import CoreData
import SwiftUICharts

let charts = ChartStyle(backgroundColor: Color(#colorLiteral(red: 0.8379132256, green: 0.113223292, blue: 0.4104446862, alpha: 1)).opacity(0.0), accentColor: Color( #colorLiteral(red: 1, green: 0.9183496284, blue: 0.06874209718, alpha: 1)), secondGradientColor: Color(#colorLiteral(red: 0.1895590621, green: 0.1168746242, blue: 0.4104446862, alpha: 1)), textColor: Color.white, legendTextColor: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), dropShadowColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))

struct ContentView: View {
    
    @State private var showSide: Bool = false
    @State private var showAddView: Bool = false
    @State private var searched: String = ""
    @State private var title: String = ""
    @State private var userFirstName: String = "User"
    @State private var userLastName: String = ""
    @State private var imagePicker: Bool = false
    @State private var isCompleted: Bool = false
    @State private var fullNameShowing: Bool = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.createdAt, ascending: true)]) var user: FetchedResults<User>
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.createdAt, ascending: true)]) var task: FetchedResults<Task>
    
    var body: some View {
        ZStack (alignment: .leading) {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showSide = false
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 2.0)
                                .foregroundColor(Color(#colorLiteral(red: 0.1895590621, green: 0.1168746242, blue: 0.4104446862, alpha: 1)).opacity(0.5))
                            
                            Image(systemName: "arrow.left")
                                .foregroundColor(Color(#colorLiteral(red: 0.8379132256, green: 0.113223292, blue: 0.4104446862, alpha: 1)).opacity(0.5))
                        }
                        .frame(width: 50, height: 50, alignment: .center)
                    }
                }
                ZStack {
                    Circle()
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                    
                    Circle()
                        .trim(from: 0.0, to: 0.43)
                        .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color( #colorLiteral(red: 1, green: 0.9183496284, blue: 0.06874209718, alpha: 1)))
                        .rotationEffect(.degrees(-90))
                    
                }
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.top, -30)
                
            }
            
            VStack(alignment: .leading, spacing: 10) {
                if user.count == 0 {
                    Text("Welcome")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .foregroundColor(Color.blue)
                } else {
                    let usercount = user.count - 1
                    Text("\(user[usercount].firstName!)")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .foregroundColor(Color.blue)
                    Text("\(user[usercount].lastName!)")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
