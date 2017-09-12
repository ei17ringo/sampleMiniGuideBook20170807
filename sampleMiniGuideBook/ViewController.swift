//
//  ViewController.swift
//  sampleMiniGuideBook
//
//  Created by Eriko Ichinohe on 2017/09/12.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

//1.プロトコルを記述
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    //紹介したいエリア名が格納される配列
    var placeList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ファイルパスを取得（エリア名が格納されているプロパティリスト）
        let filePath = Bundle.main.path(forResource: "guideList", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile: filePath!)
        
        //TableViewで扱いやすい形（エリア名の入ってる配列）を作成
        //Dictionary型の高速列挙
        for(key,data) in dic! {
            print(key)  //AyalaとかMoalboalが取得できているのが確認できる
            placeList.append(key as! String)
        }
        
        
    }
    
    // 2.行数セット
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // 3.表示する文字のセット
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)行目"
        
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

