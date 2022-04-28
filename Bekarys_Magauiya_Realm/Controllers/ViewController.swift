//
//  ViewController.swift
//  Bekarys_Magauiya_Realm
//
//  Created by Bekarys Magauiya on 28.04.2022.
//

import UIKit
import RealmSwift
class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var tableView: UITableView!
    let vm = RealmManager.shared
    let realm = try! Realm()
    

    @IBAction func addbutton(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddtaskViewController") as! AddtaskViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    var a = [Todo]()
    override func viewDidLoad() {
        print(vm.tasks)
        super.viewDidLoad()
//        a = vm.loadtasks()
        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
//        self.data.removeAll()
         
         a = vm.loadtasks()
         tableView.reloadData()
            
        
    }

}

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "todocell", for: indexPath)
//        return cell
//        let data = vm.tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = a[indexPath.row].taskname
        cell?.detailTextLabel?.text = a[indexPath.row].taskdescription
        if a[indexPath.row].taskstatus == 0{
            cell?.backgroundColor = UIColor.green
            
        }
        else if a[indexPath.row].taskstatus == 1 {
            cell?.backgroundColor = UIColor.orange
        }
        else{
            cell?.backgroundColor = UIColor.red
        }

        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        vc.task = a[indexPath.row]
        vc.index = indexPath.row

        navigationController?.pushViewController(vc, animated: true)
    }
    
}
