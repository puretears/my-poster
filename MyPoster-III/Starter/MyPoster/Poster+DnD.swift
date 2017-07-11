
import UIKit

extension ViewController: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction,
                         sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction,
                         performDrop session: UIDropSession) {
        // 1. Get drop location
        let location = session.location(in: poster)
        
        // 2. Perform actions
        session.loadObjects(ofClass: UIColor.self, completion: {
            guard let color = $0.first as? UIColor else { return }
            
            if location.y < self.poster.bounds.midY {
                self.titleColor = color
                self.drawPoster()
            }
        })
    }
}
