//
//  CXNetworkAlamofire.swift
//  SwiftCeshi
//
//  Created by changmacpor on 2018/8/22.
//  Copyright © 2018年 changmacpor. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import Moya
import Alamofire

enum CXNetworkAlamofire {
    case askQuestion(username: String, messages: [[String : Any]], subjectname: String, subjectvalue: String)  /// 提交问题
    case askQuestionV2(info: [String: Any])                       /// 提交问题v1.1.0
//    case wxPDayOrderRequest(info: [String: Any])                   /// W-X-支付获取支付参数
//    case aliPDayOrderRequest(info: [String: Any])                  /// Z-F-B支付获取支付参数
    case items(info: [String : Any])                              /// 获取我的会话信息
    case getMessages(groupId: String)                             /// 根据groupId获取消息
    case loadMessages(info: [String : Any])                       /// 加载更多group信息
    case getCompleteMessages(info: [String : Any])                /// 根据groupId获取所有的消息
    case commitAnswer                  /// 追加问题
    case commitAnswer1                  /// 追加问题

    case groupInfo(groupId: String)                               /// 查询群组信息
    case evaluate(result: [String : Any])                         /// 评价
    case feature                                                  /// 评价标签
    case evaluateResult(groupId: String, fromUser: String)        /// 学生给老师的评价
    case teacherEvaluateResult(groupId: String)                   /// 老师给学生的评价
    case quotationList(groupId: String)                           /// 获取竞价信息列表
    case soled(groupId: String)                                   /// 问题已解决
    case unsoled(groupId: String)                                 /// 问题未解决
    case unsolvedAndRefund(groupId: String)                       /// 问题未解决申请退款
    case subject                                                  /// 获取提问标签
    case communicate(groupId: String)                             /// 修改组状态为沟通中
    case search(content: String)                                  /// 搜索问题
    case refund(result: [String : Any])                           /// 申请退款
    case repeal(groupId: String)                                  /// 根据groupId获取所有的消息
    case deleteGroup(groupId: String)                             /// 根据groupId删除问题
    case teacherStatistical(username: String)                     /// 查看老师的评分
    case reAskQuestion(groupId: String)                           /// 重新提问
    case priceAskQuestion(groupId: String)                        /// 加价提问
    case isPunchClock                                             /// 是否打卡
    case shareClock                                               /// 分享打卡
    case clockInfo                                                /// 打卡信息
}

extension CXNetworkAlamofire: TargetType,AccessTokenAuthorizable {
    
    
    
    
    var authorizationType: AuthorizationType {
        switch self {

        case .commitAnswer:
            return .none
        case .askQuestion:
            return .bearer
        case .askQuestionV2:
            return .bearer
//        case .wxPDayOrderRequest:
//            return .bearer
//        case .aliPDayOrderRequest:
//            return .bearer
        case .items:
            return .bearer
        case .getMessages:
            return .bearer
        case .loadMessages:
            return .bearer
        case .getCompleteMessages:
            return .bearer
        case .groupInfo:
            return .bearer
        case .evaluate:
            return .bearer
        case .feature:
            return .bearer
        case .evaluateResult:
            return .bearer
        case .teacherEvaluateResult:
            return .bearer
        case .quotationList:
            return .bearer
        case .soled:
            return .bearer
        case .unsoled:
            return .bearer
        case .unsolvedAndRefund:
            return .bearer
        case .subject:
            return .bearer
        case .communicate:
            return .bearer
        case .search:
            return .bearer
        case .refund:
            return .bearer
        case .repeal:
            return .bearer
        case .deleteGroup:
            return .bearer
        case .teacherStatistical:
            return .bearer
        case .reAskQuestion:
            return .bearer
        case .priceAskQuestion:
            return .bearer
        case.isPunchClock:
            return.bearer
        case .shareClock:
            return.bearer
        case .clockInfo:
            return.bearer
        case .commitAnswer1:
            return.bearer
        }
    }
    /// 网络请求基地址
    public var baseURL: URL {
        return URL(string: OLBasedURL)!
    }
    
