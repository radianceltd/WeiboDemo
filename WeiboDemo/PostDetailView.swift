//
//  PostDetailView.swift
//  WeiboDemo
//
//  Created by RND on 2020/7/29.
//  Copyright © 2020 RND. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    
    let post:Post
    
    var body: some View {
        List{
            PostCell(post:post)
            .listRowInsets(EdgeInsets())
            
            ForEach(1...10, id: \.self){ i in
                Text("评论\(i)")
            }
        }
        .navigationBarTitle("详情", displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PostDetailView(post: userData.recommendPostList.list[0]).environmentObject(userData)
    }
}
