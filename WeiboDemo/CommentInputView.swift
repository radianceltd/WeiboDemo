//
//  CommentInputView.swift
//  WeiboDemo
//
//  Created by ardwang on 2020/8/1.
//  Copyright © 2020 RND. All rights reserved.
//

import SwiftUI

struct CommentInputView: View {
    
    let post:Post
    
    @State private var text:String = ""
    
    //存储在环境里面默认的值
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userData:UserData
    
    var body: some View {
        
        VStack(spacing:0){
            
            CommentTextView(text: $text)
            
            HStack(spacing:8){
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("取消").padding()
                }
                
                Spacer()
                
                Button(action:{
                    print(self.text)
                    var post = self.post
                    post.commentCount+=1
                    self.userData.update(post)
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("发送").padding()
                }
            }
            .font(.system(size:18))
            .foregroundColor(.black)
        }
    }
}

struct CommentInputView_Previews: PreviewProvider {
    static var previews: some View {
        CommentInputView(post: UserData().recommendPostList.list[0])
    }
}
