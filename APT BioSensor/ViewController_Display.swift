//
//  ViewController_Display.swift
//  APT BioSensor
//
//  Created by Michael Smith on 10/4/22.
//

import UIKit
import SwiftUI
import Charts


//struct YawData: Identifiable{
//    let id = UUID()
//    let valueYaw: Double
//
//    init(theValue: Double){
//        self.valueYaw = theValue
//    }
//}
//
//struct YawStruct {
//    var reading: Int
//    var value: Double
//}


class ViewController_Display: UIViewController {
    
   // @IBOutlet weak var LineChartView: UIView!
    @IBOutlet weak var dateOutput: UITextView!
    
    @IBOutlet weak var dateOutput2: UITextView!
    
    @IBOutlet weak var dateOutput3: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var queryVal = ""
    var rollOutput = ""
    var pitchOutput = ""
    var yawOutput = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.datePicker.datePickerMode = .date
        self.datePicker.addTarget(self, action:#selector( self.datePickerChanged), for: .valueChanged)
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        queryVal = df.string(from: Date())
        
    }
    
    @objc func datePickerChanged() {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        queryVal = df.string(from: self.datePicker.date)
        
    }
    @IBAction func loadDateData(_ sender: Any) {
        //        dateOutput.text = UserDefaults.standard.string(forKey: tempString)
        var count = 0
        let yaws = UserDefaults.standard.object(forKey: queryVal + "yawValue") as? [String] ?? [""]
        for yaw in yaws {
            if(count == 0){
                yawOutput = yaw + "\n"
            }
            else{
                yawOutput = yawOutput + String(count) + ": " + yaw + "\n"
                //                let tempDouble = Double(yaw) ?? -1000
            }
            count += 1
        }
        dateOutput3.text =  yawOutput
        
//        let data: [YawStruct] = [
//            .init(reading: 0, value: 3),
//            .init(reading: 1, value: 6),
//            .init(reading: 2, value: 11)
//        ]
        
        
        
        
        
//                struct LineChart: View {
//                   var body: some View {
//                        VStack{
//                            LineChartView(data: yaws, title: "First Line Chart")
        //                    ForEach(yaws, id: \.self){ yaw in
        //                        LineMark(x: "test", count, y: "Value", yaw)
//                            }
//                        }
//                    }
        //        }
        
        
        
        
        //    @IBAction func dataDatePicker(_ sender: Any) {
        ////        dateOutput = Any
        //    }
        //
        //    dateOutput.text = UserDefaults.standard.string(forKey: "keyDate")
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
