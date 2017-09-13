//
//  detailViewController.swift
//  sampleMiniGuideBook
//
//  Created by Eriko Ichinohe on 2017/09/13.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    //選択されたエリア名を保存するプロパティ
    var scSelectedName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("選択されたエリアは\(scSelectedName)です")
        
        //プロパティリスト読み込み
        //ファイルパスを取得（エリア名が格納されているプロパティリスト）
        let filePath = Bundle.main.path(forResource: "guideList", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile: filePath!)
        
        print(dic?[scSelectedName])
        
        //TODO:MiniGuidebookの詳細画面を完成させましょう
        //ヒント:latitude,longitudeがリスト内ではString型
        //実際に使用するときはDouble型へ型変換が必要
        //String型->Double型の型変換におすすめな関数はatof()です
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
