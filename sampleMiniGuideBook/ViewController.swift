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
    
    //選択された行の表示エリア名
    var selectedName = ""
    
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
        return placeList.count
    }
    
    // 3.表示する文字のセット
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
//        cell.textLabel?.text = "\(indexPath.row)行目"
        cell.textLabel?.text = placeList[indexPath.row]
        
        return cell
        
    }

    //セルがタップされた時、segueを使って画面移動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(indexPath.row)行目がタップされました")
        
        //選択された行番号を保存
//        selectedIndex = indexPath.row
        
        //選択されたエリア名を保存
        selectedName = placeList[indexPath.row]
        
        //セグエを指定して、画面遷移
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    //segueを使って画面を移動しようとしてる時発動するメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        //移動先画面のオブジェクトを取得
        let dv:detailViewController = segue.destination as! detailViewController
        
        //作成しておいたプロパティに、選択されたエリア名を保存
        dv.scSelectedName = selectedName
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

