
//  Extensions For String, Button, Label, Color, View

import UIKit

extension String {
    
    ///验证是否为正确手机号码
    /// - Parameter phoneNo: 手机号
    func isValidPhoneNum() -> Bool {
       let predicateStr = "^((13[0-9])|(15[^4,\\D]) |(17[0,0-9])|(18[0,0-9]))\\d{8}$"
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with: self)
    }
    
}

extension UIButton {
    class func createButton(title: String, color:UIColor) -> UIButton {
        let b = UIButton()
        b.setTitle(title, for: .normal)
        b.setTitleColor(color, for: .normal)
        return b
    }
}

extension UILabel {
    class func creatLabel(string: String, font: UIFont, textColor: UIColor) -> UILabel {
        let l: UILabel = UILabel()
        l.text = string
        l.textColor = textColor
        l.font = font
        return l
    }
}

/// Hex String -> UIColor
extension UIColor {
       convenience init(hexString: String) {
           let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
           let scanner = Scanner(string: hexString)
            
           if hexString.hasPrefix("#") {
               scanner.scanLocation = 1
           }
            
           var color: UInt32 = 0
           scanner.scanHexInt32(&color)
            
           let mask = 0x000000FF
           let r = Int(color >> 16) & mask
           let g = Int(color >> 8) & mask
           let b = Int(color) & mask
            
           let red   = CGFloat(r) / 255.0
           let green = CGFloat(g) / 255.0
           let blue  = CGFloat(b) / 255.0
            
           self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}

///延时提示
extension UIView {
    
    func customShowHUD(text:String, delay:TimeInterval){
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.label.text = text
        hud.label.font = UIFont.boldSystemFont(ofSize: 15)
        hud.mode = .text
        hud.bezelView.backgroundColor = UIColor.white
        hud.contentColor = MAIN_COLOR
        hud.bezelView.layer.cornerRadius = 0.1
        hud.bezelView.layer.borderWidth = 1.0
//        hud.bezelView.layer.borderColor = UIColor.init(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1).cgColor
        hud.bezelView.layer.borderColor = MAIN_COLOR.cgColor
        hud.hide(animated: true, afterDelay: 3.0)
        hud.margin = 15;
        hud.offset = CGPoint(x: 0, y: 100)
    }
    
}
