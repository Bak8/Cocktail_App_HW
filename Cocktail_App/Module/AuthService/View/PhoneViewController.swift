//
//  PhoneViewController.swift
//  Cocktail_App
//
//  Created by Atai Begaliev on 23/2/23.
//

import UIKit

class PhoneViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpConstraints()
        phoneField.delegate = self
    }
    
    func setUpSubviews() {
        view.backgroundColor = .tabBarColor
        view.addSubview(phoneField)
        }
    
    lazy var phoneField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter Your Phone Number:"
        textField.font = UIFont(name: "Avenir Next", size: 16)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .tabBarColor
        textField.isUserInteractionEnabled = true
        textField.returnKeyType = .continue
        return textField
    }()
    
    func setUpConstraints() {
        phoneField.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(300)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(270)
            maker.height.equalTo(45)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            let number = "+996\(text)"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let vc = SMSCodeViewController()
                    vc.title = "Enter Code:"
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        return true
    }
}
