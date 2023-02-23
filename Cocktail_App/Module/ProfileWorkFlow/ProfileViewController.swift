//
//  ViewController.swift
//  Cocktail_App
//
//  Created by Atai Begaliev on 21/2/23.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        nameField.delegate = self
        dateOfBirthInformation.delegate = self
        addressInformation.delegate = self
        view.backgroundColor = .tabBarColor
    }
    
    
    func registerUser() {
        guard let name = nameField.text,
              let phone = dateOfBirthInformation.text,
              let address = addressInformation.text,
                !name.isEmpty && !phone.isEmpty && !address.isEmpty else { return }
        
        let newUser = User(name: name, phone: phone, address: address)
        sendRegisterRequest(user: newUser)
    }
    
    private func sendRegisterRequest(user: User) {
        do {
            let user = UserDefaultsService.shared.saveUser(user: user)
        } catch {
            print ("SOMETHING WRONG WITH USER DEFAULTS")
        }
        
    }
    
    lazy var loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.backgroundColor = .tabBarItemLight
            button.setTitle("Log In", for: .normal)
            button.layer.cornerRadius = 6
            button.setTitleColor(.tabBarColor, for: .normal)
            button.addTarget(self, action: #selector(register), for: .touchUpInside)
            return button
        }()
    
        @objc func register() {
            registerUser()
        }

    lazy var profileTitle: UILabel = {
        var title = UILabel()
        title.text = "Profile"
        title.font = UIFont(name: "Avenir Heavy", size: 33)
        return title
    }()
    
    lazy var borderView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(cgColor: CGColor(
                                           red: 216/265,
                                         green: 216/265,
                                          blue: 225/265,
                                         alpha: 0.85))
        return view
    }()
    
    
    lazy var profileImage: UIImageView = {
        var image = UIImageView()
        image.layer.cornerRadius = image.frame.width/2
        image.image = UIImage(systemName: "person")
        image.tintColor = UIColor(cgColor: CGColor(
                                      red: 216/265,
                                    green: 216/265,
                                     blue: 225/265,
                                    alpha: 0.85))
        return image
    }()
    
    lazy var usernameLabel: UILabel = {
        var usernameLabel = UILabel()
        usernameLabel.text = UserDefaultsService.shared.name
        usernameLabel.font = UIFont(name: "Avenir", size: 33)
        usernameLabel.numberOfLines = 0
        return usernameLabel
    }()
    
    lazy var phoneLabel: UILabel = {
        var phoneLabel = UILabel()
        phoneLabel.text = UserDefaultsService.shared.phone
        phoneLabel.font = UIFont(name: "Avenir", size: 33)
        phoneLabel.numberOfLines = 0
        return phoneLabel
    }()
    
    lazy var adressLabel: UILabel = {
        var adressLabel = UILabel()
        adressLabel.text = UserDefaultsService.shared.address
        adressLabel.font = UIFont(name: "Avenir", size: 33)
        adressLabel.numberOfLines = 0
        return adressLabel
    }()
    
    lazy var nameField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter Your Name:"
        textField.font = UIFont(name: "Avenir Next", size: 16)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .tabBarColor
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    lazy var dateOfBirthInformation: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Date Of Birth:"
        textField.font = UIFont(name: "Avenir Next", size: 16)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .tabBarColor
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    lazy var addressInformation: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Addres:"
        textField.font = UIFont(name: "Avenir Next", size: 16)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .tabBarColor
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    private func setUpSubviews() {
        view.addSubview(borderView)
        view.addSubview(profileTitle)
        view.addSubview(profileImage)
        view.addSubview(usernameLabel)
        view.addSubview(phoneLabel)
        view.addSubview(adressLabel)
        view.addSubview(nameField)
        view.addSubview(dateOfBirthInformation)
        view.addSubview(addressInformation)
        view.addSubview(loginButton)
    }
    
    private func setUpConstraints() {
        borderView.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(150)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(320)
            maker.height.equalTo(5)
        }
        
        profileTitle.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(100)
            maker.left.equalToSuperview().offset(30)
            maker.width.equalTo(100)
            maker.height.equalTo(40)
        }
        
        profileImage.snp.makeConstraints{ maker in
            maker.top.equalTo(borderView.snp.bottom).offset(50)
            maker.left.equalToSuperview().offset(30)
            maker.width.height.equalTo(188)
        }
    
        usernameLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(borderView.snp.bottom).offset(30)
            maker.left.equalTo(profileImage.snp.right).offset(15)
            maker.width.equalTo(115)
            maker.height.equalTo(40)
        }
        
        phoneLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(usernameLabel.snp.bottom).offset(10)
            maker.left.equalTo(profileImage.snp.right).offset(15)
            maker.width.equalTo(115)
            maker.height.equalTo(40)
        }

        adressLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(phoneLabel.snp.bottom).offset(10)
            maker.left.equalTo(profileImage.snp.right).offset(15)
            maker.width.equalTo(115)
            maker.height.equalTo(40)
        }
        
        
        nameField.snp.makeConstraints{ maker in
            maker.top.equalTo(profileImage.snp.bottom).offset(65)
            maker.left.equalToSuperview().offset(30)
            maker.width.equalTo(310)
            maker.height.equalTo(45)
        }
        
        dateOfBirthInformation.snp.makeConstraints{ maker in
            maker.top.equalTo(nameField.snp.bottom).offset(25)
            maker.left.equalToSuperview().offset(30)
            maker.width.equalTo(310)
            maker.height.equalTo(45)
        }
        
        addressInformation.snp.makeConstraints{ maker in
            maker.top.equalTo(dateOfBirthInformation.snp.bottom).offset(25)
            maker.left.equalToSuperview().offset(30)
            maker.width.equalTo(310)
            maker.height.equalTo(45)
        }
        loginButton.snp.makeConstraints{ maker in
            maker.top.equalTo(addressInformation.snp.bottom).offset(20)
            maker.left.equalToSuperview().offset(30)
            maker.width.equalTo(310)
            maker.height.equalTo(60)
        }
    }
    
    private func setUpUI() {
        setUpSubviews()
        setUpConstraints()
    }
}
