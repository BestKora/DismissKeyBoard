//
//  ViewController.swift
//  testKeyBoard
//
// Вместо view.endEditing(true) может быть вызван метод, независящий от ссылки на view
//  UIApplication.sharedApplication().sendAction("resignFirstResponder", 
//                                                      to:nil, from:nil, forEvent:nil)

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
// Для textField2 назначение делегата выполнено на storyboard
          
    }
    
//--- Вызывается, когда пользователь нажимает кнопку Button ---
// outlets textField и textField2, UITextFieldDelegate
// и textField.delegate = ... не нужны
    
    @IBAction func actionButton() {
        view.endEditing(true)
        
    }
    
//--- Вызывается, когда пользователь кликает на view (за пределами textField)--
// outlets textField и textField2, UITextFieldDelegate
// и textField.delegate = ... не нужны
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            view.endEditing(true)
        }
        super.touchesBegan(touches , withEvent:event)
    }
    
//--- Вызывается, когда нажимается клавиша Return -----    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField2.resignFirstResponder()
        return true
    }

}

