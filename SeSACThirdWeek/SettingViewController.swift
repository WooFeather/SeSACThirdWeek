//
//  SettingViewController.swift
//  SeSACThirdWeek
//
//  Created by 조우현 on 1/10/25.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let sectionList = ["전체설정", "개인설정", "기타"]
    
    let rowList1 = ["공지사항", "실험실", "버전정보"]
    let rowList2 = ["개인/보안", "알림", "채팅"]
    let rowList3 = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
