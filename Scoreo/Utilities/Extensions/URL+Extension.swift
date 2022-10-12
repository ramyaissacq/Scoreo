
import Foundation
import Kingfisher



extension URL
{
    func getImage(imageCompletionHandler: @escaping (UIImage) -> Void)
    {
        KingfisherManager.shared.retrieveImage(with: self, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                imageCompletionHandler(value.image)
            case .failure:
                imageCompletionHandler(Utility.getPlaceHolder()!)
            }
        }
    }
}
