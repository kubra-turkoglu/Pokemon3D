//
//  PokeManager.swift
//  Pokemon3D
//
//  Created by Kubra Bozdogan on 7/2/25.
//

import Foundation
import SceneKit
import ARKit

struct PokeManager {
    
    let pokeModel = PokeModel()
    
    func node(for imageAnchor: ARImageAnchor) -> SCNNode {
        let node = SCNNode()
        let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
        plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles.x = -.pi / 2
        node.addChildNode(planeNode)
        
        if let imageName = imageAnchor.referenceImage.name,
           let modelPath = pokeModel.modelPaths[imageName],
           let pokeScene = SCNScene(named: modelPath),
           let pokeNode = pokeScene.rootNode.childNodes.first {
            planeNode.addChildNode(pokeNode)
            
            //This code was defined as a comment for using card on pc but if you want user to use real cards, you should remove from comment.
//            pokeNode.eulerAngles.x = .pi / 2
            
            //This code is an example to understand the above code well. It shows exactly how the above code works.
            //            if imageAnchor.referenceImage.name == "butterfreeCard" {
            //                if let pokeScene = SCNScene(named: "art.scnassets/Butterfree/Butterfree.scn") {
            //                    if let pokeNode = pokeScene.rootNode.childNodes.first {
            //                        pokeNode.eulerAngles.x = .pi / 2
            //                        planeNode.addChildNode(pokeNode)
            //                    }
            //                }
            //            }
        }
        return node
    }
}
