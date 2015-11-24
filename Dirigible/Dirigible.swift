//
//  Dirigible.swift
//
//  Dirigible is Swift Urban Airship class wrapper
//
//  Created by Ivan Yordanov.
//  Copyright © 2015 Ivan Yordanov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.



import AirshipKit

public class Dirigible : NSObject {
    
    enum ActionsEnum {
        case Add,Update,Remove
    }
    
    //MARK: Singleton
    static let sharedInstance = Dirigible()
    
    override init() {
        
    }
    
    class func takeOff() {
        UAirship.takeOff()
        uaPush().userPushNotificationsEnabled = true
    }
    
    //MARK: Tags setup
    class func tagSetup(tags : [String], action: ActionsEnum) {
        switch action {
        case .Add:
            if tags.count > 1 {
                uaPush().addTags(tags)
            } else {
                uaPush().addTag(tags[0])
            }
            
        case .Remove:
            if tags.count > 1 {
                uaPush().removeTags(tags)
            } else {
                uaPush().removeTag(tags[0])
            }
            
        case .Update: break
            
        }
        
        
        update()
    }
    
    //MARK: Alias methods
    class func aliasSetup(alias : String, action: ActionsEnum) {
        
        switch action {
        case .Add,.Update:
            uaPush().alias = alias
        
        case .Remove:
            uaPush().alias = nil
        }
        
        update()
    }
    
    //MARK: private class methods
    private class func uaPush() -> UAPush {
        return UAirship.push()
    }
    
    private class func update(){
        uaPush().updateRegistration()
    }
    
    
    //MARK: Class desription
    class func desc() -> String {
        return "Dirigible is Swift Urban Airship class wrapper."
    }
    
}