    /// 网络请求头设置
    var headers: [String : String]? {
         return ["Content-Type" : "application/json; charset=utf-8"]
    }
    
  
    /// 网络请求路径
    public var path: String {
        switch self {

        case .commitAnswer:
            return "route=api/product/specialsApp&api_token=f15ed7b84f516cf4b3aaee2dad"
        case .askQuestion:
            return "v1/topics"
        case .commitAnswer1:
            return ""
            
        case .askQuestionV2:
            return "/xueba/group/askQuestion"
//        case .wxPDayOrderRequest:
//            return "/payserver/pay/wxPayOrderRequest"
//        case .aliPDayOrderRequest:
//            return "/payserver/pay/alDiPDayOrderRequest"
        case .items:
            return "/xueba/group/items"
        case .getMessages:
            return "/xueba/message/groupId"
        case .loadMessages:
            return "/xueba/message/groupId"
        case .getCompleteMessages:
            return "/xueba/message/groupId"
        case .groupInfo:
            return "/xueba/group/info"
        case .evaluate:
            return "/xueba/evaluate/scomment"
        case .teacherEvaluateResult:
            return "/xueba/evaluate/sinfo"
        case .feature:
            return "/xueba/feature/all"
        case .evaluateResult:
            return "/xueba/evaluate/tinfo"
        case .quotationList:
            return "/xueba/answer/groupId"
        case .soled:
            return "/xueba/group/solved"
        case .unsoled:
            return "/xueba/group/unsolved"
        case .unsolvedAndRefund:
            return "/xueba/group/unsolvedAndRefund"
        case .subject:
            return "/xueba/label/subject"
        case .communicate:
            return "/xueba/group/communicate"
        case .search:
            return "/xueba/group/search"
        case .refund:
            return "/xueba/appeal/student/refund"
        case .repeal:
            return "/xueba/group/repeal"
        case .deleteGroup(let groupId):
            return "/xueba/group/\(groupId)"
        case .teacherStatistical:
            return "/xueba/evaluate/teacherSampleStatistical"
        case .reAskQuestion:
            return "/xueba/group/reAskQuestion"
        case .priceAskQuestion:
            return "/xueba/group/priceAskQuestion"
        case .isPunchClock:
            return "/payserver/voucher/shared"
        case .shareClock:
            return "/payserver/voucher/share"
        case .clockInfo:
            return "/xueba/student/home/share"
        }
    }
    
    /// 设置请求方式
    public var method: Moya.Method {
        switch self {
            case .commitAnswer1:
                return .get
        case .commitAnswer:
            return .get
        case .askQuestion:
            return .post
        case .askQuestionV2:
            return .post
//        case .wxPDayOrderRequest:
//            return .post
//        case .aliPDayOrderRequest:
//            return .post
        case .items:
            return .get
        case .getMessages:
            return .get
        case .loadMessages:
            return .get
        case .getCompleteMessages:
            return .get
        case .groupInfo:
            return .get
        case .evaluate:
            return .post
        case .feature:
            return .get
        case .evaluateResult:
            return .get
        case .teacherEvaluateResult:
            return .get
        case .quotationList:
            return .get
        case .soled:
            return .post
        case .unsoled:
            return .post
        case .unsolvedAndRefund:
            return .post
        case .subject:
            return .get
        case .communicate:
            return .post
        case .search:
            return .get
        case .refund:
            return .post
        case .repeal:
            return .get
        case .deleteGroup:
            return .delete
        case .teacherStatistical:
            return .get
        case .reAskQuestion:
            return .post
        case .priceAskQuestion:
            return .post
        case .isPunchClock:
            return .post
        case .shareClock:
            return .post
        case .clockInfo:
            return .get
        }
    }
    
