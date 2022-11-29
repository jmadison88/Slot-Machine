//
//  ContentView.swift
//  Slot Machine
//
//  Created by Josh Madison on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 1000
    @State private var numbers = [1,2,0]
    @State private var showAlert = false
    private var symbols = ["Slots 7","Diamond","Lemon"]
    private var betAmount = 5
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 200/225, green: 150/225, blue: 50/225))
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to Slots!")
                        .font(Font.custom("Charter", size: 43))
                    HStack
                    {
                        
                        Image(symbols[numbers[0]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(symbols[numbers[1]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(symbols[numbers[2]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        
                        
                    }
                    Button(action: {
                        
                        self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                        
                        self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                        
                        self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                        
                        if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]
                        {
                            if self.numbers[1] == self.numbers[0] && self.numbers[2] == self.numbers[0]
                            {
                                self.amount += self.betAmount * 1000
                            }
                            else if self.numbers[1] == self.numbers[2] && self.numbers[0] == self.numbers [2]
                            {
                                self.amount += self.betAmount * 100
                            }
                            else {
                                self.amount += self.betAmount * 10
                            }
                        }
                        else {
                            self.amount -= self.betAmount
                        }
                        
                    })  {
                        Text("Spin")
                    }
                    .buttonStyle(CustomButtonStyle())
                    .padding(.all, 20)
                    Text("Current Dollars: $\(amount)")
                        .font(Font.custom("Futura", size: 25))
                        .padding(.all, 30)
                    Text("Out of money?")
                        .padding()
                        .font(Font.custom("Futura", size: 20))
                    Button("Add $50") {
                        amount += 50
                    }
                    .font(Font.custom("Futura", size: 20))
                    Spacer()
                    NavigationLink("Winning Slots", destination: WinningSlotsView())
                        .font(Font.custom("Futura", size: 35))
                    
                }
            }
        }
    }
    struct CustomButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 70)
                .font(Font.custom("Futura", size: 24))
                .padding()
                .background(Color(red: 40/225, green: 150/225, blue: 225/225))
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .bold()
        }
    }
    
    struct WinningSlotsView: View {
        var body: some View {
            VStack {
                Text("Winning Slots")
                    .font(.title)
                HStack (alignment: .center) {
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
                Text("Three diamonds are $5,000")
                HStack
                {
                    Image("Slots 7")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(20)
                    Image("Slots 7")
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
                Text("Three 7's are $500")
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
                    Image("Lemon")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(20)
                }
                Text("Three Lemons are $100")

            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
