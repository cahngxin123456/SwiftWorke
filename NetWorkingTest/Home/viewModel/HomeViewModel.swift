//
//  HomeViewModel.swift
//  NetWorkingTest
//
//  Created by changmacpor on 2020/4/14.
//  Copyright © 2020 changmacpor. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit
import ObjectMapper
class HomeViewModel: NSObject{
    var messageModel: CXHomeModel?
    let disposeBag = DisposeBag()
    internal static let shared = HomeViewModel()

    let provider:MoyaProvider = MoyaProvider<CXNetworkAlamofire>()

    func firstTest()-> Promise<CXHomeModel?>{
        weak var weakSelf = self
        
        return Promise {seal in
            guard let strongSelf = weakSelf else { return }
            strongSelf.provider.rx.request(CXNetworkAlamofire.commitAnswer1)
                .asObservable()
                .filterSuccessfulStatusCodes()
                .mapJSON()
                .mapObject(type: CXHomeModel.self)
                .subscribe(onNext: { model in
                    print("22222222")
                    seal.fulfill(model)
                }, onError: { error in
                    seal.reject(error)
                    print("获取可以回答的问题消息失败 error = \(error)")
                },onCompleted: {
                    print("33333333")
                }).disposed(by: disposeBag)
            
        }
        
    }
    
    /// 第一次请求的数据
    @objc func firstFetchMessageList(){
        
        
        //        let urlStr = "http://192.168.1.215/jinlintuan/index.php?route=api/product/specialsApp&api_token=f15ed7b84f516cf4b3aaee2dad"
        //        Alamofire.request(urlStr).responseJSON { (response) in
        //            switch response.result {
        //            case .success(let json):
        //
        //                break
        //            case .failure(let error):
        //                print("error:\(error)")
        //                break
        //            }
        //        }
        //         let provider = MoyaProvider<CXNetworkAlamofire>()
        //                provider.rx.request(.commitAnswer1)
        ////                    .map(HTTBin.self)
        //                    .subscribe(onSuccess: { httbin in
        //        //                guard let element = httbin else {
        //        //                    return
        //        //                }
        //        //                print(element.origin)   // XXX.XX.XX.XXX
        //
        //
        //                    }, onError: { error in
        //                        print(error)
        //                    }).disposed(by: disposeBag)
        //
        //            }
        
        
    }
        //["username":"13273735788","password":"123456"]
            func getLoginUser(completed: @escaping (_ menuModel: CXHomeModel) -> ()){
                let provider:MoyaProvider = MoyaProvider<CXNetworkAlamofire>(manager: CXToolAlamofire.manager(), plugins: [NetworkLoggerPlugin(verbose: true)])
    
    
                provider.rx.request(CXNetworkAlamofire.commitAnswer1)
                    .asObservable()
                .mapJSON()
                    .mapObject(type: CXHomeModel.self)
                    .subscribe(onNext: {  (model) in
                        let mo:CXHomeModel = model
                        
                        let mm = (mo.data?.products[0])! as Products
                        print(mm.product_id as Any)
                        completed(model)
    //                    debugPrint(event.element?.data!["alipay"])
    //                    switch event {
    //                    case let .next(mapObject):
    //
//                                          self?.models.value = mapObject.channels   self?.models.value = isReloadData ? modelArr : (self?.models.value ?? []) + modelArr
    //                        LXFProgressHUD.showSuccess("加载成功")
    //                    case let .error(error):
    //                        LXFProgressHUD.showError(error.localizedDescription)
    //                    case .completed: break
    //                        //                    output.refreshStatus.value = isReloadData ? .endHeaderRefresh : .endFooterRefresh
    //                    }
                    }).disposed(by: disposeBag)
    //
            }
    
    
}
