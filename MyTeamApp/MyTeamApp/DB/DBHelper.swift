//
//  DBHelper.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/15.
//

import Foundation
import SQLite3

class DBHelper {
    
    static let shared = DBHelper()
    
    var db : OpaquePointer?
    
    let databaseName = "TeamDB.sqlite"
    
    init() {
        self.db = createDB()
    }
    
    deinit {
        sqlite3_close(db)
    }
    
    private func onSQLErrorPrintMessage() {
        
    }
    
    private func createDB() -> OpaquePointer? {
        return nil
    }
    
}
