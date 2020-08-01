//
//  CommitTextView.swift
//  WeiboDemo
//
//  Created by ardwang on 2020/8/1.
//  Copyright © 2020 RND. All rights reserved.
//

import SwiftUI

//多行文本
struct CommentTextView: UIViewRepresentable {
    
    @Binding var text:String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.backgroundColor = .systemGray6
        view.font = .systemFont(ofSize:18)
        view.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        view.delegate = context.coordinator
        view.text = text
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        let parent:CommentTextView
        
        init(_ view:CommentTextView){
            parent = view
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
    
}

struct CommentTextView_Previews: PreviewProvider {
    static var previews: some View {
        CommentTextView(text: .constant(""))
    }
}
