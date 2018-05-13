//
//  CellData.swift
//  Ordernize
//
//  Created by Paul Wiesinger on 12.05.18.
//  Copyright © 2018 Paul Wiesinger. All rights reserved.
//

import Foundation


enum CellType {
    case active
    case inactive
}


struct CellData {
    var gruppenname: String
    var gruppenbeschreibung: String
    var teilnehmer: Int
    var letzteBestellung: Date?
    
    var betrag: Double?
    var activeTeilnehmer: Int?
    var deadline: Date?
    
    var type: CellType
}
