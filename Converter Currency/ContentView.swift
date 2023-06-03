//
//  ContentView.swift
//  Converter Currency
//
//  Created by Alan Zhussupov on 03.06.2023.
//

import SwiftUI
import Combine
struct ContentView: View {
    @State private var secondnumber = ""
    @State private var twotex = ""
    @State private var currency: String = "$"
    @State private var currency1: String = "₸"
    let currencies = ["$", "₸", "₴", "₽", "€"]
    let currencies1 = ["$", "₸", "₴", "₽", "€"]
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
                .overlay (
                    
                    VStack {
                        Text("Converter")
                            .font(.custom("Orbitron", size: 45))
                            .offset(x:-19 ,y: -340)
                            .ignoresSafeArea()
                            .padding(10)
                            .foregroundColor(.white)
                        
                        
                        Text("The current course right now!")
                            .font(.caption)
                            .offset(y: -350)
                            .foregroundColor(.white)
                        
                        
                    }
                )
            // zstack чтобы не конфликтовать с ConverterX надписью
            ZStack{
                // буква Х рядом с Converter
                Text("X")
                    .font(.custom("Orbitron", size: 60))
                    .ignoresSafeArea()
                    .foregroundColor(.green)
                    .offset(x:120,y: -350)
                // текст файлд
                TextField("", text: $secondnumber)
                
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle)
                
                    .offset(x: -65, y: -90)
                    .frame(width: 210, height: 120)
                    .colorMultiply(.white)
                    .brightness(-0.1)
                    .keyboardType(.numberPad)
                    .onReceive(Just(secondnumber)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.secondnumber = filtered
                        }
                    }
                // второй текстфиелд куда будет выводиться
                TextField("", text: $twotex)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle)
                    .colorMultiply(.white)
                    .brightness(-0.1)
                    .frame(width: 210, height: 120)
                    .offset(x: -65, y: -10)
                    .keyboardType(.numberPad)
                    .onReceive(Just(twotex)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.twotex = filtered
                        }
                    }
                    
                // второй пикер
                Picker("Currency", selection: $currency1) {
                    ForEach(currencies1, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .frame(width: 60,height: 60)
                
                .pickerStyle(.menu)
                .background(.white)
                .brightness(0.1)
                .cornerRadius(12)
                .accentColor(.green)
                .padding()
                .offset(x: 80, y: -10)
                // пикер валют пока не подключил
                Picker("Currency", selection: $currency) {
                    ForEach(currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .frame(width: 60,height: 60)
                
                .pickerStyle(.menu)
                .background(.white)
                .brightness(0.1)
                .cornerRadius(12)
                .accentColor(.green)
                .padding()
                .offset(x:80,y: -91)
                
                Button("Convert!") {
                    
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 8)
                .controlSize(.large)
                .colorMultiply(.green)
                .offset(y: 89)
                
                
                    
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
