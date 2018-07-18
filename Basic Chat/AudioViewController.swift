//
//  AudioViewController.swift
//  Basic Chat
//
//  Created by Andreas Thirsbro on 09/07/2018.
//  Copyright © 2018 Vanguard Logic LLC. All rights reserved.
//

import UIKit
import CoreBluetooth

class AudioViewController: UIViewController, CBPeripheralManagerDelegate, UITextViewDelegate, UITextFieldDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        //
    }
    

    @IBOutlet weak var bandOne: UISlider!
    @IBOutlet weak var bandTwo: UISlider!
    @IBOutlet weak var bandThree: UISlider!
    @IBOutlet weak var bandFour: UISlider!
    @IBOutlet weak var bandFive: UISlider!
    @IBOutlet weak var bandSix: UISlider!
    @IBOutlet weak var bandSeven: UISlider!
    @IBOutlet weak var bandEight: UISlider!
    
    var peripheralManager: CBPeripheralManager?
    var peripheral: CBPeripheral!
    
    
    var bandOneValue: Int!
    var bandTwoValue: Int!
    var bandThreeValue: Int!
    var bandFourValue: Int!
    var bandFiveValue: Int!
    var bandSixValue: Int!
    var bandSevenValue: Int!
    var bandEightValue: Int!
    
    @IBOutlet weak var bandOneText: UITextField!
    @IBOutlet weak var bandTwoText: UITextField!
    @IBOutlet weak var bandThreeText: UITextField!
    @IBOutlet weak var bandFourText: UITextField!
    @IBOutlet weak var bandFiveText: UITextField!
    @IBOutlet weak var bandSixText: UITextField!
    @IBOutlet weak var bandSevenText: UITextField!
    @IBOutlet weak var bandEightText: UITextField!
    
    @IBAction func bandOneChanged(_ sender: UISlider) {
        self.bandOneText.text = "Band 1: \(Int(sender.value))"
        bandOneValue = Int(sender.value)
        //var uartModuleViewController = UartModuleViewController();
        //uartModuleViewController.writeValue(data: "PRTTRSH0 \(currentValue)")
    }
    @IBAction func bandTwoChanged(_ sender: UISlider) {
        self.bandTwoText.text = "Band 2: \(Int(sender.value))"
        bandTwoValue = Int(sender.value)
    }
    @IBAction func bandThreeChanged(_ sender: UISlider) {
        self.bandThreeText.text = "Band 3: \(Int(sender.value))"
        bandThreeValue = Int(sender.value)
    }
    @IBAction func bandFourChanged(_ sender: UISlider) {
        self.bandFourText.text = "Band 4: \(Int(sender.value))"
        bandFourValue = Int(sender.value)
    }
    @IBAction func bandFiveChanged(_ sender: UISlider) {
        self.bandFiveText.text = "Band 5: \(Int(sender.value))"
        bandFiveValue = Int(sender.value)
    }
    @IBAction func bandSixValue(_ sender: UISlider) {
        self.bandSixText.text = "Band 6: \(Int(sender.value))"
        bandSixValue = Int(sender.value)
    }
    @IBAction func bandSevenChanged(_ sender: UISlider) {
        self.bandSevenText.text = "Band 7: \(Int(sender.value))"
        bandSevenValue = Int(sender.value)
    }
    @IBAction func bandEightChanged(_ sender: UISlider) {
        self.bandEightText.text = "Band 8: \(Int(sender.value))"
        bandEightValue = Int(sender.value)
    }
    @IBAction func saveButton(_ sender: Any) {
       writeValue(data: "PRTTRSH0 \(bandOneValue!)\n")
        writeValue(data: "PRTTRSH1 \(bandTwoValue!)\n")
        writeValue(data: "PRTTRSH2 \(bandThreeValue!)\n")
        writeValue(data: "PRTTRSH3 \(bandFourValue!)\n")
        writeValue(data: "PRTTRSH4 \(bandFiveValue!)\n")
        writeValue(data: "PRTTRSH5 \(bandSixValue!)\n")
        writeValue(data: "PRTTRSH6 \(bandSevenValue!)\n")
        writeValue(data: "PRTTRSH7 \(bandEightValue!)\n")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        
        bandOneValue = 750
        bandTwoValue = 750
        bandThreeValue = 750
        bandFourValue = 750
        bandFiveValue = 750
        bandSixValue = 750
        bandSevenValue = 750
        bandEightValue = 750
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func writeValue(data: String){
        print("Tx \(data)")
        let valueString = (data as NSString).data(using: String.Encoding.utf8.rawValue)
        //change the "data" to valueString
        if let blePeripheral = blePeripheral{
            if let txCharacteristic = txCharacteristic {
                blePeripheral.writeValue(valueString!, for: txCharacteristic, type: CBCharacteristicWriteType.withResponse)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
