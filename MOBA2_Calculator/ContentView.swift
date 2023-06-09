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
    @State var currentResult: Int = 0
    @State var firstNo : String = ""
    @State var secondNo : String = ""
    @State var operation : String = ""
    
    func setOperation(_ operation: String) {
        self.operation = operation
    }
    
    func reset() {
        operation = ""
    }
    
    func convertStringToInt(_ string: String) -> Int {
        return Int(string) ?? 0
    }
    
    func calculateResult(_ operation: String) -> String {
        
        var result = 0
        
        if (operation == "+") {
            result = convertStringToInt(firstNo) + convertStringToInt(secondNo)
        }
        
        if (operation == "-") {
            result = convertStringToInt(firstNo) - convertStringToInt(secondNo)
        }
        
        if (operation == "*") {
            result = convertStringToInt(firstNo) * convertStringToInt(secondNo)
        }
        
        if (operation == "/") {
            if (self.secondNo == String(0)) {
                // do nothing
            } else {
                result = convertStringToInt(firstNo) / convertStringToInt(secondNo)
            }
        }
        
        return String(result)
    }
    
    var body : some View {
        
        VStack {
            Spacer().padding()
            Text("MOBA2 Calculator")
            HStack {
                Spacer().padding()
                TextField("Enter first number", text: $firstNo).keyboardType(UIKeyboardType.decimalPad)
                Spacer().padding()

            }
            
            HStack {
                OperationButton(
                placeholder: "+",
                action: {
                    setOperation("+")
                    self.resultField = calculateResult(operation)
                    reset()
                }).frame(height: 15).padding()
                OperationButton(
                placeholder: "-",
                action: {
                    setOperation("-")
                    self.resultField = calculateResult(operation)
                    reset()
                }).frame(height: 15).padding()
                OperationButton(
                placeholder: "*",
                action: {
                    setOperation("*")
                    self.resultField = calculateResult(operation)
                    reset()
                }).frame(height: 15).padding()
                OperationButton(
                placeholder: "/",
                action: {
                    setOperation("/")
                    self.resultField = calculateResult(operation)
                    reset()

                }).frame(height: 15).padding()
            }.padding()
            
            HStack {
                Spacer().padding()
                TextField("Enter second number", text: $secondNo)
                    .keyboardType(UIKeyboardType.decimalPad)
                Spacer().padding()

            }.padding()
            Spacer().padding()
            Text("Result:").padding()
            Text(self.resultField)
            Spacer().padding()
        }

    }
    


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
