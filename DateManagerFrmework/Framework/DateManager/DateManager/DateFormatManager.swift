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
    
    public func methodForGetCurrentDateString(stringDateFormatter:String)->String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = stringDateFormatter
        let stringCurrentDate = dateFormatter.string(from: Date())
        return stringCurrentDate
    
    }
    
    public func methodForGetCurrentYear()->Int{
    
        let date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day , .month , .year], from: date)
        return components.year!
    
    }
    
    public func methodForGetCurrentMonth()->Int{
    
        let date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day , .month , .year], from: date)
        return components.month!
    
    }
    
    public func methodForGetCurrentDay()->Int{

        let date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day , .month , .year], from: date)
        return components.day!

    }
    public func methodForGetDaysBetweenDays(_ fromDate:String, toDate:String,stringDateFormatter:String) -> String {
        
        let dateFrom = self.methodDateFromString(stringDate: fromDate, stringDateFormatter: stringDateFormatter)
        let dateTo = self.methodDateFromString(stringDate: toDate, stringDateFormatter: stringDateFormatter)
        
        let calendar: Calendar = Calendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: dateFrom as Date)
        let date2 = calendar.startOfDay(for: dateTo as Date)
        
        let flags = NSCalendar.Unit.day
        let components = (calendar as NSCalendar).components(flags, from: date1, to: date2, options: [])
        
        let numberOfMonthsAgo = components.day!/30 as Int
        let numberOfDaysAgo = components.day!%30 as Int
        //let numberOfHourssAgo = components.hour! as Int
        
        
        var stringDaysRemainingMessage : String
        
        if numberOfMonthsAgo<1 {
            
            stringDaysRemainingMessage = String(format:"%d Days ago",numberOfDaysAgo)
            
            if numberOfDaysAgo == 0 {
                stringDaysRemainingMessage = String(format:"Today")
            }else if numberOfDaysAgo == 1 {
                stringDaysRemainingMessage = String(format:"%d Day ago",numberOfDaysAgo)
            }else{
                stringDaysRemainingMessage = String(format:"%d Days ago",numberOfDaysAgo)
            }
            
        }else{
            
            if numberOfMonthsAgo==1 {
                stringDaysRemainingMessage = String(format:"%d month ago",numberOfMonthsAgo)
            }else{
                stringDaysRemainingMessage = String(format:"%d months ago",numberOfMonthsAgo)
            }
        }
        
        return stringDaysRemainingMessage
    }
    // Method to save date and time in uilabel
    public func methodForCompareDate(_ stringJoiningDate:String,_ dateFormatter:String,stringSelectedDate:Date)->Bool{
        
        let now = stringSelectedDate
        let olderDate = self.methodDateFromString(stringDate: stringJoiningDate, stringDateFormatter: dateFormatter)
        let order = (Calendar.current as NSCalendar).compare(olderDate as Date, to: now,
                                                             toUnitGranularity: .hour)
        
        switch order {
        case .orderedDescending:
            return false
        case .orderedAscending:
            return true
        case .orderedSame:
            return true
            
        }
        
    }
}
