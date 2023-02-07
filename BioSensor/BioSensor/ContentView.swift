//
//  ContentView.swift
//  BioSensor
//
//  Created by Shi Xiang Lim on 1/21/23.
//

import SwiftUI
import CoreMotion

/*
class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published var roll = 0.0
    
    init() {
        motionManager.startDeviceMotionUpdates(to:.main) { [weak self] data, error in guard let motion = data?.attitude else {return}
            self?.roll = motion.roll
        }
    }
}
 */


let lightGrey = Color(red: 0.8667, green: 0.8667, blue: 0.8667)

struct ContentView: View {
    

    @State private var readings =        [
        Reading(
            date:"01/02/03",
            interval:"Test"
        )
        ]
    
    @State private var tabSelection = 1
    @State private var buttonPressed = 0
    @State private var currentDate = Date.now
    @State private var textInput = ""
    var body: some View {
        TabView (selection: $tabSelection){
            MainMenu(tabSelection: $tabSelection)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
                .tag(1)
            
            Measurement(currentDate:$currentDate,
                        reading:$readings, textInput:$textInput)
                .tabItem {
                    Label("Measurement", systemImage: "square.and.pencil")
                }
                .tag(2)
            Notification(currentDate:$currentDate)
                .tabItem {
                    Label("Notification", systemImage: "bell")
                }
                .tag(3)
            QuickStartGuide()
                .tabItem {
                    Label("Quick Start", systemImage: "gear.badge.questionmark")
                }
                .tag(4)
        }
    }
}

struct Reading: Identifiable {
    let date: String
    let interval:String
    let id = UUID()
}

struct MainMenu: View {
    @Binding var tabSelection: Int
    let motion = CMMotionManager()
    
    var body: some View {
        ZStack{
            /*
            LinearGradient(
                                colors: [.blue, .yellow],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea([.top])*/
            Color.teal.edgesIgnoringSafeArea([.top])
            VStack {
                Spacer()
                Text("APT BioSensor")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.orange)
                Spacer()
                
                Button(action: {
                    print("Pressed!")
                    motion.startGyroUpdates()
                    let roll = motion.gyroData
                    motion.stopGyroUpdates()
                    print(roll as Any)
                }){
                    Text("Start Measurement")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width*3/4, height: UIScreen.main.bounds.width*3/4)
                        .background(lightGrey)
                        .clipShape(Circle())
                }.buttonStyle(PlainButtonStyle())
                    .shadow(radius: 2)
                Spacer()
                
                Text("Quick Start Guide")
                    .font(.title2)
                    .foregroundColor(.white)
                    .underline()
                    .onTapGesture {
                        self.tabSelection=4
                    }
                Spacer()
            }
        }
        
    }
}

struct Measurement: View {
    @Binding var currentDate:Date
    @Binding var reading:[Reading]
    @Binding var textInput:String
    var body: some View {
        ZStack{
            Color.teal.edgesIgnoringSafeArea([.top])
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    DatePicker("",
                               selection: $currentDate,displayedComponents: .date)
                        .labelsHidden()
                        .frame(width: 150, height: 80, alignment: .center)
                        .clipped()
                    
                    Spacer()
                }
                Spacer()
                TextEditor(text: .constant("Placeholder for chart"))
                    .padding(.horizontal)
                HStack{
                    Spacer()
                    /*
                    Table(reading) {
                        TableColumn("Date",value: \.date)
                        TableColumn("Time Interval (s)", value:\.interval)
                    }
                    */
                    List {
                        HStack{
                            Text("Content1")
                            Spacer()
                            Text("Value")
                        }
                        HStack{
                            Text("Content1")
                            Spacer()
                            Text("Value")
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    TextField("Delete row",text:$textInput)
                        .font(.subheadline.weight(.bold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width*5/10, height: UIScreen.main.bounds.width*1/10)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    
                    Spacer()
                    
                    Button("Delete") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .font(.subheadline.weight(.bold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width*5/10, height: UIScreen.main.bounds.width*1/10)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 30.0))
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct Notification: View {
    @Binding var currentDate:Date
    var body: some View {
        ZStack{
            Color.teal.edgesIgnoringSafeArea([.top])
            VStack{
                HStack{
                    Text("Notification")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding(.leading)
                    Spacer()
                    Button("+"){} .padding(.trailing).foregroundColor(Color.black).buttonBorderShape(ButtonBorderShape.roundedRectangle)
                        .frame(width: UIScreen.main.bounds.width*1/8, height: UIScreen.main.bounds.width*1/8)
                        .background(Color.gray.edgesIgnoringSafeArea([]))
                        
                    Button("-"){} .padding().foregroundColor(Color.black).buttonBorderShape(ButtonBorderShape.roundedRectangle)
                        .frame(width: UIScreen.main.bounds.width*1/8, height: UIScreen.main.bounds.width*1/8)
                        .background(Color.gray.edgesIgnoringSafeArea([]))

                }
                Spacer()
                List {
                        HStack{
                            DatePicker("",
                                       selection: $currentDate,displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .frame(width: 150, height: 80, alignment: .leading)
                                .clipped()
                            Spacer()
                            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                               
                            }
                        }
                    HStack{
                        DatePicker("",
                                   selection: $currentDate,displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .frame(width: 150, height: 80, alignment: .leading)
                            .clipped()
                        Spacer()
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            
                        }
                    }
                }
                Spacer()
            }
            
        }
    }
}

struct QuickStartGuide: View {
    var body: some View {
        ZStack{
            Color.teal.edgesIgnoringSafeArea([.top])
            VStack{
                Text("This place is for information, ideally in list view")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
