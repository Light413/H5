//
//  LoginVCSwift.swift
//  MCS
//
//  Created by gener on 16/11/4.
//  Copyright © 2016年 Light. All rights reserved.
//

import UIKit
import Alamofire

 class LoginVCSwift:UIViewController,UITextFieldDelegate {
    
    var bgview:UIView!
    var username:UITextField!
    var userpwd:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSubviews()
        
        var _offset:CGFloat!;
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification:Notification)in
            let dic = NSDictionary(dictionary: notification.userInfo!)
            let keyboard:CGRect! = (dic["UIKeyboardFrameEndUserInfoKey"]! as AnyObject).cgRectValue

           if (keyboard.intersects((self.bgview?.frame)!))
           {
            let _k = keyboard.minY
            let _b = self.bgview.frame.maxY
             _offset = _b - _k + 20
            
            UIView.animate(withDuration: 0.25, animations: { 
                self.bgview.frame = CGRect.init(x: self.bgview.frame.minX, y: self.bgview.frame.minY - _offset, width: self.bgview.frame.width, height: self.bgview.frame.height)
            })
            }
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification:Notification)in
            UIView.animate(withDuration: 0.25, animations: {
                    self.bgview.frame = CGRect.init(x: self.bgview.frame.minX, y: self.bgview.frame.minY + _offset, width: self.bgview.frame.width, height: self.bgview.frame.height)
                }, completion: { (_b:Bool) in
                   _offset = 0
            })
        }
        
    }

    func initSubviews() {
        let bgimg = UIImageView.init(image: UIImage.init(imageLiteralResourceName: "login_bg"))
        bgimg.frame = self.view.bounds
        bgimg.isUserInteractionEnabled = true;
        self.view.addSubview(bgimg)
        
        self.view.backgroundColor = UIColor.white
        let tap:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapAction(tap:)))
        bgimg .addGestureRecognizer(tap)
        
        bgview = UIView.init(frame: CGRect.init(x: (self.view.bounds.width - 400)/2.0, y: (self.view.bounds.height - 280)/2.0 - 50, width: 400, height: 280));
        bgview.backgroundColor = UIColor.init(colorLiteralRed: 0.965, green: 0.969, blue: 0.973, alpha: 1)
        bgimg.addSubview(bgview)
        
        let titleLab = UILabel.init(frame: CGRect.init(x: 0, y: 20, width: bgview.frame.width, height: 30))
        titleLab.text = "维修控制系统"
        titleLab.font = UIFont.boldSystemFont(ofSize: 30)
        titleLab.textAlignment = .center
        bgview.addSubview(titleLab)
        
        username = UITextField.init(frame: CGRect.init(x:0, y:titleLab.frame.maxY + 30, width:bgview.frame.width, height:40))
        username.placeholder = "input user name"
        username.borderStyle = .roundedRect;
        username.returnKeyType = .next
        username.keyboardType = .asciiCapable
        username.clearButtonMode = .whileEditing
        username.delegate = self;
        bgview .addSubview(username)
        let v0 = UIView.init(frame: CGRect.init(x: 0, y: 5, width: 30, height: 30))
        let nameleftv = UIImageView.init(image: UIImage.init(imageLiteralResourceName: "user_icon"))
        nameleftv.frame = CGRect.init(x: 10, y: (v0.frame.height - 16)/2.0, width: 16, height: 16)
        v0.addSubview(nameleftv)
        username.leftView = v0;
        username.leftViewMode = .always;
        
        userpwd = UITextField.init(frame: CGRect.init(x:0, y:username.frame.maxY + 30, width:bgview.frame.width, height:40))
        userpwd.placeholder = "input user password"
        userpwd.borderStyle = .roundedRect;
        userpwd.returnKeyType = .done
        userpwd.isSecureTextEntry = true
        userpwd.clearButtonMode = .whileEditing
        userpwd.delegate = self;
        bgview .addSubview(userpwd)
        let v1 = UIView.init(frame: CGRect.init(x: 0, y: 5, width: 30, height: 30))
        let pwdleftv = UIImageView.init(image: UIImage.init(imageLiteralResourceName: "user_pwd"))
        pwdleftv.frame = CGRect.init(x: 10, y: (v1.frame.height - 16)/2.0, width: 16, height: 16)
        v1.addSubview(pwdleftv)
        userpwd.leftView = v1;
        userpwd.leftViewMode = .always;
        
        var button:UIButton
        button = UIButton(type:.custom);
        button.tintColor = UIColor.red;
        button.frame = CGRect(x:0, y:bgview.frame.height-44, width:bgview.frame.width, height:44)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action:#selector(loginButtonAction(sender:)), for: .touchUpInside);
        button.backgroundColor = UIColor.init(colorLiteralRed: 0.318, green: 0.243, blue: 0.533, alpha: 1);
        button.setTitle("Login", for: .normal)
        bgview.addSubview(button);
        
        username.text = "userswift"
        userpwd.text = "123456"
    }
    
    //MARK: -
    func tapAction(tap:UITapGestureRecognizer) {
        if username.isFirstResponder{
            username.resignFirstResponder()
        }
        if userpwd.isFirstResponder {
            userpwd.resignFirstResponder()
        }
    }
    
    
    func loginButtonAction(sender:UIButton) -> Void {
        MBHUD.showStatue(in: self.view, withMsg: "Logining...")
        let parameters: Parameters = [
            "foo": [1,2,3],
            "bar": [
                "baz": "qux"
            ]
        ]
        Alamofire.request("http://localhost/testpost.php",method:.post,parameters: ["name":"111"]).responseJSON { (response) in
          
            print(response)
            
            switch response.result {
                case .success:
                    print("###response successful")
                    print(response.result.value);
                
                case .failure(let error):
                    print(error)
            }
            

           MBHUD.dismiss()
            
        }
    
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.8) {
//            MBHUD.dismiss()
//            self.dismiss(animated: true, completion: nil)
//        }
        
        
    }
    

    // MARK: -
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == username {
            userpwd.becomeFirstResponder()
        }
        else {
            userpwd.resignFirstResponder()
        }
        return true;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}







