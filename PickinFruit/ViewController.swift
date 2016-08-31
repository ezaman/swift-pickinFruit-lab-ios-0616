//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        fruitPicker.delegate = self
        fruitPicker.dataSource = self
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
       
        for i in 0..<3 {
        fruitPicker.selectRow(Int(arc4random_uniform((UInt32)(fruitsArray.count))), inComponent: i, animated: true)
        }
        
        if fruitPicker.selectedRowInComponent(0) == fruitPicker.selectedRowInComponent(1) && fruitPicker.selectedRowInComponent(1) == fruitPicker.selectedRowInComponent(2) {
            resultLabel.text = "WINNER!"
        }else {
            resultLabel.text = "TRY AGAIN"
        }
        
    }
    
   
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 3
    }
    
}



// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



