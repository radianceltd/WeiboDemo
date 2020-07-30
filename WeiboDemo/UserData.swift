//
//  UserData.swift
//  WeiboDemo
//
//  Created by RND on 2020/7/30.
//  Copyright © 2020 RND. All rights reserved.
//

import Combine

class UserData: ObservableObject {
    
   @Published var recommendPostList:PostList = loadPostListData("PostListData_recommend_1.json")
    
   @Published var hotpostList:PostList = loadPostListData("PostListData_hot_1.json")
    
    //定义字典
    private var recommendPostDic: [Int:Int] = [:] // id: index
    
    private var hotPostDic: [Int:Int] = [:] // id: index
    
    init() {
        for i in 0..<recommendPostList.list.count {
            let post = recommendPostList.list[i]
            recommendPostDic[post.id] = i
        }
        
        for i in 0..<hotpostList.list.count {
            let post = hotpostList.list[i]
            hotPostDic[post.id] = i
        }
        
        
    }
    
}

enum PostListCategory {
    case recommed,hot
}

extension UserData{
    func postList(for category: PostListCategory) -> PostList {
        switch category {
        case .recommed: return recommendPostList
        case .hot: return hotpostList
        }
    }
    
    func post(forId id:Int) -> Post? {
        if let index = recommendPostDic[id]{
            return recommendPostList.list[index]
        }
        
        if let index = hotPostDic[id] {
            return hotpostList.list[index]
        }
        
        return nil
    }
    
    func update(_ post: Post){
        if let index = recommendPostDic[post.id]{
            recommendPostList.list[index] = post
        }
        
        if let index = hotPostDic[post.id]{
            hotpostList.list[index] = post
        }
    }
    
}
