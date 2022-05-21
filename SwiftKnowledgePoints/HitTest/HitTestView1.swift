//
//  HitTestView1.swift
//  SwiftKnowledgePoints
//
//  Created by haili on 2022/3/11.
//

import UIKit

class HitTestView1: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        guard isUserInteractionEnabled else { return nil }
        
        guard !isHidden else { return nil }
        
        guard alpha >= 0.01 else { return nil }
        
        guard self.point(inside: point, with: event) else { return nil }
        
        for subview in subviews.reversed() {
            
            let convertedPoint = subview.convert(point, from: self)
            
            if let candidate = subview.hitTest(convertedPoint, with: event) {
                
                return candidate
                
            }
        }
        return self
    }

}
