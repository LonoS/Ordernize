//
//  StartCellManager.swift
//  Ordernize
//
//  Created by Paul Wiesinger on 12.05.18.
//  Copyright © 2018 Paul Wiesinger. All rights reserved.
//

import UIKit

class CellManager {
    
    var tableView: UITableView?
    var cellData = [CellData]()
    
    init(rootTableView: UITableView){
        self.tableView = rootTableView
    }
    
    func setup(completion: (Bool)->()) {
        // getting the data from the database
        
        // true if there was no error
        completion(true)
    }
    
    
    
    
    func getNumberOfCells() -> Int {
        return cellData.count
    }
    
    
    func getCell(forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let data = cellData[indexPath.row]
        if  data.type == CellType.inactive {
            
            let cell = tableView?.dequeueReusableCell(withIdentifier: "cell_inactive", for: indexPath) as! InactiveTableViewCell
            
            cell.gruppenname.text = data.gruppenname
            cell.gruppenbeschreibung.text = data.gruppenbeschreibung
            cell.teilnehmer.text = buildTeilnehmerString(number: data.teilnehmer)
            
            if let letzteBestellung = data.letzteBestellung {
                cell.statuslamp.backgroundColor = calcStatusLampColor(lastOrder: letzteBestellung)
            } else {
                cell.statuslamp.backgroundColor = UIColor.statusRed
            }
            
            return cell
        } else {
            let cell = tableView?.dequeueReusableCell(withIdentifier: "cell_active", for: indexPath) as! ActiveTableViewCell
            
            cell.gruppenname.text = data.gruppenname
            cell.gruppenbeschreibung.text = data.gruppenbeschreibung
            cell.teilnehmer.text = buildTeilnehmerString(number: data.teilnehmer)
            
            cell.remainingTime.text = calcTime(uhrzeit: data.deadline!)
            
            
            
            
            
            return cell
        }
    }
    
    
    
    fileprivate func buildTeilnehmerString(number: Int) -> String {
        return "\(number) Teilnehmer"
    }
    
    fileprivate func calcStatusLampColor(lastOrder: Date) -> UIColor {
        if lastOrder.timeIntervalSinceNow > 60*60*4 {
            return UIColor.statusRed
        } else {
            return UIColor.statusOrange
        }
    }
    
    fileprivate func calcTime(uhrzeit: Date) -> String {
        var seconds = uhrzeit.timeIntervalSinceNow
        
        let minuten = seconds / 60
        seconds = seconds.truncatingRemainder(dividingBy: 60)
        let stunden = seconds
        
        
        
        
        
        return "Bestellende in \(stunden) Stunden \(minuten) Minuten"
    }
}
