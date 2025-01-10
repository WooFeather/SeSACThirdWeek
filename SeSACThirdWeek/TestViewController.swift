//
//  TestViewController.swift
//  SeSACThirdWeek
//
//  Created by 조우현 on 1/10/25.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        let xib = UINib(nibName: "ChatTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "ChatTableViewCell")
    }
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        cell.profileImageView.image = UIImage(systemName: "person")
        cell.profileImageView.contentMode = .scaleAspectFill
        
        cell.nameLabel.text = "하이"
        cell.messageLabel.text = "안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트안녕하세요구르트"
        cell.messageLabel.textColor = .white
        
        return cell
    }
    
    
}
