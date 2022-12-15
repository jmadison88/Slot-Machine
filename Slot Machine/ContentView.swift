//
//  ContentView.swift
//  Slot Machine
//
//  Created by Josh Madison on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 100
    @State private var numbers = [1,2,0]
    @State private var rotation = 180.0
    private var symbols = ["Slots 7","Diamond","Lemon"]
    private var betAmount = 5
    var body: some View {
        NavigationView {
            ZStack { //Title and Background
                Rectangle()
                    .foregroundColor(Color(red: 200/225, green: 150/225, blue: 50/225))
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to Slots!")
                        .font(Font.custom("Futura", size: 28))
                        .bold()
                        .padding(.all, 60)
                        .animation(Animation.easeOut(duration: 0.1))
                    HStack //Slots
                    {
                        Image(symbols[numbers[0]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .animation(Animation.easeOut(duration: 0.5)) //My own unique addition
                        Image(symbols[numbers[1]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .animation(Animation.easeOut(duration: 0.5))
                        Image(symbols[numbers[2]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .animation(Animation.easeOut(duration: 0.5))
                    }
                    Button(action: { //Spin Button (CodeWithChris Tutorial)
                        
                        self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                        
                        self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                        
                        self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                        
                        if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]
                        {
                            self.amount += self.betAmount * 100
                        }
                        
                        else if self.numbers[0] == self.numbers[1] || self.numbers[1] == self.numbers[2]
                        {
                            self.amount += self.betAmount * 5
                        }
                        
                        else {
                            self.amount -= self.betAmount
                        }
                        
                    })
                    {
                        Text("SPIN")
                    }
                    .buttonStyle(CustomButtonStyle()) //Extra UI
                    .padding(.all, 60)
                    .animation(Animation.easeOut(duration: 0.5))
                    Text("Current Dollars: $\(amount)")
                        .font(Font.custom("Futura", size: 25))
                    Text("Out of money?")
                        .padding()
                        .font(Font.custom("Futura", size: 20))
                    Button("Add $50") {
                        amount += 50
                    }
                    .font(Font.custom("Futura", size: 20))
                    Spacer()
                    NavigationLink("Winning Slots", destination:  WinningSlotsView())
                        .font(Font.custom("Futura", size: 35))
                    
                }
            }
        }
    }
    
    struct CustomButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 200)
                .font(Font.custom("Futura", size: 40))
                .padding()
                .background(.red).opacity(configuration.isPressed ? 0.2 : 1.0)
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .bold()
        }
    }
    
    struct WinningSlotsView: View { //View for winning slots
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 200/225, green: 150/225, blue: 50/225))
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Winning Slots")
                        .font(Font.custom("Futura", size: 34))
                        .bold()
                    HStack
                    {
                        Image("Lemon")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(20)
                        Image("Lemon")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(20)
                        Image("Slots 7")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(20)
                    }
                    Text("Two of a kind is $25")
                        .font(Font.custom("Futura", size: 34))
                    HStack
                    {
                        Image("Diamond")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(20)
                        Image("Diamond")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(20)
                        Image("Diamond")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(20)
                    }
                    Text("Three of a kind is $500")
                        .font(Font.custom("Futura", size: 34))
                    
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
