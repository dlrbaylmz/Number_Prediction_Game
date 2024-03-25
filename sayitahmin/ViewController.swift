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
    var denemesayisi : Int = 0
    //tahmin edilmesi gereken sayı
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
        kullanicimg.isHidden = false
        if let t = Int(kullanicisayi.text!){
            hedefsayi = t
            tahminkaydet.isEnabled = true
            kullanicisayi.isEnabled = false
            kullanicikaydet.isEnabled = false
            kullanicimg.image = UIImage(named: "onay")
        }
        else {
            kullanicimg.image = UIImage(named: "hata")
        }
    }
    
    
    @IBAction func btndene(_ sender: UIButton) {
        //kullanıcı oyunu bitirmişse bir şey yapmadan dön
        if oyunbasarili == true || denemesayisi > maxdeneme {
            return
        }
        tahminimg.isHidden = false
        
        if let tahminedilensayi = Int(tahminsayi.text!){
            //kullanıcı düzgün bir sayı girmişse
            denemesayisi+=1
            yildizlar[denemesayisi-1].image = UIImage(named: "bosyildiz")
            if tahminedilensayi > hedefsayi{
                tahminimg.image = UIImage(named: "asagi")
                tahminsayi.textColor = UIColor.red
            }
            else if tahminedilensayi < hedefsayi{
                tahminimg.image = UIImage(named: "yukari")
                tahminsayi.textColor = UIColor.red
            }
            else{
                tahminimg.image = UIImage(named: "tamam")
                tahminkaydet.isEnabled = true
                lblsonuc.text = "DOĞRU TAHMİN!!"
                tahminsayi.textColor = UIColor.green
                kullanicisayi.isSecureTextEntry = false
                oyunbasarili = true
                
                let alertController = UIAlertController(title: "BAŞARILI", message: "Sayıyı Doğru Tahmin Ettin. Tebrikler!!", preferredStyle: UIAlertController.Style.alert)
                
                let okAction = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
                
                return
            }
        }
        else{
            //kullanıcının girdiği değer düzgün değilse
           
            tahminimg.image = UIImage(named: "hata")
        }
        
        if denemesayisi == maxdeneme {
            
            tahminkaydet.isEnabled = false
            tahminimg.image = UIImage(named: "hata")
            lblsonuc.text = "YANLIŞ TAHMİN!!"
            kullanicisayi.isSecureTextEntry = false
            let alertController = UIAlertController(title: "ÜZGÜNÜM", message: "Tahmin hakkın bitti. Tahmin etmen gereken sayı: \(hedefsayi)", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
            
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        
    }
}

