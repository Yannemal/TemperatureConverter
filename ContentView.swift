//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Yannemal on 6/19/23.
//

import SwiftUI


struct ContentView: View {
    
    // data and constants
    @State private var tempType = "Celsius"
    @State private var tempChosen = 0
    @State private var tempToConvertTo = "Fahrenheit"
    
    // @State private var remainingTempTypes = [""]
    let tempSelection = ["Fahrenheit", "Kelvin", "Celsius"]
    // can I set the range according to choice here ?
    // build new computed prop array of strings
    var remainingTempChoices : [String] {
        // animals = animals.filter(){$0 != "chimps"}
        return tempSelection.filter(){$0 != tempType}
    }
    // computed property
    // 1. give me a string that states what we are doing
    var actionAsText : String {
        //internalise
        let currentChoiceTemp = tempType
        let currentChoiceConvertTo = tempToConvertTo
        let currentDegrees = tempChosen
        // output
        var currentSetting : String = ""
       // var freshResult :Int = 0
        // compute result based on choices made
        if currentChoiceTemp == "Celsius" && currentChoiceConvertTo == "Fahrenheit" {
            // why wont it print to console ??
            print("\(currentDegrees) Celsius to Fahrenheit_")
            currentSetting = "Celsius to Fahrenheit"
        } else if currentChoiceTemp == "Celsius" && currentChoiceConvertTo == "Kelvin" {
            // why wont it print to console ??
            print("\(currentDegrees) Celsius to Kelvin_")
            currentSetting = "Celsius to Kelvin"
        } else if currentChoiceTemp == "Fahrenheit" && currentChoiceConvertTo == "Celsius" {
            // why wont it print to console ??
            print("\(currentDegrees) Fahrenheit to Celsius_")
            currentSetting = "Fahrenheit to Celsius"
        } else if currentChoiceTemp == "Fahrenheit" && currentChoiceConvertTo == "Kelvin" {
            // why wont it print to console ??
            print("\(currentDegrees) Fahrenheit to Kelvin_")
            currentSetting = "Fahrenheit to Kelvin"
        } else if currentChoiceTemp == "Kelvin" && currentChoiceConvertTo == "Celsius" {
            // why wont it print to console ??
            print("\(currentDegrees) Kelvin to Celsius_")
            currentSetting = "Kelvin to Celsius"
        } else if currentChoiceTemp == "Kelvin" && currentChoiceConvertTo == "Fahrenheit" {
            // why wont it print to console ??
            print("\(currentDegrees) Kelvin to Fahrenheit_")
            currentSetting = "Kelvin to Fahrenheit"
        }
        // why wont it print to console ??
        print(currentSetting)
        return currentSetting
    }
    // 1. give me the result of the conversion of one to the other
    
    var resultConversion : Int {
        //internalise
        let currentChoiceTemp = tempType
        let currentChoiceConvertTo = tempToConvertTo
        let currentDegrees = tempChosen
        // need double to get correct result then back to Int
        let currentDegreesDouble = Double(currentDegrees)
        // output
       // var currentSetting : String = ""
        var freshResult :Int = 0
        // compute result based on choices made
        if currentChoiceTemp == "Celsius" && currentChoiceConvertTo == "Fahrenheit" {
            // https://www.cuemath.com/c-to-f-formula/
            
            freshResult = Int(currentDegreesDouble * (9/5) + 32)
            
        } else if currentChoiceTemp == "Celsius" && currentChoiceConvertTo == "Kelvin" {
            // https://www.cuemath.com/celsius-to-kelvin-formula/
            
            freshResult = Int(currentDegreesDouble + 273.15)
           
        } else if currentChoiceTemp == "Fahrenheit" && currentChoiceConvertTo == "Celsius" {
           // https://www.cuemath.com/fahrenheit-to-celsius-formula/
            
            freshResult = Int((currentDegreesDouble - 32) * 5/9)
            
            
        } else if currentChoiceTemp == "Fahrenheit" && currentChoiceConvertTo == "Kelvin" {
           
        } else if currentChoiceTemp == "Kelvin" && currentChoiceConvertTo == "Celsius" {
            
        } else if currentChoiceTemp == "Kelvin" && currentChoiceConvertTo == "Fahrenheit" {
           
        }
        // why wont it print to console ??
        print(freshResult)
        return freshResult
    }

        var body: some View {
            Form{
                Section{
                    Text("Temperature              Convertor")
                        .fontWeight(.heavy)
                        .fontWidth(.expanded)
                        .foregroundColor(.blue)
                }
                Section{
                    Text("choose temperature type")
                        .italic()
                    Picker("temperature type", selection: $tempType) {
                        ForEach(tempSelection, id: \.self) {
                            Text("\($0)")
                        }
                    } .pickerStyle(.segmented)
                }
                Section{
                    
                    Picker("choose temperature", selection: $tempChosen) {
                        ForEach(0..<250) // no id: \.self for integer range
                        {
                            Text("\($0)")
                        }
                        
                    } .italic()
                }
                Section{
                    
                    Text("convert \(tempChosen) \(tempType) to")
                        .italic()
                    Picker("tempType to convert to", selection: $tempToConvertTo) {
                        ForEach(remainingTempChoices, id: \.self) {
                            Text("\($0)")
                        }
                    } .pickerStyle(.segmented)
                    
                }
                
                Section {
                    Text("\(tempChosen) \(tempType) = \(resultConversion) in \(tempToConvertTo)")
                }
            }
            // struct end
        }
    } //? where did you go ??


    // Canvas Preview Code  for internal Xcode use
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

