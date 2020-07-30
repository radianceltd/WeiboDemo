//
//  Post.swift
//  WeiboDemo
//
//  Created by RND on 2020/7/29.
//  Copyright © 2020 RND. All rights reserved.
//

import SwiftUI


struct PostList:Codable {
    var list:[Post]
    
}


// Data Model
// Codable 可以编码也可以解码
// 结构体少一个属性是可以的
// 结构体数据类型与json类型不对应会报错 记住
// 实列变量
struct Post:Codable,Identifiable {
    
    // Property 属性
    let id:Int
    let avatar:String //头像，图片名称
    let vip:Bool //true, false
    let name:String
    let date:String
    var isFollowed:Bool
    let text:String
    //数组显示 String 类型
    let images:[String]
    var commentCount:Int
    var likeCount:Int
    var isLiked:Bool
    
}

//扩展类型
extension Post{
    var avatarImage:Image{
        return loadImage(name: avatar)
    }
    
    //评论数文本显示 Cakculated 计算属性
    var commentCountText:String{
        if commentCount <= 0 {return "评论"}
        if commentCount < 1000 {return "\(commentCount)"}
        //保留1位小数
        return String(format: "%.1fK", Double(commentCount) / 1000)
    }
    
    //点赞文本显示
    var likeCountText:String{
        if likeCount <= 0 {return "点赞"}
        if likeCount < 1000 {return "\(likeCount)"}
        return String(format: "%.1fK", Double(likeCount) / 1000)
    }
}


//解析内部的数据文件
func loadPostListData(_ fileName:String)->PostList{
    //Bundle文件夹
    // guard保证取到数据
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil)else{
        fatalError("Can not find \(fileName) in mian bundle")
    }
    
    guard let data = try? Data(contentsOf: url)else{
        fatalError("Can not load \(url)")
    }
    
    guard let list = try? JSONDecoder().decode(PostList.self, from: data)else{
        fatalError("Can not parse post list json data")
    }
    
    // 解析完成的时候返回 list
    return list
    
}

//UIImage防止重复
func loadImage(name:String) -> Image{
    return Image(uiImage: UIImage(named: name)!)
}
