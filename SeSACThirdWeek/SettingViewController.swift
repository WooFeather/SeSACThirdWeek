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
// 3) 그럼에도 어떨 때 열거형을 굳이 쓸것인가? => 고유성 유일성 메모리

struct Setting {
    static let total = "star"
    static let personal = "star"
    static let others = "전체 설정"
    
    private init() { }
}

// 멤버와 값의 분리
// Int로 설정한 경우 자동으로 0부터 순서대로 들어감
enum SettingOptions: Int, CaseIterable {
    case total
    case personal
    case others
    
    var mainOption: String {
        switch self {
        case .total:
            return "전체설정"
        case .personal:
            return "개인설정"
        case .others:
            return "기타"
        }
    }
    
    var subOption: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전정보"]
        case .personal:
            return ["개인/보안", "알림", "챝;ㅇ"]
        case .others:
            return ["고객센터"]
        }
    }
}

class SettingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let sectionList = SettingOptions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(SettingOptions.total.subOption[2])    // 버전 정보
        print(SettingOptions.allCases[0].subOption[2])  // 버전 정보
        
        
        print(SettingOptions.allCases)
        print(SettingOptions.allCases[0])
        print(SettingOptions.allCases[1].rawValue)
        print(SettingOptions.allCases[2])

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
        return SettingOptions.allCases[section].subOption.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
    // 여기서 section이라는 매개변수는 numberOfSections()에서 결정되는건가?
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].mainOption
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOption[indexPath.row]
        return cell
    }
}
