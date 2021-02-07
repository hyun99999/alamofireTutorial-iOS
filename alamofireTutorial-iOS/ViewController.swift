//
//  ViewController.swift
//  alamofireTutorial-iOS
//
//  Created by kimhyungyu on 2021/02/07.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //MARK - Property
    let urlString = "https://api.androidhive.info/contacts/"
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //cell resource 가져오기
        let myTableViewCellNib = UINib(nibName: "CustomCell", bundle: nil)
        //셀에 가져오 resource 등록
        self.tableView.register(myTableViewCellNib, forCellReuseIdentifier: "CustomCell")
        self.tableView.rowHeight = UITableView.automaticDimension
        
    }
    func fetchData() {
        AF.request(urlString).responseJSON { (response) in
            switch response.result {
            case .success(let res) :
                do{
                    let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                    //jsonData를 [Contact] 타입으로 디코딩
                    let json = try JSONDecoder().decode(APIResponse.self, from: jsonData)
                    //dataSource 에 변환한 값을 대입.
                    self.dataSource = json.contacts
                    //메인 큐를 이용하여 tableView 리로딩
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch(let err) {
                    print("ViewController - success error \(err.localizedDescription)")
                }
            case .failure(let err) :
                print("ViewController - response fail \(err.localizedDescription)")
            }
            
        }
    }
}

