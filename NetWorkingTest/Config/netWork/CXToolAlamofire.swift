//
//  CXToolAlamofire.swift
//  NetWorkingTest
//
//  Created by changmacpor on 2020/4/14.
//  Copyright © 2020 changmacpor. All rights reserved.
//

import UIKit

class CXToolAlamofire: NSObject {
    internal static let shared = CXToolAlamofire()
    private override init() {}
     /// https头部信息的provider
     static func manager() -> Manager {
    
         //使用Alamofire的直接使用manager做请求
         let manager: Alamofire.SessionManager = {
             let manager = Alamofire.SessionManager.default
             
             manager.delegate.sessionDidReceiveChallenge = { session, challenge in
                 var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
                 var credential: URLCredential?
                 
                 if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                     disposition = URLSession.AuthChallengeDisposition.useCredential
                     credential = URLCredential(trust: challenge.protectionSpace.serverTrust! )
                 } else {
                     if challenge.previousFailureCount > 0 {
                         disposition = .cancelAuthenticationChallenge
                     } else {
                         credential = manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                         
                         if credential != nil {
                             disposition = .useCredential
                         }
                     }
                 }
                 return (disposition, credential)
             }
             return manager
         }()
         return manager
     }


}
