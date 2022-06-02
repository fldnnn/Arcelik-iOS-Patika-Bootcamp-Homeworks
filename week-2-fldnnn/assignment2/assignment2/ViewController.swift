//
//  ViewController.swift
//  assignment2


import UIKit
 
protocol myProtocol: AnyObject {
    func myDelegateMethod(logoName: String)
}
 
class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabelView: UILabel!
     
    private var logoName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSegue" {
            let vc = segue.destination as! SecondVC
            vc.delegate = self
            vc.completionHandler = { [weak self] text in
                if text == self?.logoName {
                self?.myLabelView.text = text
            } else {
                self?.myLabelView.text = "Wrong!"
            }
            return
            }
        }
    }
}
 
extension ViewController: myProtocol {
    func myDelegateMethod(logoName: String) {
        myImageView.image = UIImage(named: logoName)
        self.logoName = logoName
    }
}
 

 

