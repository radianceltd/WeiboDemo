//
//  PostCell.swift
//  WeiboDemo
//
//  Created by RND on 2020/7/29.
//  Copyright © 2020 RND. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    
    //let image = UIImage(named: "4e7f0c83ly8g1ho507078j20ro0rojtq")!
    let post:Post
    
    var body: some View {
       VStack(alignment: .leading, spacing: 10){
            //布局显示的内容
            HStack(spacing: 5){
                post.avatarImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                    .overlay(
                        PostVIPBadge(vip: post.vip)
                        .offset(x:16,y:16)
                )
                
                VStack(alignment: .leading, spacing: 5){
                    Text(post.name).font(.system(size: 16))
                        .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                    .lineLimit(1)
                    Text(post.date)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading, 10)
                Spacer()
                if !post.isFollowed {
                    Button(action:{
                        print("Click follow button")
                    }){
                        Text("关注")
                            .font(.system(size: 14))
                            .foregroundColor(.orange)
                            .frame(width:50, height: 26)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.orange, lineWidth:1)
                        )
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
            }
            
            Text(post.text)
                .font(.system(size:17))
            
            //判断数组是否为空
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
            }
            
            //分割线
            Divider()
            
            HStack(spacing:0){
                Spacer()
                PostCellToolbarButton(
                    image: "message",
                    text: post.commentCountText,
                    color: .black){
                    print("Click comment button!")
                }
                Spacer()
                PostCellToolbarButton(
                    image: "heart",
                    text: post.likeCountText,
                    color: .black){
                    print("Click like button!")
                }
                Spacer()
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height:10)
            .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
            
        }.padding(.horizontal,15) //水平方向10间距
            .padding(.top, 15) //上部的间距
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[0])
    }
}
