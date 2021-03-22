import UIKit
import CoreData
class Upload_Score: UIViewController {
    @IBOutlet var Inactive_Section : UITextField!
    @IBOutlet var Active_Section : UITextField!
    @IBOutlet var Reading_Section: UITextField!
    @IBOutlet var Grammar_Section: UITextField!
    @IBOutlet var OverallValue: UITextField!
    @IBOutlet var scoreLabel: UILabel!
    var score = Int()
    override func viewDidLoad() {
        score = 0
        getData()
        scoreLabel.text = "\(score)"
        super.viewDidLoad()

    }
    @IBAction func didTapSave(){
        score  = Int(OverallValue.text!)!
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Scores", in: context)
        let newEntity = NSManagedObject(entity : entity!,insertInto :context)
        newEntity.setValue(score,forKey: "overallScore")
        do {
            try context.save()
            print( "saved" )
                    
        }catch {
            print("unable to save")
                    
        }
        
        let needed_score = get_reco()
        NotificationCenter.default.post(name: Notification.Name("text"), object: needed_score)
            dismiss(animated: true, completion: nil)
        }


    func get_reco() -> String {
        let Inactive: Int? = Int(Inactive_Section.text!)
        let Active: Int? = Int(Active_Section.text!)
        let Reading: Int? = Int(Reading_Section.text!)
        let Grammar: Int? = Int(Grammar_Section.text!)
        let alertController = UIAlertController(title: "Invalid Score", message: "Please enter correct score type", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        if Inactive! > 20 || Inactive! < 0 || Active! > 40 || Active! < 0 || Reading! > 52 || Reading! < 0 || Grammar! > 44 || Grammar! < 0 {
            self.present(alertController, animated: true, completion: nil)
        }
        if max(20 - Inactive! , 40 - Active!,  52 - Reading!,  44 - Grammar!) == 20 - Inactive! {
            return "Need to improve Inactive Section"
        }
        else if max(20 - Inactive! ,52 - Reading!, 44 - Grammar!, 40 - Active!) == 40 - Active! {
            return "Need to improve on Active Section"
        }
        else if max(20 - Inactive! , 52 - Reading!, 44 - Grammar! , 40 - Active!) == 52 - Reading! {
            return "Need to improve on Reading Section"
        }
        else {
            return "Need to improve on Grammar Section"
        }
    }
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Scores")
            request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch (request)
            for data in result as! [NSManagedObject]
            {
                score = data.value(forKey: "overallScore") as! Int
            }
            
        } catch {
            print("failed lolz")
        
        }
        
       }
}
