//
//  TheoryDetailView.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import SwiftUI

struct TheoryDetailView: View {
    @ObservedObject var viewModel: TheoryDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                if let videoUrl = viewModel.theory.videoURL {
                    VideoView(videoURL: videoUrl)
                        .frame(width: 300, height: 200)
                        .cornerRadius(20)
                        .padding()
                }
                
                Text(viewModel.theory.definition)
                    .padding()
                
                if let image = viewModel.theory.image {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ImageView(image: image)
                            ImageView(image: image)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(viewModel.theory.title)
        }
    }
}

struct TheoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TheoryDetailView(viewModel: TheoryDetailViewModel(theory: TheoryModel(title: "Theory", definition: "Можно смело утверждать, что в жизни каждого мотоциклиста бывает момент, когда перед ним встает вопрос  “как поднять упавший мотоцикл?”. У кого-то он падает чаще, у кого-то реже. И, тем не менее, каждый из нас сталкивается с задачей поднять упавший мот. Вдвоем с помощником, как правило, при подъёме никаких проблем не возникнет. Но что, если мотоцикл тяжёлый, а помочь некому? Чтобы поднять мотоцикл в одиночку, нужно знать определенный способ, как это можно сделать. Сегодня я расскажу о самом простом таком способе.", videoURL: URL(string: "https://www.youtube.com/watch?v=iuvEJchW-Uc"), image: "Как поднять упавший мотоцикл?")))
    }
}
