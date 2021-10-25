//
//  SwiftUIPreview.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/10/25.
//  Copyright © 2021 ludus. All rights reserved.
//

import SwiftUI

struct Wrap<Wrapped: UIView>: UIViewRepresentable {
    typealias Updater = (Wrapped, Context) -> Void

    var makeView: () -> Wrapped
    var update: (Wrapped, Context) -> Void

    init(_ makeView: @escaping @autoclosure () -> Wrapped,
         updater update: @escaping Updater) {
        self.makeView = makeView
        self.update = update
    }

    func makeUIView(context: Context) -> Wrapped {
        makeView()
    }

    func updateUIView(_ view: Wrapped, context: Context) {
        update(view, context)
    }
}

extension Wrap {
    init(_ makeView: @escaping @autoclosure () -> Wrapped,
         updater update: @escaping (Wrapped) -> Void) {
        self.makeView = makeView
        self.update = { view, _ in update(view) }
    }

    init(_ makeView: @escaping @autoclosure () -> Wrapped) {
        self.makeView = makeView
        self.update = { _, _ in }
    }
}

struct SwiftUIPreview: PreviewProvider {
    static let view: UIView = {
        let view = UIImageView(image: UIImage(systemName: "person.fill"))
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    static var previews: some View {
        Wrap(view)
            .frame(width: 414, height: 200)
    }
}
