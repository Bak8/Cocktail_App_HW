//
//  ViewController.swift
//  Cocktail_App
//
//  Created by Atai Begaliev on 20/2/23.
//

import UIKit
import SnapKit
import RxSwift
import RxRelay

class OrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var data: [String] = [
        "Test1",
        "Test2",
        "Test3"
    ]
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: .zero)
        view.backgroundColor = .backgroundColor
        self.view.addSubview(tableView)
        self.view.addSubview(cartPagesHeader)
        tableView.register(OrderTableViewCell.self, forCellReuseIdentifier: OrderTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        setUpConstraints()
    }
    
    lazy var cartPagesHeader: UILabel = {
        var cartPagesHeader = UILabel()
        cartPagesHeader.text = "Your Orders"
        cartPagesHeader.textAlignment = .center
        cartPagesHeader.font = UIFont(name: "Avenir Next", size: 35)
        cartPagesHeader.textColor = .white
        return cartPagesHeader
    }()
    
    func setUpConstraints() {
        cartPagesHeader.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(60)
            maker.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{ maker in
            maker.top.equalTo(cartPagesHeader.snp.bottom).offset(20)
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview().inset(0)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identifier, for: indexPath) as! OrderTableViewCell
        cell.label.text = data[indexPath.item]
        return cell
    }
}
    


