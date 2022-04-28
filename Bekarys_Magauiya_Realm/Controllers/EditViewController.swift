//
//  EditViewController.swift
//  Bekarys_Magauiya_Realm
//
//  Created by Bekarys Magauiya on 28.04.2022.
//

import UIKit

class EditViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var status = ["Done","In progress","Not done"]
    @IBOutlet weak var taskfield: UITextField!
    
    @IBOutlet weak var desfield: UITextField!
    
    @IBAction func deletebutton(_ sender: UIButton) {
        let vm = RealmManager.shared
        
        vm.delete(index: index!)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var pickerview: UIPickerView!
    
    @IBAction func changebutton(_ sender: UIButton) {
        let vm = RealmManager.shared
        
        vm.update(index: index!, taskname: taskfield.text!, taskdescription: desfield.text!, status: pickerview.selectedRow(inComponent: 0))
        self.navigationController?.popViewController(animated: true)
    }
    
    var task : Todo?

    var index : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerview.delegate=self
        pickerview.dataSource=self
        pickerview.selectRow(0, inComponent: 0, animated: true)
        // Do any additional setup after loading the view.
    }
     
    
    override func viewWillAppear(_ animated: Bool) {
        if let myTask = self.task{
            taskfield.text=myTask.taskname
            desfield.text=myTask.taskdescription
            
        }
    }

}
extension EditViewController{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return status.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return status[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let innfo = pickerView.selectedRow(inComponent: 0)
//        InfoLabel.text = "de"
//    }
}
