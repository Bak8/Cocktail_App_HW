//
//  ViewController.swift
//  Cocktail_App
//
//  Created by Atai Begaliev on 22/2/23.
//

import Firebase
import FirebaseAuth
import Foundation

//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .tabBarColor
//        setUpSubviews()
//        setUpConstraints()
//        authByPhoneNumber()
//    }
//
//    lazy var passCodeTextField: UITextField = {
//        var textField = UITextField()
//        textField.placeholder = "Enter Your Code:"
//        textField.font = UIFont(name: "Avenir Next", size: 16)
//        textField.borderStyle = .roundedRect
//        textField.backgroundColor = .tabBarColor
//        textField.isUserInteractionEnabled = true
//        return textField
//    }()
//
//    lazy var loginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = .tabBarItemLight
//        button.setTitle("Log In", for: .normal)
//        button.layer.cornerRadius = 6
//        button.setTitleColor(.tabBarColor, for: .normal)
//        button.addTarget(self, action: #selector(openApp), for: .touchUpInside)
//        return button
//    }()
//
//    @objc func openApp() {
//        verifyNumberAuthTapped()
//        navigationController?.pushViewController(MainTabBarController(), animated: true)
//    }
//
//    func setUpConstraints() {
//        passCodeTextField.snp.makeConstraints{ maker in
//            maker.top.equalToSuperview().offset(300)
//            maker.centerX.equalToSuperview()
//            maker.width.equalTo(270)
//            maker.height.equalTo(45)
//        }
//        loginButton.snp.makeConstraints{ maker in
//            maker.top.equalTo(passCodeTextField.snp.bottom).offset(100)
//            maker.centerX.equalToSuperview()
//            maker.width.equalTo(310)
//            maker.height.equalTo(60)
//        }
//    }
//
//    func setUpSubviews() {
//        view.addSubview(passCodeTextField)
//
//    }
//
//    private let phoneNumber = "+996550660088"
//    private var verificationId: String?
//
//    private func authByPhoneNumber() {
//        PhoneAuthProvider.provider()
//          .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
//              if let error = error {
//                print(error.localizedDescription)
//                return
//              }
//              self.verificationId = verificationID
//          }
//    }
//
//    private func verifyNumberAuthTapped() {
//        guard let codeFilled = passCodeTextField.text,
//        let vID = verificationId
//        else { return }
//
//
//
//        let credential = PhoneAuthProvider.provider().credential(
//          withVerificationID: vID,
//          verificationCode: codeFilled
//        )
//    }
////    self.verifyNumberAuth(with: verificationID)
//}

class AuthManager{
    static let shared = AuthManager()
    private let auth = Auth.auth()
    private var verificationId: String?

    
    public func startAuth(phoneNumber: String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(
            phoneNumber, uiDelegate: nil) { [weak self] verificationId, error in
                guard let verificationId = verificationId, error == nil else {
                    return
                }
                self?.verificationId = verificationId
                completion(true)
            }
    }
    
    public func verifyCode(smsCode: String, completion: @escaping (Bool) -> Void) {
        guard let verificationId = verificationId else {
            completion(false)
            return
        }
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationId,
            verificationCode: smsCode
        )
        auth.signIn(with: credential)  { result, error in
            guard result != nil , error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
}

 
