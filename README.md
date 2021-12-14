# Calculator
### Calculator is an iOS application that does the job of a normal calculator.

###  ✨Application Features
- It is a simple iOS app built by Swift, which can perform simple mathematical equations involving adding, subtracting multiplying and dividing.
- The app takes in account operation priorites when performing calculation.
- More to be done.

---
# Code Samples
```swift
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
```

--
Demos
---

 <img src= "https://user-images.githubusercontent.com/95880640/145994845-29c351c8-2563-4914-9fb0-3fa8ce991dba.png" height="500"> 

---

https://user-images.githubusercontent.com/95880640/145994862-d2605a15-0ee9-44a8-b670-bfff6c5725b3.mp4


     
     
     
     
     
     
