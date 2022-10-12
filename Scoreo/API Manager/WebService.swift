

import UIKit
import Alamofire
import SwiftyJSON


class WebService {
    func get(url: String, params: Dictionary<String, Any>?, completion: @escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        webService(url: url, method: .get, params: params, completion: completion, failed: failed)
    }
    
    func post(url: String, params: Dictionary<String, Any>?, completion:@escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        webService(url: url, method: .post, params: params, completion: completion, failed: failed)
    }
    
    func put(url: String, params: Dictionary<String, Any>?, completion:@escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        webService(url: url, method: .put, params: params, completion: completion, failed: failed)
    }
    
    func delete(url: String, params: Dictionary<String, Any>?, completion:@escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        webService(url: url, method: .delete, params: params, completion: completion, failed: failed)
    }
    
    func uploadPost(url: String, params: Dictionary<String, Any>?, images: [UIImage], imageKey: String, completion: @escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        upload(url: url, method: .post, params: params, images: images, imageKey: imageKey, completion: completion, failed: failed)
    }
    func uploadFilePost(url: String, params: Dictionary<String, Any>?, files: [UploadFile], completion: @escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        upload(url: url, method: .post, params: params, files: files, completion: completion, failed: failed)
    }
    
    private func webService(url: String, method: Alamofire.HTTPMethod, params: Dictionary<String, Any>?, completion: @escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        print(url)
        if(params != nil)
        {
            print(params!)
        }
        if(Utility.isNetworkConnected()){
            var encoding: ParameterEncoding?
            if(method == .get)
            {
                encoding = URLEncoding.default
            }
            else
            {
                encoding = JSONEncoding.default
            }
            AF.request(url, method: method,
                          parameters: params,
                          encoding: encoding!,
                          headers: self.getHeaders(url: url))
                .validate(statusCode: 200...299)
                //.validate(contentType: ["application/json"])
                .responseJSON(completionHandler: { (response) in
                    self.handleResponse(response: response, completion: completion, failed: failed)
            })
        }
        else{
            Utility.dismissProgress()
            failed("No network")
            return
        }
    }
    
    private func upload(url: String, method: Alamofire.HTTPMethod, params: Dictionary<String, Any>?, images: [UIImage], imageKey: String, completion: @escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        print(url)
        if(params != nil)
        {
            print(params!)
        }
        if(Utility.isNetworkConnected()){
            AF.upload(multipartFormData: { formData in
                //Set Data to upload
                if let parameters = params {
                    for (key, value) in parameters
                    {
                        if let temp = value as? String {
                            formData.append(temp.data(using: .utf8)!, withName: key)
                        }
                        if let temp = value as? Int {
                            formData.append("\(temp)".data(using: .utf8)!, withName: key)
                        }
                    }
                }
                for image in images
                {
                    formData.append(image.jpegData(compressionQuality: 0.5)!, withName: imageKey , fileName: "\(Utility.getCurrentTimeStamp()).jpeg", mimeType: "image/jpeg")
                }
            }, to: url, method: method, headers: getHeaders(url: url)) .validate(statusCode: 200...299)
                .validate(contentType: ["application/json"]).responseJSON { response in
                //Service response
                self.handleResponse(response: response, completion: completion, failed: failed)
            }
        }
        else{
            Utility.dismissProgress()
            failed("No network")
            return
        }
    }
    
    private func upload(url: String, method: Alamofire.HTTPMethod, params: Dictionary<String, Any>?, files: [UploadFile], completion: @escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        print(url)
        if(params != nil)
        {
            print(params!)
        }
        if(Utility.isNetworkConnected()){
            AF.upload(multipartFormData: { formData in
                //Set Data to upload
                if let parameters = params {
                    for (key, value) in parameters
                    {
                        if let temp = value as? String {
                            formData.append(temp.data(using: .utf8)!, withName: key)
                        }
                        if let temp = value as? Int {
                            formData.append("\(temp)".data(using: .utf8)!, withName: key)
                        }
                    }
                }
                for file in files
                {
                    formData.append(file.data ?? Data(), withName: file.imageKey ?? "", fileName: file.fileName, mimeType: file.mimeType)
                }
            }, to: url, method: method, headers: getHeaders(url: url)).validate(statusCode: 200...299)
                .validate(contentType: ["application/json"]).responseJSON { response in
                //Service response
                self.handleResponse(response: response, completion: completion, failed: failed)
            }
        }
        else{
            Utility.dismissProgress()
            failed("No network")
            return
        }
    }
    
    func download(urlString:String, completion: @escaping(URL?)->Void, downloadProgress: @escaping(Float)->Void, failed: @escaping(String?)->Void)
    {
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory, in: .userDomainMask, options: [.removePreviousFile, .createIntermediateDirectories])
        AF.download(
            urlString,
            method: .get,
            parameters: nil,
            encoding: JSONEncoding.default,
            headers: nil,
            to: destination).downloadProgress(closure: { (progress) in
                downloadProgress(Float(progress.fractionCompleted) * 100)
            })
            .validate(statusCode: 200...299)
            .response(completionHandler: { (response) in
                print(response)
                Utility.dismissProgress()
                switch response.result {
                    case .success:
                        completion(response.value as? URL)
                    case .failure(_):
                        print("*******Error file****\n")
                        print(urlString)
                        failed(response.error?.errorDescription)
                    }
            })
    }
    
    private func handleResponse(response: AFDataResponse<Any>, completion: @escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        Utility.dismissProgress()
        switch response.result {
            case .success:
                if let value = response.value as? [String: AnyObject] {
                    completion(JSON(value))
                }
                else if let array = response.value as? Array<Any>
                {
                    completion(JSON(array))
                }
                else
                {
                    failed("Please try again later")
                    return
                }
            case .failure(_):
                if let value = response.data?.toDictionary() {
                    if let message = value["message"] as? String
                    {
                        failed(message)
                    }
                    else {
                        failed("Please try again later")
                    }
                }
                else
                {
                    failed("Please try again later")
                    return
                }
            }
    }
    
    private func getHeaders(url urlString: String) -> HTTPHeaders{
        var headers: HTTPHeaders = HTTPHeaders()
//        headers["Authorization"] = "Bearer \(AppPreferences.getToken())"
//        headers["Accept-Language"] = Utility.getCurrentLang()
////            "\(AppPreferences.getAppLang())"
        print(headers)
        return headers
    }
}
