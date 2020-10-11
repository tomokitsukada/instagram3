//
//  CommentViewController.swift/Users/tsukadatomoki/Creative Cloud Files/Instagram/ImageSelectViewController.swift
//  Instagram
//
//  Created by 塚田朋来 on 2020/09/22.
//  Copyright © 2020 tomoki.tsukada. All rights reserved.
//

import UIKit
import Firebase




class CommentViewController: UIViewController {
    
    // 投稿データを格納する配列
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    var commentpostData:PostData!
    
    
    
    
    
    @IBOutlet weak var commentTextField: UITextField!
    
    
    
    
    @IBAction func commentPostButton(_ sender: Any)  {
        
        
        
        let oldcomment = commentpostData.comment
        
        
        // FireStoreに投稿データを保存する
        let name = Auth.auth().currentUser?.displayName
        let comment = commentTextField.text
        var commentresult = ""
         
        
        
        if oldcomment == nil {
            commentresult = name! + ":" + comment!
        } else {
            commentresult = oldcomment! + "\n" + name! + ":" + comment!
        }
        
        
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(commentpostData.id)
        
        let postDic = [
            "comment": commentresult
            ] as [String : Any]
        postRef.updateData(postDic)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
}



















// Do any additional setup after loading the view.












/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */




