//
//  Logger.swift
//  Appetite
//
//  Created by Adrian on 12/23/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

class Logger {
  
  static let instance = Logger()
  
  class func print(_ object: Any) {
    //if DEBUG
    Swift.print(object, terminator: "\n")
    //endif
  }
  
  // Class
  class func logDebug(_ object: Any, identifier: String = "") {
    logLine(object, logType: LogType.debug, identifier: identifier)
  }
  
  class func logInfo(_ object: Any, identifier: String = "") {
    logLine(object, logType: LogType.info, identifier: identifier)
  }
  
  class func logWarn(_ object: Any, identifier: String = "") {
    logLine(object, logType: LogType.warn, identifier: identifier)
  }
  
  class func logError(_ object: Any, identifier: String = "") {
    logLine(object, logType: LogType.error, identifier: identifier)
  }
  
  class func logLine(_ object: Any,  logType: LogType, identifier: String = "") {
    print("[\(logType.id) @ \(identifier)] - \(logType.id): \(object)")
  }
  
  // Instance
  func logDebug(_ object: Any, identifier: String = "") {
    logLine(object, logType: LogType.debug, identifier: identifier)
  }
  
  func logInfo(_ object: Any, identifier: String = "") {
    logLine(object, logType: LogType.info, identifier: identifier)
  }
  
  func logWarn(_ object: Any, identifier: String = "") {
    logLine(object, logType: LogType.warn, identifier: identifier)
  }
  
  func logError(_ object: Any, identifier: String = "") {
    logLine(object, logType: LogType.error, identifier: identifier)
  }
  
  func logLine(_ object: Any,  logType: LogType, identifier: String = "") {
    print("[\(logType.id) @ \(identifier)] - \(logType.id): \(object)")
  }
  
  enum LogType {
    case debug
    case info
    case warn
    case error
    
    fileprivate static let value: [LogType: String] = [
      debug: "debug",
      info: "info",
      warn: "warn",
      error: "error"
    ]
    
    var id: String {
      return LogType.value[self]!;
    }
  }
  
}

