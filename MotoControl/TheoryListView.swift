//
//  TheoryListView.swift
//  MotoControl
//
//  Created by Alex on 12.09.2023.
//

import SwiftUI

let titles = ["Теория", "Как поднять упавший мотоцикл?", "Посадка на мотоцикле", "Постановка взгляда", "Расслабленные руки", "Серая зона сцепления", "Контрруление", "Торможение с абс", "Контрсвешивание", "Какую передачу выбрать?", "Интенсивный разгон", "Переключение передач", "Торможение при повороте", "Резина мотоцикла", "Подвеска мотоцикла"]

struct TheoryListView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(titles, id: \.self) { title in
                        CardView(title: title)
                }
            }
            .padding()
        }
    }
}


struct TheoryListView_Previews: PreviewProvider {
    static var previews: some View {
        TheoryListView()
    }
}
