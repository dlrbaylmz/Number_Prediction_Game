//  Created by Dilruba YILMAZ on 24.03.2024.


import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var kullanicisayi: UITextField!
    @IBOutlet weak var kullanicimg: UIImageView!
    @IBOutlet weak var kullanicikaydet: UIButton!
    
    @IBOutlet weak var tahminsayi: UITextField!
    @IBOutlet weak var tahminimg: UIImageView!
    @IBOutlet weak var tahminkaydet: UIButton!
    
    @IBOutlet weak var yildiz1: UIImageView!
    @IBOutlet weak var yildiz2: UIImageView!
    @IBOutlet weak var yildiz3: UIImageView!
    @IBOutlet weak var yildiz4: UIImageView!
    @IBOutlet weak var yildiz5: UIImageView!
    
    @IBOutlet weak var lblsonuc: UILabel!
    
    var yildizlar : [UIImageView] = [UIImageView]()
    
    let maxdeneme : Int = 5
    var denemesayisi : Int = -1
    var hedefsayi : Int = -1
    var oyunbasarili : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        yildizlar = [yildiz1,yildiz2,yildiz3,yildiz4,yildiz5]
        kullanicimg.isHidden = true  //resimleri ilk açılışta gizleme
        tahminimg.isHidden = true
        tahminkaydet.isEnabled = false // kaydet butonu çalışmasın
        kullanicisayi.isSecureTextEntry = true // sayıyı gizledi
        lblsonuc.text = ""
        
        
        
        
    }

    @IBAction func btnkaydet(_ sender: UIButton) {
    }
    
    
    @IBAction func btndene(_ sender: UIButton) {
        
    }
    
    
}

