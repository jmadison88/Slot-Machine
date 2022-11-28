//
//  ContentView.swift
//  Slot Machine
//
//  Created by Josh Madison on 11/11/22.
//

import SwiftUI

struct ContentView: View {
   
    @State private var amount = 1000
   
    private var symbols = ["","",""]
    @State private var numbers = [0,0,0]
   
    var body: some View {
        VStack {
            Text("Welcome to Slots!")
                .font(Font.custom("Charter", size: 47))
                .font(.title)
                .bold()
            HStack
            {
                Image("Slot 7")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    .padding()
                Image("Slot 7")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    .padding()
                Image("Slot 7")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    .padding()
            }
            Button("Spin")
            {
                amount -= 100
            }
            .buttonStyle(CustomButtonStyle())
            Text("Current Dollars: $\(amount)")
                .bold()
                .padding()
                .font(Font.custom("Futura", size: 25))
            Text("Out of money?")
                .bold()
                .padding()
                .font(Font.custom("Futura", size: 20))
            Button("Get Money") {
                amount += 100
            }
            .font(Font.custom("Futura", size: 20))
            Spacer()
                .preferredColorScheme(.dark)
            
        }
    }
    
    struct CustomButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 70)
                .font(Font.custom("Futura", size: 24))
                .padding()
                .background(.red).opacity(configuration.isPressed ? 0.0 : 1.0)
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
    
    struct WinningSlotsView: View {
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