    /// 请求参数
    public var parameters: [String: Any]? {
        switch self {
        case .askQuestion(let username, let messages, let subjectname, let subjectvalue):
            return ["username": username, "messages": messages, "subjectname":subjectname, "subjectvalue": subjectvalue]
        case .askQuestionV2(let info):
            return info
        case .commitAnswer :
            return nil
//        case .wxPDayOrderRequest(let info):
//            return info
//        case .aliPDayOrderRequest(let info):
//            return info
        case .items(let info):
            return info
        case .getMessages(let groupId):
            return ["groupId": groupId]
        case .loadMessages(let info):
            return info
        case .getCompleteMessages(let info):
            return info
        case .groupInfo(let groupId):
            return ["groupId": groupId]
        case .evaluate(let result):
            return result
        case .feature:
            return ["": ""]
        case .evaluateResult(let groupId, let fromUser):
            return ["groupId":groupId, "fromUser":fromUser]
        case .teacherEvaluateResult(let groupId):
            return ["groupId":groupId]
        case .quotationList(let groupId):
            return ["groupId":groupId]
        case .soled(let groupId):
            return ["groupId":groupId]
        case .unsoled(let groupId):
            return ["groupId":groupId]
        case .unsolvedAndRefund(let groupId):
            return ["groupId":groupId]
        case .subject:
            return ["": ""]
        case .communicate(let groupId):
            return ["groupId":groupId]
        case .search(let content):
            return ["content":content]
        case .refund(let result):
            return result
        case .repeal(let groupId):
            return ["groupId":groupId]
        case .deleteGroup(let groupId):
            return ["groupId":groupId]
        case .teacherStatistical(let username):
            return ["username": username]
        case .reAskQuestion(let groupId):
            return ["groupId":groupId]
        case .priceAskQuestion(let groupId):
            return ["groupId":groupId]
        case .isPunchClock:
            return ["": ""]
        case .shareClock:
            return ["": ""]
        case .clockInfo:
            return ["": ""]
        case .commitAnswer1:
            return nil
        }
    }
    
    // Local data for unit test.use empty data temporarily.
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    // Represents an HTTP task.
    public var task: Task {
        switch self {
        case .commitAnswer:
//            let data = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
            return .requestPlain
        case .askQuestion:
            let data = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
            return .requestData(data!)
        case .askQuestionV2:
            let data = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
            return .requestData(data!)
//        case .wxPDayOrderRequest:
//            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
//        case .aliPDayOrderRequest:
//            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .items:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .getMessages:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .loadMessages:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .getCompleteMessages:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .groupInfo:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .evaluate:
            let data = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
            return .requestData(data!)
        case .feature:
            return .requestPlain
        case .evaluateResult:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .teacherEvaluateResult:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .quotationList:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .soled:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .unsoled:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .unsolvedAndRefund:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .subject:
            return .requestPlain
        case .communicate:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .search:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .refund:
            let data = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
            return .requestData(data!)
        case .repeal:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .deleteGroup:
            return .requestPlain
             //return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .teacherStatistical:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .reAskQuestion:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .priceAskQuestion:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .isPunchClock:
            return .requestPlain
        case .shareClock:
            return .requestPlain
        case .clockInfo:
            return .requestPlain
        case .commitAnswer1:
            return .requestPlain
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        // Select type of parameter encoding based on requirements.Usually we use 'URLEncoding.default'.
        switch self {
        case .commitAnswer:
            return URLEncoding.httpBody
        case .askQuestion:
            return URLEncoding.httpBody
        case .askQuestionV2:
            return URLEncoding.httpBody
//        case .wxPDayOrderRequest:
//            return URLEncoding.queryString
//        case .aliPDayOrderRequest:
//            return URLEncoding.queryString
        case .items:
            return URLEncoding.default
        case .getMessages:
            return URLEncoding.queryString
        case .loadMessages:
            return URLEncoding.queryString
        case .getCompleteMessages:
            return URLEncoding.queryString
        case .groupInfo:
            return URLEncoding.queryString
        case .evaluate:
            return URLEncoding.httpBody
        case .feature:
            return URLEncoding.default
        case .evaluateResult:
            return URLEncoding.queryString
        case .teacherEvaluateResult:
            return URLEncoding.queryString
        case .quotationList:
            return URLEncoding.queryString
        case .soled:
            return URLEncoding.queryString
        case .unsoled:
            return URLEncoding.queryString
        case .unsolvedAndRefund:
            return URLEncoding.queryString
        case .subject:
            return URLEncoding.default
        case .communicate:
            return URLEncoding.queryString
        case .search:
            return URLEncoding.queryString
        case .refund:
            return URLEncoding.httpBody
        case .repeal:
            return URLEncoding.queryString
        case .deleteGroup:
            return URLEncoding.methodDependent
        case .teacherStatistical:
            return URLEncoding.queryString
        case .reAskQuestion:
            return URLEncoding.queryString
        case .priceAskQuestion:
            return URLEncoding.queryString
        case .isPunchClock:
            return URLEncoding.default
        case .shareClock:
            return URLEncoding.default
        case .clockInfo:
            return URLEncoding.default
        case .commitAnswer1:
            return URLEncoding.httpBody
        }
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
    
}

