//
//  SecondViewController.swift
//  testKeyBoard
//
//  Created by Tatiana Kornilova on 5/4/15.
//  Copyright (c) 2015 Tatiana Kornilova. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
//----- клавиатура скрывается (keyboard DisMiss) начало
  
// Добавляем "радиостанции" для появления клавиатуры и ее "ухода" с экрана
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(
                                                self,
                                                selector: Selector("keyboardWillShow:"),
                                                name: UIKeyboardWillShowNotification,
                                                object: nil)
        NSNotificationCenter.defaultCenter().addObserver(
                                                self,
                                                selector: Selector("keyboardWillHide:"),
                                                name:UIKeyboardWillHideNotification,
                                                object: nil)
    }
    
// Убираем все "радиостанции"
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        super.viewWillDisappear(animated)
    }
    
    var keyboardDismissTapGesture: UIGestureRecognizer?
    
// КЛАВИАТУРА ПОЯВИЛАСЬ - добавляем "распознаватель жестов"
    func keyboardWillShow(notification: NSNotification) {
        if keyboardDismissTapGesture == nil
        {
            keyboardDismissTapGesture = UITapGestureRecognizer(
                                          target: self,
                                          action: Selector("dismissKeyboard:"))
            keyboardDismissTapGesture?.cancelsTouchesInView = false
            self.view.addGestureRecognizer(keyboardDismissTapGesture!)
        }
    }
    
    func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
// КЛАВИАТУРА СКРЫЛАСЬ - убираем "распознаватель жестов"
    func keyboardWillHide(notification: NSNotification) {
        if keyboardDismissTapGesture != nil
        {
            self.view.removeGestureRecognizer(keyboardDismissTapGesture!)
            keyboardDismissTapGesture = nil
        }
    }
//----- клавиатура скрывается (keyboard DisMiss) конец

}
