//
//  SubsurfaceUIViewController.swift
//  Subsurface
//
//  Created by Chris Joel on 12/20/21.
//

import UIKit
import Subsurface

public class SubsurfaceUIViewController: UIViewController {
    var rust_pointer: OpaquePointer?
    
    var speed: Float = 1.0
    var density: Float = 1.0
    var corner_radius: Float = 0.0
    
    lazy var displayLink: CADisplayLink = {
        let link = CADisplayLink.init(target: self, selector: #selector(enterFrame))
        link.frameInterval = 10;
        return link
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view = SubsurfaceUIView()
        
        let uiViewPointer = UnsafeMutableRawPointer(Unmanaged.passRetained(self.view).toOpaque())
        let metalLayerPointer = UnsafeMutableRawPointer(Unmanaged.passRetained(self.view.layer).toOpaque())
        
        let ios_native = IOSNative(view: uiViewPointer, metal_layer: metalLayerPointer, dispatch: dispatch);
        
        self.rust_pointer = create_subsurface(ios_native);
        
        self.displayLink.add(to: .current, forMode: .default)
        self.displayLink.isPaused = true
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.displayLink.isPaused = false
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        displayLink.isPaused = true
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let subsurface = self.rust_pointer else {
            return
        }
        update_subsurface_layout(subsurface)
    }
    
    func configureSubsurface(_ density: Float, speed: Float, corner_radius: Float) {
        guard let subsurface = self.rust_pointer else {
            return
        }

        if self.density != density {
            self.density = density
            set_subsurface_density(subsurface, density)
        }
        
        if self.speed != speed {
            self.speed = speed
            set_subsurface_speed(subsurface, speed)
        }
        
        if self.corner_radius != corner_radius {
            self.corner_radius = corner_radius
            set_subsurface_corner_radius(subsurface, corner_radius)
        }
    }
    
    @objc func enterFrame() {
        guard let subsurface = self.rust_pointer else {
            return
        }
        enter_subsurface_frame(subsurface)
    }

}

func dispatch(arg: Int32) {
    // TODO
}
