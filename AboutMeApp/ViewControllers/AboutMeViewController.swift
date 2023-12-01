//
//  AboutMeViewController.swift
//  AboutMeApp
//
//  Created by Егор Аблогин on 30.11.2023.
//

import UIKit

final class AboutMeViewController: UIViewController {
    
    @IBOutlet weak var personPhoto: UIImageView!
    @IBOutlet weak var personInfoStack: UIStackView!
    
    private let primaryColor = UIColor.systemPink
    private let secondaryColor = UIColor.purple
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradient(topColor: primaryColor, bottomColor: secondaryColor)
        getImage(forURL: user?.userInfo.personPhotoURL)
        setPersonInfoStack(for: personInfoStack)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.layer.zPosition = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let personInfoVC = segue.destination as? PersonInfoViewController
        personInfoVC?.person = user?.userInfo
        
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    
    private func getImage(forURL url: URL?) {
        if let data = try? Data(contentsOf: url!) {
            personPhoto.image = UIImage(data: data)
        }
    }
    
    
    private func setPersonInfoStack(for infoStack: UIStackView) {
        infoStack.subviews.forEach { substack in
            if let subviews = substack as? UIStackView {
                subviews.subviews.filter {$0.tag > 0}.forEach { view in
                    let label = view as? UILabel
                    
                    guard let user else {return}
                    
                    label?.text = switch label?.tag {
                        case 1:
                            user.userInfo.name
                        case 2:
                            user.userInfo.surname
                        case 3:
                            user.userInfo.age.formatted()
                        case 4:
                            user.userInfo.company
                        default:
                            user.userInfo.position
                    }
                }
            }
        }
    }
    
}
