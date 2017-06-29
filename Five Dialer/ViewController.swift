//
//  ViewController.swift
//  Five Dialer
//
//  Created by Chanchal Raj on 23/05/2017.
//  Copyright © 2017 Khatri Soft. All rights reserved.
//

import UIKit
import EPContactsPicker

class ViewController: UIViewController,EPPickerDelegate {

    @IBOutlet weak var txtPhoneNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addContact(_ sender: Any) {
        let contactPickerScene = EPContactsPicker(delegate: self, multiSelection:false, subtitleCellType: SubtitleCellValue.phoneNumber)
        let navigationController = UINavigationController(rootViewController: contactPickerScene)
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func dial(_ sender: Any) {
        txtPhoneNumber.resignFirstResponder()
        if var number = txtPhoneNumber.text{
            number = number.replacingOccurrences(of: " ", with: "")
            if number.characters.count > 0{
                let dialNumber = "800505,,2,,831021284572489#,,,,,,\(number)#"
                if let encoded = dialNumber.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed){
                    if let phoneNumber = URL.init(string: "tel:\(encoded)"){
                        if(UIApplication.shared.canOpenURL(phoneNumber)){
                            UIApplication.shared.openURL(phoneNumber)
                        }
                    }
                }
                
                
            }
        }
    }
    
    func epContactPicker(_: EPContactsPicker, didSelectContact contact: EPContact) {
        if contact.phoneNumbers.count > 0{
            var number = contact.phoneNumbers[0].phoneNumber
            number = number.replacingOccurrences(of: "+", with: "00")
            txtPhoneNumber.text = number
        }
        //picker.dismiss(animated: true, completion: nil)
    }

}

