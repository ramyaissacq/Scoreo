

import UIKit

//class AuthenticationAPI: WebService {
//    func registration(request: RegisterRequest, completion:@escaping (LoginResponse) -> Void, failed: @escaping (String) -> Void)
//    {
//        let url = BaseUrl.getBaseUrl() + EndPoints.register.rawValue
//        post(url: url, params: request.toDictionary(), completion: { (json) in
//            let response = LoginResponse(fromJson: json)
//            completion(response)
//        }, failed: failed)
//    }
//
//    func login(request: LoginRequest, completion:@escaping (LoginResponse) -> Void, failed: @escaping (String) -> Void)
//    {
//        let url = BaseUrl.getBaseUrl() + EndPoints.login.rawValue
//        post(url: url, params: request.toDictionary(), completion: { (json) in
//            let response = LoginResponse(fromJson: json)
//            completion(response)
//        }, failed: failed)
//    }
//
//    func socialLogin(param: [String:Any], completion:@escaping (LoginResponse) -> Void, failed: @escaping (String) -> Void)
//    {
//        let url = BaseUrl.getBaseUrl() + EndPoints.socialLogin.rawValue
//        post(url: url, params: param, completion: { (json) in
//            let response = LoginResponse(fromJson: json)
//            completion(response)
//        }, failed: failed)
//    }
//
//    func logout(completion:@escaping (RegisterResponse) -> Void, failed: @escaping (String) -> Void)
//    {
//        let url = BaseUrl.getBaseUrl() + EndPoints.logout.rawValue
//        get(url: url, params: nil, completion:  { (json) in
//            let response = RegisterResponse(fromJson: json)
//            completion(response)
//        }, failed: failed)
//    }
//
//    func verifyPhone(request: RegisterRequest, completion:@escaping (RegisterResponse) -> Void, failed: @escaping (String) -> Void)
//    {
//        let url = BaseUrl.getBaseUrl() + EndPoints.verifyPhone.rawValue
//        post(url: url, params: request.toDictionary(), completion: { (json) in
//            let response = RegisterResponse(fromJson: json)
//            completion(response)
//        }, failed: failed)
//    }
//
//    func changePassword(request: RegisterRequest, completion:@escaping (RegisterResponse) -> Void, failed: @escaping (String) -> Void)
//    {
//        let url = BaseUrl.getBaseUrl() + EndPoints.changePassword.rawValue
//        post(url: url, params: request.toDictionary(), completion: { (json) in
//            let response = RegisterResponse(fromJson: json)
//            completion(response)
//        }, failed: failed)
//    }
//
//    func verifyUser(request: RegisterRequest,completion : @escaping(RegisterResponse)->Void, failed: @escaping(String)->Void){
//        let url = BaseUrl.getBaseUrl() + EndPoints.verifyUser.rawValue
//        post(url: url, params: request.toDictionary(), completion: { json in
//            let response = RegisterResponse(fromJson: json)
//            completion(response)
//        }, failed: failed)
//    }
//
//    func getUserDetails(userId:Int, completion: @escaping(GetUserResponse)->Void, failed: @escaping(String)->Void){
//        let url = BaseUrl.getBaseUrl() + EndPoints.getUserDetails.rawValue + "\(userId)"
//        get(url: url, params: nil, completion: { json in
//            let response = GetUserResponse(fromJson: json)
//            completion(response)
//        }, failed: failed)
//    }
//
//    func getAllUsers(completion: @escaping(GetAllUsersResponse)->Void, failed: @escaping(String)->Void){
//        let url = BaseUrl.getBaseUrl() + EndPoints.getAllUsers.rawValue
//        get(url: url, params: nil, completion: { json in
//            let response = GetAllUsersResponse(fromJson: json)
//            completion(response)
//        }, failed: failed)
//    }
//}
