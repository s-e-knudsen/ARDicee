//
//  ViewController.swift
//  ARDicee
//
//  Created by Søren Knudsen on 02/03/2018.
//  Copyright © 2018 Søren Knudsen. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //Creating my cube with material and colors + scape.
        //let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
//        let sphere = SCNSphere(radius: 0.2)
//
//        let material = SCNMaterial()
//        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpeg")
//        sphere.materials = [material]
//
//        //Creating the node. This is the possition in 3d space of the cube.
//        let node = SCNNode()
//        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
//
//        node.geometry = sphere
//
//        sceneView.scene.rootNode.addChildNode(node) //Adding the node to the sceen as chlid.
        sceneView.automaticallyUpdatesLighting = true
        
        
                // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
        diceNode.position = SCNVector3(x: 0, y: 0, z: -0.1)
        sceneView.scene.rootNode.addChildNode(diceNode)
        }

 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    

}
