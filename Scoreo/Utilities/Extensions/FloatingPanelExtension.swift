

import Foundation
import FloatingPanel

class FloatingPanelLayoutWithCustomState: FloatingPanelBottomLayout {
    
    override var initialState: FloatingPanelState
    {
        return .full
    }
    
    override var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: getDeviceHeight() - 800, edge: .top, referenceGuide: .superview),
            .half: FloatingPanelLayoutAnchor(absoluteInset: getDeviceHeight() - 600, edge: .top, referenceGuide: .superview),
            .tip: FloatingPanelLayoutAnchor(absoluteInset: getDeviceHeight() - 170, edge: .top, referenceGuide: .superview),
            .custom : FloatingPanelLayoutAnchor(absoluteInset: getDeviceHeight() - 250, edge: .top, referenceGuide: .superview),
        ]
    }
    
    override func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        return 0.0
    }
    
    func getDeviceHeight()-> CGFloat
    {
        return getDeviceSize().height
    }

    func getDeviceSize()-> CGSize
    {
        return UIScreen.main.bounds.size
    }
}

