//
//  ContentView.swift
//  Slot Machine
//
//  Created by Josh Madison on 11/11/22.
//

import SwiftUI

struct ContentView: View {
   
    @State private var amount = 1000
   
    private var symbols = ["Slots 7","Diamond","Lemon"]
    @State private var numbers = [1,2,0]
   
    var body: some View {
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
                Button("Spin")
                {
                    amount -= 100
                }
                .buttonStyle(CustomButtonStyle())
                .padding(.all, 20)
                Text("Current Dollars: $\(amount)")
                    .font(Font.custom("Futura", size: 25))
                    .padding(.all, 30)
                Text("Out of money?")
                    .padding()
                    .font(Font.custom("Futura", size: 20))
                Button("Get Money") {
                    amount += 100
                }
                .font(Font.custom("Futura", size: 20))
                Spacer()
                NavigationLink("Winning Slots", destination: WinningView())
                    .font(Font.custom("Futura", size: 35))
                
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
    
    struct WinningView: View {
        var body: some View {
                VStack {
                    Text("Winning Slots")
                    VStack (alignment: .center) {
                        Image("Slot 7").resizable().frame(width: 150, height: 150)
                    }
                }
            }
        }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
