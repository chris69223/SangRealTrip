//
//  ViewController.swift
//  SangRealTrip
//
//  Created by 유저 on 2021/01/08.
import KakaoSDKAuth
import KakaoSDKUser
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var comeOnLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kakaoBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    var loginName: String? = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameLabel.isHidden = true
        startBtn.isHidden = true
    }

    @IBAction func onKakoaLoginBtn(_ sender: Any) {
    
    // 카카오톡 설치 여부 확인
    //시뮬레이터에 카톡이 안깔려 있어서 밑에 코드 사용
        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
        if let error = error {
            print(error)
        }
        else {
            print("loginWithKakaoAccount() success.")
        
        //do something
            _ = oauthToken
            let accessToken = oauthToken?.accessToken
            
            self.setUserInfo()
            }
      }
    }
    
    func setUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                  print(error)
              }else {
                
                print("me() success.")
                  //do something
                _ = user
                self.loginName = user?.kakaoAccount?.profile?.nickname
                if self.loginName == "고영상"{
                    self.kakaoBtn.isHidden = true
                    self.comeOnLabel.isHidden = true
                    self.nameLabel.isHidden = false
                    self.startBtn.isHidden = false
                    self.nameLabel.text = "고영상님 반가워요!"
                    
                    //값을 전달해줘야하고 다음 그걸로 가야함
                }
                print(self.loginName!)
                //여기서 로그인 이름이 홈 화면에 전달되어야함
                //전달 방법 3가지 1. 프로토콜 2. 세그먼트 3. 직접
                if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                    let data = try? Data(contentsOf: url) {
//                      self.profileImageView.image = UIImage(data: data)
                  }
              }
          }
        }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destination = segue.destination
//
//        guard let nextVC = destination as? NextVC else{
//            return
//        }
//        nextVC.
//    }
    }
