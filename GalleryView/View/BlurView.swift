//
//  BlurView.swift
//  GalleryView
//
//  Created by Umut SERIFLER on 11.10.21.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
                return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {

    }
}

//Since image quality is too high preview is too long
// This pics are only demo usage...
