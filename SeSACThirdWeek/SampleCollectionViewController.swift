//
//  SampleCollectionViewController.swift
//  SeSACThirdWeek
//
//  Created by 조우현 on 1/9/25.
//

import UIKit

class SampleCollectionViewController: UIViewController {
    
    var list: [Int] = Array(1...100)

    @IBOutlet var bannerCollectionView: UICollectionView!
    @IBOutlet var listCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureCollectionViewLayout()
        configureListCollectionViewLayout()
        
        print(1)
        DispatchQueue.main.async {
            print(2)
        }
        print(3)
        print(4)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    func configureCollectionView() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        let id = SampleCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        bannerCollectionView.register(xib, forCellWithReuseIdentifier: id)
        
        // 다른 설정은 다 bannerCollectionView와 같게하고, listCollectionView에도 xib 적용
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        listCollectionView.register(xib, forCellWithReuseIdentifier: id)
    }
    
    func configureListCollectionViewLayout() {
        
        let sectionInset: CGFloat = 16
        let cellSpacing: CGFloat = 16
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (sectionInset * 2) - (cellSpacing * 2)
        
        // 정사각형
        layout.itemSize = CGSize(width: cellWidth / 3, height: cellWidth / 3)
        // 세로로 조금 긴 형태 등 => 수식으로 설정
//        layout.itemSize = CGSize(width: cellWidth / 3, height: (cellWidth / 3) * 1.2)
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        
        listCollectionView.collectionViewLayout = layout
    }
    
    func configureCollectionViewLayout() {
        bannerCollectionView.isPagingEnabled = true
        bannerCollectionView.backgroundColor = .black
        bannerCollectionView.collectionViewLayout = collectionViewLayout()
    }
}

extension SampleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SampleCollectionViewCell.identifier, for: indexPath) as! SampleCollectionViewCell

        cell.backgroundColor = .red
        cell.photoImageView.backgroundColor = .white
//        cell.photoImageView.layer.cornerRadius = cell.photoImageView.frame.width / 2
        // GCD
        DispatchQueue.main.async {
            cell.photoImageView.layer.cornerRadius = cell.photoImageView.frame.width / 2
        }
        cell.titleLabel.text = "\(indexPath.item)"
        
        return cell
    }
}
