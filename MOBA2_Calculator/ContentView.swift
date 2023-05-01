//
//  ContentView.swift
//  MOBA2_Calculator
//
//  Created by Tony Mamaril on 01.05.23.
//

import SwiftUI

// operation buttons
struct OperationButton : View {
    var placeholder : String
    var colour = Color.orange
    var action : () -> Void = {}
    
    var body: some View {
        Button(action: self.action, label: {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(self.placeholder).font(Font.system(size: 50)).foregroundColor(.black)
                    Spacer()
                }
                Spacer()
            }
        })
        .background(self.colour)
        .border(Color.white, width: 1)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}


struct ContentView: View {
    @State var resultField : String = String(0)
    @State var currentResult: Int?
    @State var firstNo : String = ""
    @State var secondNo : String = ""
    @State var operation : String?
    
    var body : some View {
        VStack {
            Spacer().padding()
            HStack {
                Spacer()
                TextField("Enter first number", text: $firstNo)
                Spacer()

            }
            
            HStack {
                OperationButton(
                placeholder: "+"
                )
                OperationButton(
                placeholder: "-"
                )
                OperationButton(
                placeholder: "*"
                )
                OperationButton(
                placeholder: "?"
                )
            }
            
            HStack {
                Spacer()
                TextField("Enter second number", text: $firstNo)
                Spacer()

            }
            Spacer().padding()
        }

    }
    


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
