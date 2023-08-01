//
//  ContentView.swift
//  homework22
//
//  Created by afnan saad on 13/01/1445 AH.
//

import SwiftUI
struct CustomBorder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.secondary, lineWidth: 2)
            )
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
struct ContentView: View {
    @State private var isPresented = false
    @State private var isDarkMode = true
    @State private var opacity = 0.1

    var body: some View {
        
        ScrollView{
            VStack {

                /* Create a SwiftUI View with multiple text and image views using the Text and Image views.
                 Apply various modifiers such as font, color, padding, and alignment to customize the views.*/
                Text("make it real")
                    .font(.title)
                    .foregroundColor(.blue)
                   .opacity(opacity)
                   .modifier(CustomBorder())


                Image("swim")
                    .resizable()
                    .frame(width: 300,height: 300 , alignment: .center)
                    .padding(40)
                   .opacity(opacity)
                Image("swim")
                    .resizable()
                    .frame(width: 300,height: 300 , alignment: .center)
                    .padding(40)
                    .opacity(opacity)

                Image("swim")
                    .resizable()
                    .frame(width: 300,height: 300 , alignment: .center)
                    .padding(40)

                    .opacity(opacity)
                Slider(value: $opacity, in: 0...1)

                /* Implement animation to create a fade-in effect for the views using the .opacity modifier.
                 Apply custom styles to the buttons, texts, or images to enhance the user interface.*/
                Button("Show Sheet") {
                    isPresented = true
                }
                .sheet(isPresented: $isPresented) {
                    List {
                        Toggle("Dark Mode", isOn: $isDarkMode)
                    }
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                    .opacity(opacity)                }

            }
                    }
        
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
