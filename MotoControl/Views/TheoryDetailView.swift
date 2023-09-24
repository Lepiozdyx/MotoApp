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
                if let videoID = viewModel.theory.videoID {
                    ForEach(videoID, id: \.self) { video in
                        VideoView(videoID: video)
                            .frame(width: 350, height: 220)
                            .cornerRadius(20)
                    }
                }
                
                Text(viewModel.theory.definition)
                    .padding()
                
                if let image = viewModel.theory.image {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(image, id: \.self) { image in
                                ImageView(image: image)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(viewModel.theory.title)
        }
        .background(.thinMaterial)
    }
}

#Preview {
    TheoryDetailView(viewModel: TheoryDetailViewModel(theory: TheoryModel(title: "Theory", definition: "Можно смело утверждать, что в жизни каждого мотоциклиста бывает момент, когда перед ним встает вопрос  “как поднять упавший мотоцикл?”. У кого-то он падает чаще, у кого-то реже. И, тем не менее, каждый из нас сталкивается с задачей поднять упавший мот. Вдвоем с помощником, как правило, при подъёме никаких проблем не возникнет. Но что, если мотоцикл тяжёлый, а помочь некому? Чтобы поднять мотоцикл в одиночку, нужно знать определенный способ, как это можно сделать. Сегодня я расскажу о самом простом таком способе.", videoID: ["iuvEJchW-Uc"], image: ["КакПоднятьУпавшийМотоцикл?", "ТорможениеСАБС"])))
}
