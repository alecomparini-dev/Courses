import UIKit
import SceneKit
import QuartzCore

class ViewController: UIViewController {
    
    
    var sceneView: SCNView!
    var panoramaNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cria a cena
        let scene = SCNScene()
        
        // Cria a câmera
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.camera?.projectionDirection = .vertical
        scene.rootNode.addChildNode(cameraNode)
        
        // Cria a esfera de visualização
        let panorama = UIImage(named: "panorama.jpg")
        let panoramaMaterial = SCNMaterial()
        panoramaMaterial.diffuse.contents = panorama
        panoramaMaterial.isDoubleSided = true
        
        let panoramaSphere = SCNSphere(radius: 10.0)
        panoramaSphere.segmentCount = 100
        panoramaSphere.firstMaterial = panoramaMaterial
        
        panoramaNode = SCNNode(geometry: panoramaSphere)
        panoramaNode.eulerAngles = SCNVector3(x: 0, y: 0, z: 0)
        scene.rootNode.addChildNode(panoramaNode)
        
        // Cria a view da cena
        sceneView = SCNView(frame: self.view.frame)
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        self.view.addSubview(sceneView)
    }
}
