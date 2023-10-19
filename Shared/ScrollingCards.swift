//
//  ContentView.swift
//  Shared
//
//  Created by Паша on 18.10.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 20) {
                ForEach(sectionData) { item in
                    GeometryReader { geometry in
                        SectionView(section: item)
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30)) / -20, axis: (x: 0, y: 10, z: 0))
                    }
                    .frame(width: 275, height: 275)
                }
            }
            .padding(30)
            .padding(.bottom, 30)
        }
        .padding(.top, 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SectionView: View {
    var section: Section
    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section : Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Дизайн в SwiftUI", text: "50 уроков", logo: "swift-logo", image: Image("Image-1"), color: Color(.blue)),
    Section(title: "Основы Swift", text: "30 уроков", logo: "swift-logo", image: Image("Image-2"), color: Color(.red)),
    Section(title: "Решение задач на языке Swift", text: "35 уроков", logo: "swift-logo", image: Image("Image-3"), color: Color(.yellow))
]
