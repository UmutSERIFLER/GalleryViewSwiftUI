//
//  Post.swift
//  GalleryView
//
//  Created by Umut SERIFLER on 11.10.21.
//

import SwiftUI

// Post Model...
struct Post: Identifiable, Hashable {
    var id = UUID().uuidString
    var postImage: String
}
