//
//  ViewController.swift
//  EMTest
//
//  Created by Вадим on 19.12.2022.
//

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func showData(data: WelcomeEntity)
}

class ViewController: UIViewController {
    
    var presenter: WelcomePresenterProtocol?
    
    var dataHotSales: [HomeStore] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainGray
        presenter?.viewDidLoaded()
        // ViewSelectGategory
        viewSelectCategoryAddSubview()
        viewSelectCategoryAddConstraints()
        // HotSalesView
        collectionView.delegate = self
        collectionView.dataSource = self
        hotSalesAddSubview()
        hotSalesAddConstraints()
        
    }
    
    // ViewSelectGategory
    let viewSelectCategory: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let labelSelectCategory: UILabel = {
        let label = UILabel()
        label.text = "Select Category"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("view all", for: .normal)
        button.setTitleColor(.mainOrange, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.titleLabel?.textColor = UIColor.mainOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let phoneButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 71/2
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton(sender :)), for: .touchUpInside)
        button.tintColor = .red
        return button
    }()
    
    let phoneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "iphone.homebutton")
        imageView.tintColor = UIColor.mainLightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phones"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let computerButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 71/2
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton(sender :)), for: .touchUpInside)
        button.tintColor = .orange
        return button
    }()
    
    let computerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Computer.png")
        imageView.tintColor = UIColor.mainLightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let computerLabel: UILabel = {
        let label = UILabel()
        label.text = "Computer"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let healthButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 71/2
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton(sender :)), for: .touchUpInside)
        button.tintColor = .yellow
        return button
    }()
    
    let healthImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Health.svg")
        imageView.tintColor = UIColor.mainLightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let healthLabel: UILabel = {
        let label = UILabel()
        label.text = "Health"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bookButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 71/2
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton(sender :)), for: .touchUpInside)
        button.tintColor = .green
        return button
    }()
    
    let bookImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Books.svg")
        imageView.tintColor = UIColor.mainLightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bookLabel: UILabel = {
        let label = UILabel()
        label.text = "Books"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let houseButton: UIView = {
        let button = UIButton()
        button.layer.cornerRadius = 71/2
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton(sender :)), for: .touchUpInside)
        return button
    }()
    
    let houseImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "music.note.house")
        imageView.tintColor = UIColor.mainLightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let houseLabel: UILabel = {
        let label = UILabel()
        label.text = "House"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        //scrollView.backgroundColor = .red
        return scrollView
    }()
    
    let searchTextField: UITextField = {
        let textfield = UITextField()
        let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        textfield.placeholderRect(forBounds: CGRect(x: 0, y: 40, width: 70, height: 15))
        textfield.layer.cornerRadius = 34/2
        textfield.clipsToBounds = true
        textfield.backgroundColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let imageTF: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = UIColor.mainOrange
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [phoneButton, computerButton, healthButton, bookButton, houseButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 23
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    @objc func tapButton(sender: UIButton) {
        if true {
            phoneButton.backgroundColor = .white
            phoneLabel.textColor = .black
            phoneImage.tintColor = UIColor.mainLightGray
            computerButton.backgroundColor = .white
            computerLabel.textColor = .black
            computerImage.tintColor = UIColor.mainLightGray
            healthButton.backgroundColor = .white
            healthLabel.textColor = .black
            healthImage.tintColor = UIColor.mainLightGray
            bookButton.backgroundColor = .white
            bookLabel.textColor = .black
            bookImage.tintColor = UIColor.mainLightGray
            houseButton.backgroundColor = .white
            houseLabel.textColor = .black
            houseImage.tintColor = UIColor.mainLightGray
        }
        
        switch sender.tintColor {
        case UIColor.red:
            phoneButton.backgroundColor = UIColor.mainOrange
            phoneLabel.textColor = UIColor.mainOrange
            phoneImage.tintColor = .white
        case UIColor.orange:
            computerButton.backgroundColor = UIColor.mainOrange
            computerLabel.textColor = UIColor.mainOrange
            computerImage.tintColor = .white
        case UIColor.yellow:
            healthButton.backgroundColor = UIColor.mainOrange
            healthLabel.textColor = UIColor.mainOrange
            healthImage.tintColor = .white
        case UIColor.green:
            bookButton.backgroundColor = UIColor.mainOrange
            bookLabel.textColor = UIColor.mainOrange
            bookImage.tintColor = .white
        default:
            houseButton.backgroundColor = UIColor.mainOrange
            houseLabel.textColor = UIColor.mainOrange
            houseImage.tintColor = .white
            }
    }
    
    func viewSelectCategoryAddSubview() {
        self.view.addSubview(self.viewSelectCategory)
        self.viewSelectCategory.addSubview(self.labelSelectCategory)
        self.viewSelectCategory.addSubview(self.viewAllButton)
        self.viewSelectCategory.addSubview(self.scrollView)
        self.phoneButton.addSubview(self.phoneImage)
        self.computerButton.addSubview(self.computerImage)
        self.healthButton.addSubview(self.healthImage)
        self.bookButton.addSubview(self.bookImage)
        self.houseButton.addSubview(self.houseImage)
        self.scrollView.addSubview(self.phoneLabel)
        self.scrollView.addSubview(self.computerLabel)
        self.scrollView.addSubview(self.healthLabel)
        self.scrollView.addSubview(self.bookLabel)
        self.scrollView.addSubview(self.houseLabel)
        self.viewSelectCategory.addSubview(self.searchTextField)
        self.searchTextField.addSubview(self.imageTF)
    }
    
    func viewSelectCategoryAddConstraints() {
        let stack = createStackView()
        self.scrollView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            
            self.viewSelectCategory.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.viewSelectCategory.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.viewSelectCategory.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.viewSelectCategory.heightAnchor.constraint(equalToConstant: 227),
            
            self.labelSelectCategory.topAnchor.constraint(equalTo: self.viewSelectCategory.topAnchor),
            self.labelSelectCategory.leadingAnchor.constraint(equalTo: self.viewSelectCategory.leadingAnchor, constant: 17),
            self.labelSelectCategory.heightAnchor.constraint(equalToConstant: 32),
            self.labelSelectCategory.widthAnchor.constraint(equalToConstant: 193),
            
            self.viewAllButton.centerYAnchor.constraint(equalTo: labelSelectCategory.centerYAnchor),
            self.viewAllButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -33),
            
            self.scrollView.topAnchor.constraint(equalTo: labelSelectCategory.bottomAnchor, constant: 24),
            self.scrollView.leadingAnchor.constraint(equalTo: self.viewSelectCategory.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.viewSelectCategory.trailingAnchor),
            self.scrollView.heightAnchor.constraint(equalToConstant: 93),
            
            stack.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            
            self.phoneButton.heightAnchor.constraint(equalToConstant: 71),
            self.phoneButton.widthAnchor.constraint(equalToConstant: 71),
            self.phoneButton.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 27),
            
            self.phoneImage.heightAnchor.constraint(equalToConstant: 32),
            self.phoneImage.widthAnchor.constraint(equalToConstant: 20),
            self.phoneImage.centerXAnchor.constraint(equalTo: self.phoneButton.centerXAnchor),
            self.phoneImage.centerYAnchor.constraint(equalTo: self.phoneButton.centerYAnchor),
            self.phoneLabel.centerXAnchor.constraint(equalTo: self.phoneButton.centerXAnchor),
            self.phoneLabel.topAnchor.constraint(equalTo: self.phoneButton.bottomAnchor, constant: 7),
            
            self.computerImage.heightAnchor.constraint(equalToConstant: 31),
            self.computerImage.centerXAnchor.constraint(equalTo: self.computerButton.centerXAnchor),
            self.computerImage.centerYAnchor.constraint(equalTo: self.computerButton.centerYAnchor),
            self.computerLabel.centerXAnchor.constraint(equalTo: self.computerButton.centerXAnchor),
            self.computerLabel.topAnchor.constraint(equalTo: self.computerButton.bottomAnchor, constant: 7),
            
            self.healthImage.heightAnchor.constraint(equalToConstant: 32),
            self.healthImage.centerXAnchor.constraint(equalTo: self.healthButton.centerXAnchor),
            self.healthImage.centerYAnchor.constraint(equalTo: self.healthButton.centerYAnchor),
            self.healthLabel.centerXAnchor.constraint(equalTo: self.healthButton.centerXAnchor),
            self.healthLabel.topAnchor.constraint(equalTo: self.healthButton.bottomAnchor, constant: 7),
            
            self.bookImage.heightAnchor.constraint(equalToConstant: 28.06),
            self.bookImage.centerXAnchor.constraint(equalTo: self.bookButton.centerXAnchor),
            self.bookImage.centerYAnchor.constraint(equalTo: self.bookButton.centerYAnchor),
            self.bookLabel.centerXAnchor.constraint(equalTo: self.bookButton.centerXAnchor),
            self.bookLabel.topAnchor.constraint(equalTo: self.bookButton.bottomAnchor, constant: 7),
            
            self.houseImage.heightAnchor.constraint(equalToConstant: 34),
            self.houseImage.widthAnchor.constraint(equalToConstant: 30),
            self.houseImage.centerXAnchor.constraint(equalTo: self.houseButton.centerXAnchor),
            self.houseImage.centerYAnchor.constraint(equalTo: self.houseButton.centerYAnchor),
            self.houseLabel.centerXAnchor.constraint(equalTo: self.houseButton.centerXAnchor),
            self.houseLabel.topAnchor.constraint(equalTo: self.houseButton.bottomAnchor, constant: 7),
            
            self.searchTextField.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 35),
            self.searchTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            self.searchTextField.heightAnchor.constraint(equalToConstant: 34),
            self.searchTextField.widthAnchor.constraint(equalToConstant: 300),
            
            self.imageTF.centerYAnchor.constraint(equalTo: self.searchTextField.centerYAnchor),
            self.imageTF.leadingAnchor.constraint(equalTo: self.searchTextField.leadingAnchor, constant: 20),
        ])
    }
    
    // HotSalesView
    
    let hotSalesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let labelHotSales: UILabel = {
        let label = UILabel()
        label.text = "Hot Sales"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("see more", for: .normal)
        button.setTitleColor(.mainOrange, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.titleLabel?.textColor = UIColor.mainOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HotSalesCell.self, forCellWithReuseIdentifier: HotSalesCell.identifier)
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    func hotSalesAddSubview() {
        self.view.addSubview(self.hotSalesView)
        self.hotSalesView.addSubview(self.labelHotSales)
        self.hotSalesView.addSubview(self.seeMoreButton)
        self.hotSalesView.addSubview(self.collectionView)
    }
    
    func hotSalesAddConstraints() {
        NSLayoutConstraint.activate([
            
            self.hotSalesView.topAnchor.constraint(equalTo: viewSelectCategory.bottomAnchor, constant: 24),
            self.hotSalesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.hotSalesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.hotSalesView.heightAnchor.constraint(equalToConstant: 221),
            
            self.labelHotSales.topAnchor.constraint(equalTo: self.hotSalesView.topAnchor),
            self.labelHotSales.leadingAnchor.constraint(equalTo: self.hotSalesView.leadingAnchor, constant: 17),
            self.labelHotSales.heightAnchor.constraint(equalToConstant: 32),
            self.labelHotSales.widthAnchor.constraint(equalToConstant: 111),
            
            self.seeMoreButton.centerYAnchor.constraint(equalTo: labelHotSales.centerYAnchor),
            self.seeMoreButton.trailingAnchor.constraint(equalTo: self.hotSalesView.trailingAnchor, constant: -33),
            
            self.collectionView.topAnchor.constraint(equalTo: self.labelHotSales.bottomAnchor, constant: 9),
            self.collectionView.leadingAnchor.constraint(equalTo: self.hotSalesView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.hotSalesView.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.hotSalesView.bottomAnchor),
        ])
    
    }
}

// HotSalesView
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataHotSales.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesCell.identifier, for: indexPath) as! HotSalesCell
        cell.setImage(result: dataHotSales[indexPath.row].picture)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController: WelcomeViewProtocol {
    func showData(data: WelcomeEntity) {
        
        self.dataHotSales = data.homeStore
            //print(self.dataHotSales)
            //self.dataCount = data.homeStore.count
    }
    
}

extension UIColor {
    static var mainGray = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    static var mainOrange = UIColor(red: 255/255, green: 110/255, blue: 78/255, alpha: 1)
    static var mainLightGray = UIColor(red: 179/255, green: 179/255, blue: 195/255, alpha: 1)
}


