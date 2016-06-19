import UIKit

class ViewController: UITableViewController {
    
    var storedOffsets = [Int: CGFloat]()
    
    let titles = [
        ("Rap Caviar", "58,211 Followers")
        , ("Dove Beauty", "Sponsered")
        , ("Weekend Buzz", "123,987 Followers")
        , ("EDC Las Vegas", "34854 Followers")
        , ("Covergirl", "Sponsered")
        , ("Teen Party", "157643 Followers")
        , ("New Noise", "33,456 Followers")
        , ("Verizon Wireless", "Sponsered")
    ]
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 1 {
            guard let tableViewCell = cell as? TableViewCellWithCollection else { return }
            
            tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        } else if indexPath.section == 2 {
            cell.backgroundColor = tableView.backgroundColor
            
        } else if indexPath.section == 3 {
            cell.backgroundColor = tableView.backgroundColor
            
        }
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? TableViewCellWithCollection else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        if let collectionCell = cell as? AddCollectionViewCell {
            
            collectionCell.addImage.image = UIImage(named: indexPath.row.description)
            
            collectionCell.title.text = titles[indexPath.row].0
            collectionCell.followers.text = titles[indexPath.row].1
        }
        
        return cell
    }
}
