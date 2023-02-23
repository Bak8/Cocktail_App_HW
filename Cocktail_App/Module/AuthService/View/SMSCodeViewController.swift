//
//  SMSCodeViewController.swift
//  Cocktail_App
//
//  Created by Atai Begaliev on 23/2/23.
//

import UIKit

class SMSCodeViewController: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpConstraints()
        codeField.delegate = self
    }
    
    func setUpSubviews() {
        view.backgroundColor = .tabBarColor
        view.addSubview(codeField)
    }
    
    lazy var codeField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter Code:"
        textField.font = UIFont(name: "Avenir Next", size: 16)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .tabBarColor
        textField.isUserInteractionEnabled = true
        textField.returnKeyType = .continue
        return textField
    }()
    
    func setUpConstraints() {
        codeField.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(300)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(270)
            maker.height.equalTo(45)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            let code = text
            AuthManager.shared.verifyCode(smsCode: code) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let vc = MainTabBarController()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true)
                    vc.title = "Enter Code:"
                }
            }
        }
        return true
    }
}
 
