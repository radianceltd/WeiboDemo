//
//  PostListView.swift
//  WeiboDemo
//
//  Created by RND on 2020/7/29.
//  Copyright © 2020 RND. All rights reserved.
//

import SwiftUI

//显示微博列表View
struct PostListView: View {

    let category: PostListCategory
    
    var postList:PostList{
        switch category {
        case .recommed:
            return loadPostListData("PostListData_recommend_1.json")
        case .hot:
            return loadPostListData("PostListData_hot_1.json")
        }
    }
    
    var body: some View {
        
        List{
            // foreach循环
            ForEach(postList.list) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)) {
                        EmptyView()
                    }
                    .hidden()
                    
                }
                .listRowInsets(EdgeInsets())
            }
        }
    }
}


struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .recommed)
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
    }
}
