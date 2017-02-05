//
//  UITableView+Registration.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell(withIdentifier identifier: String, registerNibIfNeededWithNibName nibName: String) -> UITableViewCell? {
        
        guard let cell = dequeueReusableCell(withIdentifier: identifier) else {
            register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: identifier)
            return dequeueReusableCell(withIdentifier: identifier)
        }
        return cell
    }
    
    func dequeueReusableCellRegisterNibIfNeeded(nibName: String) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: nibName, registerNibIfNeededWithNibName: nibName)
    }
    
    func dequeueReusableCellRegisterNibIfNeeded<NibClass>(identifier: String = String(describing: NibClass.self), nibName: String = String(describing: NibClass.self)) -> NibClass? {
        
        return dequeueReusableCell(withIdentifier: identifier,
                                   registerNibIfNeededWithNibName: nibName) as? NibClass
    }
    
    func deququeReusableCellRegisterClassIfNeeded<CellClass>(identifier: String = String(describing: CellClass.self)) -> CellClass?
        where CellClass: AnyObject {
            
            guard let cell = dequeueReusableCell(withIdentifier: identifier) else {
                register(CellClass.self, forCellReuseIdentifier: identifier)
                return dequeueReusableCell(withIdentifier: identifier) as? CellClass
            }
            return cell as? CellClass
    }
}
