//
//  Subsurface.swift
//  Subsurface
//
//  Created by Chris Joel on 12/20/21.
//

import SwiftUI

public struct SubsurfaceView: UIViewControllerRepresentable {
    public init(speed: Float = 1.0, density: Float = 1.0, corner_radius: Float = 0.0) {
        self.speed = speed
        self.density = density
        self.corner_radius = corner_radius
    }
    
    public typealias UIViewControllerType = SubsurfaceUIViewController
    
    var speed: Float = 1.0
    var density: Float = 1.0
    var corner_radius: Float = 0.0
    
    public func makeUIViewController(context: Context) -> SubsurfaceUIViewController {
        let subsurface = SubsurfaceUIViewController()
        return subsurface
    }

    public func updateUIViewController(_ controller: SubsurfaceUIViewController, context: Context) {
        //print("Subsurface UIViewControllerRepresentable updateUIViewController (not yet implemented)")
        print("Updating speed:", self.speed)
        controller.configureSubsurface(self.density, speed: self.speed, corner_radius: self.corner_radius)
    }
    
}

struct SubsurfaceView_Previews: PreviewProvider {
    static var previews: some View {
        SubsurfaceView()
    }
}

