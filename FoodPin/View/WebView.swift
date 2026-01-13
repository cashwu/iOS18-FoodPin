//
//  WebView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-13.
//

import SwiftUI
import WebKit


struct WebView : UIViewRepresentable {
    
    var url : URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    
}
