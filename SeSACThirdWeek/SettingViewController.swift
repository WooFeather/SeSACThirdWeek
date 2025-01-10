//
//  SettingViewController.swift
//  SeSACThirdWeek
//
//  Created by 조우현 on 1/10/25.
//

import UIKit

// 1) 인스턴스 생성 여부: 클래스/구조체 - 인스턴스 O, 열거형 - 인스턴스 X
//  - 열거형에서는 그러면.. 인스턴스 프로퍼티 사용을 못하겠군
// 2) Setting 구조체 인스턴스 생성만 안되게 하면 열거형과 동일해졌는데?
// 3) 그럼에도 어떨 때 열거형을 굳이 쓸것인가? => 고유성 유일성

struct Setting {
    static let total = "전체 설정"
    static let personal = "전체 설정"
    static let others = "전체 설정"
    
    private init() { }
}

// 멤버와 값의 분리
enum SettingOptions: String {
    static var hello = "하잉"
    case total = "전체 설정"
    case personal = "개인 설정"
    case others = "기타"
}

class SettingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let sectionList = ["전체설정", "개인설정", "기타"]
    
    let rowList1 = ["공지사항", "실험실", "버전정보"]
    let rowList2 = ["개인/보안", "알림", "채팅"]
    let rowList3 = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 열거형의 멤버
        print(SettingOptions.personal)
        // 열거형의 rawValue
        print(SettingOptions.personal.rawValue)
        // 구조체의 타입프로퍼티
        print(Setting.personal)
        
//        let setting = Setting()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        cell.textLabel?.text = "테스트"
        return cell
    }
}
