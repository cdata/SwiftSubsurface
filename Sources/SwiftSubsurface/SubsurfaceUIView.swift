//
//  SubsurfaceUIView.swift
//  Subsurface
//
//  Created by Chris Joel on 12/20/21.
//

import UIKit
import Foundation

public class SubsurfaceUIView: UIView {
    public override class var layerClass: AnyClass {
        return CAMetalLayer.self
    }
    public override func awakeFromNib() {
        super.awakeFromNib()
        configLayer()
    }
    private func configLayer() {
        guard let layer = self.layer as? CAMetalLayer else {
            return
        }
        
        layer.presentsWithTransaction = false
        layer.framebufferOnly = true
        layer.contentsScale = UIScreen.main.nativeScale
        layer.removeAllAnimations()
        self.contentScaleFactor = UIScreen.main.nativeScale
    }
}


