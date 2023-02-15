//
//  NotificationPage.swift
//  BioSensor
//
//  Created by Shi Xiang Lim on 2/7/23.
//

import Foundation
import SwiftUI


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
