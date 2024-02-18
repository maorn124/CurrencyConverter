//
//  ConversionViewController.swift
//  CurrencyConverter
//
//  Created by Maor Niv on 2/17/24.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var currency1Label: UILabel!
    @IBOutlet weak var currency2Label: UILabel!
    @IBOutlet weak var currency3Label: UILabel!
    @IBOutlet weak var currency4Label: UILabel!
    
    var usdAmount: Double = 0.0
    var conversionRates: [Double] = []
    var selectedCurrencies: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usdLabel.text = "\(usdAmount) USD"
        currency1Label.text = "\(convertCurrency(atIndex: 0)) \(currencySymbol(atIndex: 0))"
        currency2Label.text = "\(convertCurrency(atIndex: 1)) \(currencySymbol(atIndex: 1))"
        currency3Label.text = "\(convertCurrency(atIndex: 2)) \(currencySymbol(atIndex: 2))"
        currency4Label.text = "\(convertCurrency(atIndex: 3)) \(currencySymbol(atIndex: 3))"
    }
    
    func convertCurrency(atIndex index: Int) -> Double {
        return usdAmount * conversionRates[index]
    }
    
    func currencySymbol(atIndex index: Int) -> String {
        return CurrencyConverter.currencySymbol(forIndex: index)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
