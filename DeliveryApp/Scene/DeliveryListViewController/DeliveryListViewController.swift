//
//  ViewController.swift
//  TestLalamove
//
//  Created by Stella Patricia on 18/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift

class DeliveryListViewController: UIViewController, UINavigationBarDelegate {

    var deliveryViewModel = DeliveryViewModel()
    var tableView = UITableView()
    var deliveryData: [DeliveryModel] = []
    var indexOfPageToRequest = 1

    private let disposeBag = DisposeBag()
    
    let spinner = UIActivityIndicatorView(style: .gray)

    let containerBottomView = CommonUIView()
    let buttonRetry = CommonUIButton()
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = Constants.BASIC_BG_COLOR
        deliveryViewModel.delegate = self
        
        indexOfPageToRequest = 1
        
        buttonRetry.setImage(UIImage(named: Constants.ICON_RETRY), for: .normal)
        buttonRetry.addTarget(self, action: #selector(tappedRetryBtn), for: .touchUpInside)
        buttonRetry.isHidden = true
        
        setupBottomView()
        setupTableView()
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        setupCustomNavigationView()
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCustomNavigationView() {
        navigationItem.title = "My Deliveries"
        
        self.navigationController?.navigationBar.barTintColor = Constants.BASIC_COLOR_PASTEL_ORANGE
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupTableView() {
        let screenSize: CGRect = UIScreen.main.bounds

        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let navigationBarHeight = self.navigationController?.navigationBar.bounds.height ?? 0
        let statusBarHeight = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        tableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight-navigationBarHeight-statusBarHeight-30)
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = Constants.BASIC_BG_COLOR
        tableView.setContentOffset(.zero, animated: true)

        tableView.register(DeliveryListTableViewCell.self, forCellReuseIdentifier: "cell")

        self.view.addSubview(tableView)
        
        self.view.addSubview(buttonRetry)
        
        //Constraint for retry button
        buttonRetry.widthAnchor.constraint(equalToConstant: 50).isActive = true
        buttonRetry.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonRetry.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        buttonRetry.topAnchor.constraint(equalTo: self.view.topAnchor, constant: tableView.frame.height/2-25).isActive = true

        fetchDeliveryData()
    }
    
    func setupBottomView()  {
        self.view.addSubview(containerBottomView)
        
        //Constraint for bottom view
        containerBottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        containerBottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerBottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        containerBottomView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc func tappedRetryBtn() {
        buttonRetry.isHidden = true
        self.tableView.dataSource = nil
        fetchDeliveryData()
    }
    
    func showLoadingIndicator() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func fetchDeliveryData() {
        buttonRetry.isHidden = true
        showLoadingIndicator()
        
        deliveryViewModel.getDeliveries(offset: indexOfPageToRequest)
        
        deliveryViewModel.deliveries.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: DeliveryListTableViewCell.self)){row, delivery, cell in
        
            cell.containerViewLike.isHidden = false
            cell.imageViewPhoto.kf.setImage(with: URL(string: delivery.goodsPicture ?? ""))
            if cell.imageViewPhoto.image == nil {
                cell.imageViewPhoto.image = UIImage(named: Constants.ICON_NO_IMAGE)
            }
            cell.labelFromContent.text = delivery.route?.start
            cell.labelToContent.text = delivery.route?.end
                
            let strDeliveryFee = Double((delivery.deliveryFee ?? "").replacingOccurrences(of: "$", with: "")) ?? 0.0
            let strSurcharge = Double((delivery.surcharge ?? "").replacingOccurrences(of: "$", with: "")) ?? 0.0
            let totalFee = strDeliveryFee+strSurcharge
                
            cell.labelPrice.text = String(format: "$%.2f", totalFee)
              
            if (UserDefaults.standard.stringArray(forKey: delivery.id ?? "-") == nil) {
                cell.buttonLike.setImage(UIImage(named: Constants.ICON_UNLIKE), for: .normal)
            } else {
                cell.buttonLike.setImage(UIImage(named: Constants.ICON_LIKE), for: .normal)
            }
        }.disposed(by: disposeBag)
        
        deliveryViewModel.deliveries.bind { data in
            self.deliveryData = data
        }
    }
}

extension DeliveryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DeliveryDetailViewController()
        detailVC.data = deliveryData[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !UserDefaults.standard.bool(forKey: "source"){
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            spinner.isHidden = false
            self.tableView.tableFooterView = spinner
            self.tableView.tableFooterView?.isHidden = false
            
            let lastItem = deliveryData.count - 1
            if indexPath.row == lastItem {
                indexOfPageToRequest += 1
                deliveryViewModel.getDeliveries(offset: indexOfPageToRequest)

            }
        }
    }
}

extension DeliveryListViewController: DeliveryViewModelProtocol {
    func showRetryBtn() {
        DispatchQueue.main.sync {
            if indexOfPageToRequest == 1 {
                buttonRetry.isHidden = false
            }
            spinner.isHidden = true
            dismiss(animated: false, completion: nil)
        }
    }
    
    func hideRetryBtn() {
        DispatchQueue.main.sync {
            buttonRetry.isHidden = true
            spinner.isHidden = true
            dismiss(animated: false, completion: nil)
        }
    }
}
