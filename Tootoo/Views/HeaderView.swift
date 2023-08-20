//
//  HeaderView.swift
//  ToDoList
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let bg: Color
    let angle: Double
    let os: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bg)
                .rotationEffect(Angle(degrees: angle))
            VStack {
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 50))
                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 10,
               height: 300)
        .offset(y: os)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", bg: Color.blue, angle: 15, os: -100)
    }
}
