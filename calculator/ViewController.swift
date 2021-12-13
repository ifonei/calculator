import UIKit

class ViewController: UIViewController {
    public var rslt = "1.0*"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        result.isEnabled = false
        result.text = "0"
        rslt = "1.0*"
    }
    
    @IBOutlet weak var result: UITextField!
    
    @IBAction func nineClicked(_ sender: Any) {
        numberClicked("9")
    }
    
    @IBAction func eightClicked(_ sender: Any) {
        numberClicked("8")
    }
    
    @IBAction func sevenClicked(_ sender: Any) {
        numberClicked("7")
    }
    
    @IBAction func sixClicked(_ sender: Any) {
        numberClicked("6")
    }
    
    @IBAction func fiveClicked(_ sender: Any) {
        numberClicked("5")
    }
    
    @IBAction func fourClicked(_ sender: Any) {
        numberClicked("4")
    }
    
    @IBAction func threeClicked(_ sender: Any) {
        numberClicked("3")
    }
    
    @IBAction func twoClicked(_ sender: Any) {
        numberClicked("2")
    }
    
    @IBAction func oneClicked(_ sender: Any) {
        numberClicked("1")
    }
    
    @IBAction func zeroClicked(_ sender: Any) {
        numberClicked("0")
    }
        
    @IBAction func pointClicked(_ sender: Any) {
        if rslt.hasSuffix("+") || rslt.hasSuffix("-") || rslt.hasSuffix("*") || rslt.hasSuffix("/"){
            result.text = "0."
            rslt += "."
        }else{
            result.text! += "."
            rslt += "."
        }
    }
    
    @IBAction func divisionClicked(_ sender: Any) {
        if result.text != "" {
            rslt += "/"
        }
    }
    
    @IBAction func multplyClicked(_ sender: Any) {
        if result.text != "" {
            rslt += "*"
        }
    }
    
    @IBAction func subClicked(_ sender: Any) {
        if result.text == "0" {
            
        }else if !rslt.hasSuffix("+") || !rslt.hasSuffix("-") || !rslt.hasSuffix("*") || !rslt.hasSuffix("/"){
           let expression = NSExpression(format:rslt)
           if let total = expression.expressionValue(with: nil, context: nil) as? Double {
               result.text = IntFormat(total: total)
                rslt += "-"
           }
        }
    }
    
    @IBAction func addClicked(_ sender: Any) {
        if result.text == "0" {
            
        }else if rslt.hasSuffix("+"){
                let lastOperator = String(rslt.last!)
                rslt.removeLast()
                rslt.removeLast()
                rslt += lastOperator
            print("oooooooooooo")
            
        }else if !rslt.hasSuffix("+") || !rslt.hasSuffix("-") || !rslt.hasSuffix("*") || !rslt.hasSuffix("/"){
           let expression = NSExpression(format:rslt)
           if let total = expression.expressionValue(with: nil, context: nil) as? Double {
               result.text = IntFormat(total: total)
                rslt += "+"
           }
        }
    }
    
    @IBAction func equalClicked(_ sender: Any) {
        let expression = NSExpression(format: rslt)
        print(expression)
        if let total = expression.expressionValue(with: nil, context: nil) as? Double{
            result.text = IntFormat(total: total)
        }
    }
    
    @IBAction func acClicked(_ sender: Any) {
        result.text = "0"
        rslt = "1.0*"
    }
    
    func IntFormat(total : Double) -> String {
        if total.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f", total)
        }else{
            return String(total)
        }
    }
    
    func numberClicked(_ numberPressed: String){
        if result.text?.count == 1 && result.text == "0" {
            result.text = numberPressed
            rslt += numberPressed
        }else if rslt.hasSuffix("+") || rslt.hasSuffix("-") || rslt.hasSuffix("*") || rslt.hasSuffix("/"){
            result.text = numberPressed
            rslt += numberPressed
        }else{
            result.text! += numberPressed
            rslt += numberPressed
        }
    }

}
