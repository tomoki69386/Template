//
//  UITableView+Extension.swift
//  Template
//
//  Created by 築山朋紀 on 2019/03/23.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Registers a class for use in creating new table cells.
    func register<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(of cellClass: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? Cell else {
            assertionFailure("\(Cell.self) が登録されていません")
            register(cellClass.self)
            return cellClass.init(style: .default, reuseIdentifier: cellClass.reuseIdentifier)
        }
        return cell
    }
    
    /// Registers a class for use in creating new table header or footer views.
    func register<HeaderFooter: UITableViewHeaderFooterView>(_ headerFooterClass: HeaderFooter.Type) {
        register(headerFooterClass, forHeaderFooterViewReuseIdentifier: headerFooterClass.reuseIdentifier)
    }
    
    /// To use this method, you need to register header or footer view by using register(_ headerFooterClass:) method.
    func dequeueReusableHeaderFooterView<HeaderFooter: UITableViewHeaderFooterView>(of headerFooterClass: HeaderFooter.Type) -> HeaderFooter? {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: headerFooterClass.reuseIdentifier) else { return nil }
        guard let headerFooter = view as? HeaderFooter else {
            assertionFailure("\(HeaderFooter.self) が登録されていません。")
            register(headerFooterClass.self)
            return headerFooterClass.init(reuseIdentifier: headerFooterClass.reuseIdentifier)
        }
        return headerFooter
    }
}

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}
extension UICollectionReusableView: Reusable {}
