//
//  ViewController.swift
//  ded
//
//  Created by Денис Каратеев on 10.01.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var button2: UIButton = {
        let but = UIButton()
        but.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        but.setTitle("Выбрать", for: .normal)
        but.setTitleColor(.white, for: .normal)
        but.translatesAutoresizingMaskIntoConstraints = false
        but.layer.cornerRadius = 5
        but.clipsToBounds = true
        return but
    }()
    var xImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "CloseIconTemplate")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var label: UILabel = {
       let label = UILabel()
        label.text = "Сделайте объявление заметнее на 7 дней"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    var reqest = RequestCell()
    var isSelected: Bool?
    var models: [List]?
    var network = RequestCell()
    var collectionview: UICollectionView!
    var cellId = "Cell"
    var modelString: String?
    var selectedIndexes = [IndexPath]()
    var titleControler: String?
    private func alert(i: String){
        let alert = UIAlertController(title: i, message: "Выбор", preferredStyle: .alert)
        let action = UIAlertAction(title: "ок", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network.parseJson { (data) in
            self.models = data.result.list
            
        }
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.frame.width - 20, height: 180)
        let size = CGRect(x: 0, y: 150, width: self.view.safeAreaLayoutGuide.layoutFrame.width - 200, height: self.view.frame.height - 200)
        collectionview = UICollectionView(frame: size, collectionViewLayout: layout)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(FreelancerCell.self, forCellWithReuseIdentifier: cellId)
//        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = .white
        label.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 100)
//        xImage.frame = CGRect(x: 5, y: 10, width: 40, height: 40)
        self.view.addSubview(xImage)
        self.view.addSubview(label)
        button2.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        viewSettings()
    }
    @objc func actionButton() {
       
        alert(i: modelString ?? "ошибка")
       
        
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
     func viewSettings() {
        
        self.view.addSubview(collectionview)

        self.view.addSubview(button2)
        xImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        xImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        xImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        xImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.topAnchor.constraint(equalTo: xImage.bottomAnchor, constant: 40).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        collectionview.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        collectionview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionview.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -220).isActive = true
        button2.topAnchor.constraint(equalTo: collectionview.bottomAnchor, constant: 10).isActive = true
        button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        button2.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -50).isActive = true
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models!.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! FreelancerCell
        if let model = models?[indexPath.row]
        {
            reqest.imageDownload(url: model.icon.the52X52) { (image) in
                cell.image52.image = image
            }
                cell.price.text = model.price
                cell.titleLabel.text = model.title
                cell.descriptionText.text = model.listDescription
                

            
            
        }
        if selectedIndexes.contains(indexPath) {
            cell.checkMark.isHidden = false
            
        } else {
            cell.checkMark.isHidden = true
            
        }

        cell.checkMark.image = UIImage(named: "checkmark")
        cell.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        if selectedIndexes.contains(indexPath) {
                if let index = selectedIndexes.index(of: indexPath) {
//                    selectedIndexes.remove(at: index)
                    
                }
            } else {
                
                selectedIndexes.removeAll()
                selectedIndexes.append(indexPath)
                
                if let model = models?[indexPath.row] {
//
                    modelString = model.title
                }
            
            }
        collectionview.reloadData()
        }
   
    
}
