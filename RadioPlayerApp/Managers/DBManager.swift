//
//  DBManager.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/12/24.
//

import CoreData
import UIKit

class DBManager {
    static let shared = DBManager()
    var context: NSManagedObjectContext!
    
    private init() {}
    
    func setContext(_ context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getSQLiteFilePath() -> String? {
        let urls = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        let sqlitePath = urls[0].appendingPathComponent("FinanceApp.sqlite").path
        return sqlitePath
    }
}
