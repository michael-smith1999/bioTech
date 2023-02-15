//
//  MeasurementPage.swift
//  BioSensor
//
//  Created by Shi Xiang Lim on 2/7/23.
//

import Foundation
import SwiftUI
import Charts


/*
 ToDo: Currently pending on determining how the data is saved.
    - Create a filter function using the date picker.
    - Figure out how to grab data and insert into list.
 */

struct Measurement: View {

    @Binding var currentDate:Date
    @Binding var reading:[Reading]
    @Binding var textInput:String
    
    var tmp = listView()
    var body: some View {
        ZStack{
            Color(red: 0.50, green: 0.82, blue: 0.96).edgesIgnoringSafeArea(.all)
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
                HStack{
                    tmp
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct measurementData{
    let id = UUID()
    //let date= Date.now.formatted()    Uncomment when implementing
    let date:Date
    let data: String
}

struct measurementRow:View{
    var measurement : measurementData
    
    var body: some View{
        HStack{
            Text("\(measurement.date)")
            Spacer()
            Text("\(measurement.data)")
        }
    }
}

struct listView:View{
    
    @State public var measurements = [
        measurementData(date: Date.now.addingTimeInterval(-160000),data:"152.2"),
        measurementData(date: Date.now.addingTimeInterval(-86400), data:"150"),
        measurementData(date: Date.now,data:"22"),
        ]
    
    var body:some View{
        VStack{ //Delete this line after data integration
            //Delete from here
            Chart {
                ForEach(measurements,id:\.id) { item in
                    LineMark(
                        x: .value("Month", item.date),
                        y: .value("Temp", item.data)
                    )
                }
            }
            .chartPlotStyle { plotContent in
              plotContent
                    .background(.white.opacity(1.0))
                .border(Color.blue, width: 2)
            }
            .frame(width: UIScreen.main.bounds.width*7/8, height: UIScreen.main.bounds.height*1/3)
            
            //Delete To Here
            NavigationView{
                List{ForEach(measurements, id:\.id) {measure in
                    measurementRow(measurement: measure)
                }.onDelete{
                    indexSet in
                    measurements.remove(atOffsets:indexSet)
                }
                } .navigationBarTitle("Data", displayMode: .inline)
            }
            Button("Add Measurement"){getMeasurements()} //Delete this line after data integration
        } //Delete this line after data integration
    }
    
    
    //Remove Date reference during implementation
    func getMeasurements(){
        measurements.append(measurementData(date:Date.now, data:String(Int.random(in:1...100))))
    }
    
}
