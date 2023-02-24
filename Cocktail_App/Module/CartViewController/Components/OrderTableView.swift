//
//  CartTableView.swift
//  Cocktail_App
//
//  Created by Atai Begaliev on 24/2/23.
//

import Foundation
import SnapKit

class OrderTableViewCell: UITableViewCell {
    static let identifier: String = "test_cell_identifier"

    var label: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }

    func configure() {
        label = UILabel(frame: .zero)
        self.contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(50)
            $0.bottom.equalToSuperview().offset(-50)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

