//
//  ViewController.swift
//  NetWorkingTest
//
//  Created by changmacpor on 2020/4/3.
//  Copyright © 2020 changmacpor. All rights reserved.
//

import UIKit
import PromiseKit
import SnapKit
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 110
    // 在 class 中实现带有mutating方法的接口时，不用mutating进行修饰。因为对于class来说，类的成员变量和方法都是透明的，所以不必使用 mutating 来进行修饰
    func adjust() {
        simpleDescription += " Now 100% adjusted"
        print("====",simpleDescription)
    }
}

class ViewController: UIViewController {
    let button = UIButton()
    let disposeBag = DisposeBag()
    let homeViewModel = HomeViewModel()
    lazy var tableView = UITableView()
    var texts : [Products]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        initUI()
        button.rx.tap.subscribe (onNext:{
            print("oooooooooo===")
            
        }).disposed(by: disposeBag)
        
        button.rx.tap.subscribe { (sender) in
            print("111111oooooooooo===%@",sender)
            
        }.disposed(by: disposeBag)
        
        homeViewModel.firstTest().done{ (homeModel) in
            print("-----------------")
            
            print(homeModel?.msg as Any)
            print(homeModel?.code as Any)
            
        }.catch { (error) in
            
        }
        homeViewModel.getLoginUser { (model) in
            print("========")
            self.texts = model.data?.products
            self.laodTabview()
            
            print(model.msg as Any)
            print(model.code as Any)
        }
        
//        findDuplicate([1,4,3,2,2])
        
        print(threeSum([-5,1,2,3,6,7,8,9,10]))
        
    }
     func threeSum(_ nums: [Int]) -> [[Int]] {
            if nums.count < 3 {
                return []
            }
            let nums = nums.sorted()
            var res = [[Int]]()
            for i in 0..<nums.count - 2 {
                //最小的数大于0直接跳出循环
                if nums[i] > 0 {
                    break
                }
                //跳过起点相同的
                if i > 0 && nums[i] == nums[i - 1] {
                    continue
                }
                var l = i + 1
                var r = nums.count - 1
                while l < r {
                    let result = nums[i] + nums[l] + nums[r]
                    if result == 0 {
                        res.append([nums[i], nums[l], nums[r]])
//                        //跳过第二第三个数相同的结果
                        repeat {
                            l += 1
                        } while l < r && nums[l] == nums[l - 1]
                        repeat {
                            r -= 1
                        } while l < r && nums[r] == nums[r + 1]
                    } else if result < 0 {
                        //跳过第二第三个数相同的结果
                        repeat {
                            l += 1
                        } while l < r && nums[l] == nums[l - 1]
                    } else {
                        //跳过第二第三个数相同的结果
                        repeat {
                            r -= 1
                        } while l < r && nums[r] == nums[r + 1]
                    }
                }
            }
            return res
        }

    func findDuplicate(_ nums: [Int]) -> Int {
        var some : Int = 1
        var dictSome : [Int:Int] = [:]
            for i in  0..<nums.count {
                dictSome[nums[i]] = 1
                if dictSome.keys.count  < i + 1 {
                    some = nums[i]
                    return some
                }
            }
            return some
    }
    
    func initUI() -> Void {
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.backgroundColor = UIColor.red
        button.tag = 10
        view.addSubview(button)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.bottom.equalTo(self.view)
            make.right.equalTo(self.view)
            make.left.equalTo(self.view)
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
    }
    func laodTabview() -> Void {
        let items = Observable.from(optional: texts)
        
        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element.product_id?.description ?? "") @ row \(row)"
        }
        .disposed(by: disposeBag)
        
        
        tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext:  { value in
                //                       DefaultWireframe.presentAlert("Tapped `\(value)`")
            })
            .disposed(by: disposeBag)
        
        tableView.rx
            .itemAccessoryButtonTapped
            .subscribe(onNext: { indexPath in
                //                       DefaultWireframe.presentAlert("Tapped Detail @ \(indexPath.section),\(indexPath.row)")
            })
            .disposed(by: disposeBag)
    }
    
    
    
}

//class ExampleProtocol:NSObject{
//
//}
