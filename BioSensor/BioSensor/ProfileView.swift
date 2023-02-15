//
//  ProjectView.swift
//  BioSensor
//
//  Created by Rivera Torres, Patria I. on 2/15/23.
//

import Foundation
import SwiftUI
import CoreMotion

struct ProfileView: View {
    @State private var currentDate = Date.now
    
    var name: String = "Albert Gator"
    var username: String = "A.Gator352"
    var profileImage: Image = Image(systemName: "person.fill")
    
    var body: some View {
        ZStack {
            Color(red: 0.50, green: 0.82, blue: 0.96).edgesIgnoringSafeArea(.all)
            NavigationView {
                VStack{
                    VStack {
                        profileImage
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .foregroundColor(.accentColor)
                        
                        Text(name)
                            .font(.title)
                            .bold()
                        
                        //                        Text(username)
                        //                            .font(.subheadline)
                        //                            .foregroundColor(.gray)
                        
                        NavigationLink(destination: Notification(currentDate:$currentDate)){
                            Text("REMINDERS")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18)
                                    .bold())
                                .padding()
                                .foregroundColor(.accentColor)
                                .background(Color(red: 0.82, green: 0.88, blue: 0.92))
                        }
                        .cornerRadius(10)
                        .padding()
                        
                        Button(action: {
                            print("Resources was tapped")
                        }) {
                            Text("RESOURCES")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18)
                                    .bold())
                                .padding()
                                .foregroundColor(.accentColor)
                                .background(Color(red: 0.82, green: 0.88, blue: 0.92))
                        }
                        .cornerRadius(10)
                        .padding()
                        
                        Button(action: {
                            print("About was tapped")
                        }) {
                            Text("ABOUT")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18)
                                    .bold())
                                .padding()
                                .foregroundColor(.accentColor)
                                .background(Color(red: 0.82, green: 0.88, blue: 0.92))
                        }
                        .cornerRadius(10)
                        .padding()
                    }
                    .padding()
                    .frame(maxHeight: .infinity)
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 8)
                        .background(Color.white.opacity(0.2))
                }
            }
        }
    }
}
