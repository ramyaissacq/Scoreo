

import Foundation


extension Data {
    func toDictionary() -> [String:AnyObject]?
    {
        do {
            return try JSONSerialization.jsonObject(with: self, options:[]) as? [String:AnyObject]
        } catch {
            return nil
        }
    }
}
