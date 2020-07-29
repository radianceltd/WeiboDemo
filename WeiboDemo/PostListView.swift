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
    //类型的构造方法
    init() {
        //去掉分割线
        UITableView.appearance().separatorStyle = .none
        //默认点击样式去掉
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView{
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
            .navigationBarTitle("Title")
            .navigationBarHidden(true)
        }
    }
}


struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        //NavigationView {
            PostListView()
                //.navigationBarTitle("Title")
                //.navigationBarHidden(true)
        //}
    }
}
