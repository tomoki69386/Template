# Template

# Installation
*Carthage*
If you are using Carthage, add the following lines to your `Cartfile`:
```
github "tomoki69386/Template"
 ```
 Then run `carthage bootstrap`.

# Usage

Import the framework
```swift
import Template
```

## UIView
nib
```swift
let commonView = CommonView.loadFromNib()
```

```swift
tableView.register(ListTableViewCell.nib, forCellReuseIdentifier: ListTableViewCell.name)
```

## UITableView & UICollectionView
```swift
class ListTableViewCell: UITableViewCell {
    let label = UILabel()
}
final class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(of: ListTableViewCell.self, for: indexPath)
        cell.label.text = "ListTableViewCell"
        return cell
    }
}
```
