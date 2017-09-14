// tableview 和 colletionview 快速注册cell

import Foundation
import UIKit
extension UITableViewCell: VKYReusableProtocol {}
extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: VKYReusableProtocol {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func registerClass<T: UITableViewCell>(_: T.Type) where T: VKYReusableProtocol {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

extension UICollectionViewCell: VKYReusableProtocol {}
extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: VKYReusableProtocol {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func registerClass<T: UICollectionViewCell>(_: T.Type) where T: VKYReusableProtocol {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}
