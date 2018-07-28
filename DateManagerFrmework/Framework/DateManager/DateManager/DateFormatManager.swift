//
//  DateFormatManager.swift
//  DateManager
//
//  Created by Harish on 29/07/18.
//  Copyright © 2018 Harry. All rights reserved.
//

import UIKit

public class DateFormatManager: NSObject {

    public override init() {
        super.init()
    }
    public func methodDateFromString(stringDate:String,stringDateFormatter:String)->NSDate{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = stringDateFormatter
        
        let date = dateFormatter.date(from: stringDate)
        return date! as NSDate
    }
    
    public func methodStringFromDate(dateFromString:NSDate,stringDateFormatter:String )->String{
        
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.dateFormat = stringDateFormatter
        dateFormatter.locale = tempLocale
        let dateString = dateFormatter.string(from: dateFromString as Date)
        
        return dateString
    }
}
