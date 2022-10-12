

import UIKit
import SwiftyJSON

class AppPreferences {
    private enum Keys : String {
        
        //        case token = "Token"
        //        case userData = "userData"
        case APPLE_LANGUAGE_KEY = "AppleLanguages"
        case matchHighlights = "matchHighlights"
        case pinList = "pinList"
        case basketBallHighlights = "basketBallHighlights"
        case IsFirstRun = "IsFirstRun"
        case popupFrequency = "popupFrequency"
        
        
    }
    
    class func addToHighlights(obj:MatchList)
    {
        let userDefaults = UserDefaults.standard
        var matches = getMatchHighlights()
        if !matches.filter({$0.matchId == obj.matchId}).isEmpty{
            matches.remove(at: matches.firstIndex(where: {$0.matchId == obj.matchId})!)
        }
        matches.append(obj)
        var dict = [[String:Any]]()
        for m in matches{
            dict.append(m.toDictionary())
        }
        
        userDefaults.set(dict, forKey: Keys.matchHighlights.rawValue)
    }
    
    class func removeFromHilights(id:Int){
        let userDefaults = UserDefaults.standard
        var matches = getMatchHighlights()
        matches.remove(at: matches.firstIndex(where: {$0.matchId == id})!)
        var dict = [[String:Any]]()
        for m in matches{
            dict.append(m.toDictionary())
        }
        userDefaults.set(dict, forKey: Keys.matchHighlights.rawValue)
        
    }
    
    
    class func getMatchHighlights() -> [MatchList]
    {
        let userDefaults = UserDefaults.standard
        var matches = [MatchList]()
        if let matchData = userDefaults.object(forKey: Keys.matchHighlights.rawValue) as? [[String:Any]]
        {
            for m in matchData{
                let match = MatchList(JSON(m))
                matches.append(match)
            }
            
        }
        return matches
    }
    
    class func addToBasketballHighlights(obj:BasketballMatchList)
    {
        let userDefaults = UserDefaults.standard
        var matches = getBasketBallHighlights()
        if !matches.filter({$0.matchId == obj.matchId}).isEmpty{
            matches.remove(at: matches.firstIndex(where: {$0.matchId == obj.matchId})!)
        }
        matches.append(obj)
        var dict = [[String:Any]]()
        for m in matches{
            dict.append(m.toDictionary())
        }
        
        userDefaults.set(dict, forKey: Keys.basketBallHighlights.rawValue)
    }
    
    class func removeBasketballhilight(id:Int){
        let userDefaults = UserDefaults.standard
        var matches = getBasketBallHighlights()
        matches.remove(at: matches.firstIndex(where: {$0.matchId == id})!)
        var dict = [[String:Any]]()
        for m in matches{
            dict.append(m.toDictionary())
        }
        
        userDefaults.set(dict, forKey: Keys.basketBallHighlights.rawValue)
    }
    
    class func getBasketBallHighlights() -> [BasketballMatchList]
    {
        let userDefaults = UserDefaults.standard
        var matches = [BasketballMatchList]()
        if let matchData = userDefaults.object(forKey: Keys.basketBallHighlights.rawValue) as? [[String:Any]]
        {
            for m in matchData{
                let match = BasketballMatchList(JSON(m))
                matches.append(match)
            }
            
        }
        return matches
    }
    
    class func addToPinlist(obj:MatchList)
    {
        let userDefaults = UserDefaults.standard
        var matches = getPinList()
        if !matches.filter({$0.matchId == obj.matchId}).isEmpty{
            matches.remove(at: matches.firstIndex(where: {$0.matchId == obj.matchId})!)
        }
        matches.append(obj)
        var dict = [[String:Any]]()
        for m in matches{
            dict.append(m.toDictionary())
        }
        
        userDefaults.set(dict, forKey: Keys.pinList.rawValue)
    }
    
    class func getPinList() -> [MatchList]
    {
        let userDefaults = UserDefaults.standard
        var matches = [MatchList]()
        if let matchData = userDefaults.object(forKey: Keys.pinList.rawValue) as? [[String:Any]]
        {
            for m in matchData{
                let match = MatchList(JSON(m))
                matches.append(match)
            }
            
        }
        return matches
    }
    
    class func setIsFirstRun(value: Bool)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(value, forKey: Keys.IsFirstRun.rawValue)
    }
    
    class func getIsFirstRun() -> Bool
    {
        let userDefaults = UserDefaults.standard
        let value = userDefaults.bool(forKey: Keys.IsFirstRun.rawValue)
        
        return value
        
    }
    
    class func setPopupFrequency(frequency: Int)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(frequency, forKey: Keys.popupFrequency.rawValue)
    }
    
    class func getPopupFrequency() -> Int
    {
        let userDefaults = UserDefaults.standard
        let value = userDefaults.integer(forKey: Keys.popupFrequency.rawValue)
        
        return value
        
    }
    
    
    
    //    class func setToken(withToken token: String)
    //    {
    //        let userDefaults = UserDefaults.standard
    //        userDefaults.setValue(token, forKey: Keys.token.rawValue)
    //    }
    //
    //    class func getToken() -> String
    //    {
    //        let userDefaults = UserDefaults.standard
    //        if let token = userDefaults.string(forKey: Keys.token.rawValue)
    //        {
    //            return token
    //        }
    //        return ""
    //    }
    //
    //
    //
    //    class func setUserData(withUserData userData : User){
    //        let userDefaults = UserDefaults.standard
    //        userDefaults.set(userData.toDictionary(), forKey: Keys.userData.rawValue)
    //    }
    //
    //    class func getUserData() -> User{
    //        let userDefaults = UserDefaults.standard
    //        if let userData = userDefaults.object(forKey: Keys.userData.rawValue) as? [String:Any]
    //        {
    //            let userDataModel = User.init(fromJson: JSON(userData))
    //            return userDataModel
    //        }
    //        return User()
    //    }
    //
    //    class func clearPreferences(clear: @escaping () -> Void)
    //    {
    //        let defaults = UserDefaults.standard
    //        let dictionary = defaults.dictionaryRepresentation()
    //        dictionary.keys.forEach { key in
    //            if(key != Keys.APPLE_LANGUAGE_KEY.rawValue)
    //            {
    //                defaults.removeObject(forKey: key)
    //            }
    //        }
    //        clear()
    //    }
}
