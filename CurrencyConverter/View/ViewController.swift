//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Maor Niv on 2/17/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var switchCurrency1: UISwitch!
    @IBOutlet weak var switchCurrency2: UISwitch!
    @IBOutlet weak var switchCurrency3: UISwitch!
    @IBOutlet weak var switchCurrency4: UISwitch!
    
    var selectedCurrencies: [Bool] = [false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountText.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        guard let index = switchIndex(for: sender) 
        else {
            return
        }
        selectedCurrencies[index] = sender.isOn
    }
    
    func switchIndex(for switchControl: UISwitch) -> Int? {
        switch switchControl {
        case switchCurrency1:
            return 0
        case switchCurrency2:
            return 1
        case switchCurrency3:
            return 2
        case switchCurrency4:
            return 3
        default:
            return nil
        }
    }
    
    @IBAction func converter(_ sender: UIButton) {
        performSegue(withIdentifier: "toConverter", sender: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func getConversionRates() -> [Double] {
        return CurrencyConverter.getConversionRates()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConverter" {
            guard selectedCurrencies.count == 4 else {
                return
            }
            if let destinationVC = segue.destination as? ConversionViewController {
                destinationVC.usdAmount = Double(amountText.text ?? "0") ?? 0.0
                destinationVC.conversionRates = getConversionRates()
            }
        }
    }
    
}
    


