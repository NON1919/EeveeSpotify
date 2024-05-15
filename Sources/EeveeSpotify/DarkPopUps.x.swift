import Orion
import UIKit
import SwiftUI

struct DarkPopUps: HookGroup {}

class EncoreLabelHook: ClassHook<UIView> {

    typealias Group = DarkPopUps
    static let targetName = "SPTEncoreLabel"

    func intrinsicContentSize() -> CGSize {

        if String(
            describing: WindowHelper.shared.viewController(for: target)
        ) ~= "SPTEncorePopUpContainer" {

            let label = Dynamic.convert(target.subviews.first!, to: UILabel.self)

            if !(String(describing: target.superview?.superview?.superview) ~= "Primary") {
                label.textColor = .white
            }
        }

        return orig.intrinsicContentSize()
    }
}

class SPTEncorePopUpDialogHook: ClassHook<NSObject> {

    typealias Group = DarkPopUps
    static let targetName = "SPTEncorePopUpDialog"

    func uiView() -> UIView {

        let view = orig.uiView()
        view.backgroundColor = UIColor(Color(hex: "#242424"))

        return view
    }
}
