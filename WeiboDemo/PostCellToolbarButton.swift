//
//  PostCellToolbarButton.swift
//  WeiboDemo
//
//  Created by RND on 2020/7/29.
//  Copyright © 2020 RND. All rights reserved.
//

import SwiftUI

struct PostCellToolbarButton: View {
    
    let image:String
    let text:String
    let color:Color
    let action:()-> Void //closure, function闭包
    
    var body: some View {
        Button(action:action){
            HStack(spacing:5){
                //系统显示的图片
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size:15))
            }
        }
        .foregroundColor(color) //设置背景图片颜色
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart", text: "点赞", color: .red){
            print("点赞了")
        }
    }
}
