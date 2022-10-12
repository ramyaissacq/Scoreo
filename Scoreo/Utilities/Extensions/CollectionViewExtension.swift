
import UIKit

extension UICollectionView{
    func getCellWidth(forColumnCount columnCount: CGFloat) -> CGFloat
    {
        let contentInset = self.contentInset.left + self.contentInset.right
        let contentWidth = self.frame.width - contentInset
            
        let totalGap = (columnCount - 1) * (collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing
        return (contentWidth - totalGap) / columnCount
    }
    
    func registerCell(identifier: String)
    {
        self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}
