//
//  AddtaskViewController.swift
//  Bekarys_Magauiya_Realm
//
//  Created by Bekarys Magauiya on 28.04.2022.
//

import UIKit

class AddtaskViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    var status = ["Done","In progress","Not done"]

    
    @IBOutlet weak var taskField: UITextField!
    
    
    @IBOutlet weak var DesField: UITextField!
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    @IBAction func Savebutton(_ sender: UIButton) {
    
        let vm = RealmManager.shared
        vm.saveTask(taskname:taskField.text!,taskdescription:DesField.text!,status:PickerView.selectedRow(inComponent: 0))
        
        self.navigationController?.popViewController(animated: true)
  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PickerView.dataSource=self
        PickerView.delegate=self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AddtaskViewController{
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
