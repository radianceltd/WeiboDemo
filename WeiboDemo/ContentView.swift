//
//  ContentView.swift
//  WeiboDemo
//
//  Created by RND on 2020/7/29.
//  Copyright © 2020 RND. All rights reserved.
//

//导入框架
import SwiftUI

struct ContentView: View {
    var body: some View {
        PostListView(category: .recommed)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
