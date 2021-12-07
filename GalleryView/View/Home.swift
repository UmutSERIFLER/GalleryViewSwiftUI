//
//  Home.swift
//  GalleryView
//
//  Created by Umut SERIFLER on 11.10.21.
//

import SwiftUI

struct Home: View {
    
    // Posts...
    
    @State private var posts: [Post] = []
    
    // Current Image
    @State private var currentPost: String = ""
    
    @State private var fullPreview: Bool = false
    
    var body: some View {
        
        //Double Side gallery
        TabView(selection: $currentPost) {
            ForEach(posts) { post in
                
                // For getting screen size for image
                GeometryReader { proxy in
                    let size = proxy.size
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(0)
                }
                .tag(post.id)
                .ignoresSafeArea()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .onTapGesture {
            withAnimation {
                fullPreview.toggle()
            }
        }
        // Top Detail View
        .overlay(
            
            HStack{
                
                Text("Scenerio's Pic's")
                    .font(.title2.bold())
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up.fill")
                }
            }
                .foregroundColor(.white)
                .padding()
                .background(BlurView(style: .systemUltraThinMaterialDark).ignoresSafeArea())
                .offset(y: fullPreview ? -150 : 0),
            alignment: .top
            
            
        )
        //Bottom Images View
        .overlay(
            // ScrollView reader to navigate to current page
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(posts) { post in
                            Image(post.postImage)
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 70, height: 60)
                                .cornerRadius(12)
                            //Showing ring for current post...
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(Color.white, lineWidth: 2)
                                        .opacity(currentPost == post.id ? 1 : 0)
                                    
                                )
                                .id(post.id)
                                .onTapGesture {
                                    withAnimation {
                                        currentPost = post.id
                                    }
                                }
                        }
                    }
                }
                .frame(height: 80)
                .background(Color.black.opacity(0.55).ignoresSafeArea())
                // While CurrentPost changing moving the current image view to center of scrollview...
                .onChange(of: currentPost) { _ in
                    withAnimation {
                        proxy.scrollTo(currentPost, anchor: .bottom)
                    }
                }
            }
                .offset(y: fullPreview ? 150 : 0),
            alignment: .bottom
            
            
            
            
        )
        // Inserting sample post images...
        .onAppear {
            for index in 1...8 {
                posts.append(Post( postImage: "\(index)"))
            }
            currentPost = posts.first?.id ?? ""
        }
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
