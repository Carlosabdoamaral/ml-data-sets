//
//  ViewController.swift
//  MLDataSets
//
//  Created by Carlos Amaral on 04/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var flowerTypeLabel: UILabel!
    
    let sepalLength : [String] = ["4", "4.5", "5", "5.5", "6", "6.5", "7"]
    let sepalWidth : [String] = ["4", "4.5", "5", "5.5", "6", "6.5", "7"]
    let petalLength : [String] = ["4", "4.5", "5", "5.5", "6", "6.5", "7"]
    let petalWidth : [String] = ["4", "4.5", "5", "5.5", "6", "6.5", "7"]
    
    func triggerPrediction() {
        let rowString1 = sepalLength[pickerView.selectedRow(inComponent: 0)]
        let rowString2 = sepalWidth[pickerView.selectedRow(inComponent: 1)]
        let rowString3 = petalLength[pickerView.selectedRow(inComponent: 2)]
        let rowString4 = petalWidth[pickerView.selectedRow(inComponent: 3)]
        
        let value1 = NumberFormatter().number(from: rowString1)?.doubleValue
        let value2 = NumberFormatter().number(from: rowString2)?.doubleValue
        let value3 = NumberFormatter().number(from: rowString3)?.doubleValue
        let value4 = NumberFormatter().number(from: rowString4)?.doubleValue
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
    }
    
    
}

extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.triggerPrediction()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var selectedComponent = sepalLength
        
        if component == 1 {
            selectedComponent = sepalWidth
        } else if component == 2 {
            selectedComponent = petalLength
        } else if component == 3 {
            selectedComponent = petalWidth
        }
        
        return "\(selectedComponent[row])"
    }
}

extension ViewController : UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count : Int = 0
        
        if component == 0 {
            count  = sepalLength.count
        } else if component == 1 {
            count = sepalWidth.count
        } else if component == 2 {
            count = petalLength.count
        } else if component == 3 {
            count = petalWidth.count
        }
        
        return count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4 // sepal width / length , petal width / length
    }
}
