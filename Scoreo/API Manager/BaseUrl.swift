
import UIKit

class BaseUrl{
    public static let environment = Environment.Production
    
    private static let testBaseUrl = "https://www.77577.live/api/"
    private static let stagingBaseUrl = "https://www.77577.live/api/"
    private static let productionBaseUrl = "https://www.77577.live/api/"
    
    class func getBaseUrl() -> String
    {
        switch environment {
            case .Test:
                return testBaseUrl
            case .Staging:
                return stagingBaseUrl
            case .Production:
                return productionBaseUrl
        }
    }
}
