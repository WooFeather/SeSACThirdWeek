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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureCollectionViewLayout()
    }
    
    func configureCollectionView() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        let id = SampleCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        
        bannerCollectionView.register(xib, forCellWithReuseIdentifier: id)
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
        DispatchQueue.main.async {
            cell.photoImageView.layer.cornerRadius = cell.photoImageView.frame.width / 2
        }
        cell.titleLabel.text = "\(indexPath.item)"
        
        return cell
    }
}
