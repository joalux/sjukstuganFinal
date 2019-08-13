//
//  ViewController.swift
//  sjukstuganFinal
//
//  Created by joakim lundberg on 2019-08-11.
//  Copyright © 2019 joakim lundberg. All rights reserved.
//

import UIKit
import Firebase

class loginViewController: UIViewController {
    var loginRegChange = false

    
     let enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 20, g: 40, b: 100)
        button.setTitle("Enter", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        //button.addTarget(self, action: #selector(switchLoginReg), for: .touchUpInside)
        
        return button
    }()
    
     let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 20, g: 40, b: 100)
        button.setTitle("LogIn", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(switchLoginReg), for: .touchUpInside)
        
        return button
    }()
     let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(switchLoginReg), for: .touchUpInside)

        
        return button
    }()
    var logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sjukstugan")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Sjukstugan"
        title.font = UIFont.boldSystemFont(ofSize: 50.0)
        title.textColor = UIColor(r: 80, g: 101, b: 200)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    let inputContainerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let nameTextField: UITextField = {
        let txtF = UITextField()
        txtF.placeholder = "   Name"
        txtF.backgroundColor = UIColor.white
        txtF.translatesAutoresizingMaskIntoConstraints = false
        txtF.isHidden = true
        return txtF
    }()
    
    let nameBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 80, g: 101, b: 200)
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let txtF = UITextField()
        txtF.placeholder = "   E-mail"
        txtF.backgroundColor = UIColor.white
        txtF.translatesAutoresizingMaskIntoConstraints = false
        return txtF
    }()
    
    let mailBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 80, g: 101, b: 200)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 80, g: 101, b: 200)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let txtF = UITextField()
        txtF.placeholder = "   Password"
        txtF.backgroundColor = UIColor.white
        txtF.translatesAutoresizingMaskIntoConstraints = false
        txtF.isSecureTextEntry = true
        return txtF
    }()
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupViewComponents()
        setUpinputView()
    }
    
    @objc func switchLoginReg(sender: UIButton!){
        if loginRegChange == true {
            logInButton.backgroundColor = UIColor(r: 20, g: 40, b: 100)
            registerButton.backgroundColor = UIColor(r: 80, g: 101, b: 161)
            nameTextField.isHidden = true
            nameBackgroundView.isHidden = true
            loginRegChange = false
        }
        else if loginRegChange == false {
            registerButton.backgroundColor = UIColor(r: 20, g: 40, b: 100)
            logInButton.backgroundColor = UIColor(r: 80, g: 101, b: 161)
            nameTextField.isHidden = false
            nameBackgroundView.isHidden = false
            loginRegChange = true
            
        }
    }
    
    func setupViewComponents(){
        view.addSubview(logoView)
        logoView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30).isActive = true
        
        view.addSubview(enterButton)
        enterButton.widthAnchor.constraint(equalToConstant: 190).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        enterButton.layer.cornerRadius = 20
        enterButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 350).isActive = true
        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(logInButton)
        logInButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logInButton.layer.cornerRadius = 20
        logInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 270).isActive = true
        logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -55).isActive = true
        
        view.addSubview(registerButton)
        registerButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.layer.cornerRadius = 20
        registerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 270).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 55).isActive = true
        
        view.addSubview(inputContainerView)
        
    }
    
    func setUpinputView(){
       
        view.addSubview(nameBackgroundView)
        nameBackgroundView.widthAnchor.constraint(equalToConstant: 255).isActive = true
        nameBackgroundView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        nameBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        nameBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(mailBackgroundView)
        mailBackgroundView.widthAnchor.constraint(equalToConstant: 255).isActive = true
        mailBackgroundView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        mailBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        mailBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(passwordBackgroundView)
        passwordBackgroundView.widthAnchor.constraint(equalToConstant: 255).isActive = true
        passwordBackgroundView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        passwordBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150).isActive = true
        passwordBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

