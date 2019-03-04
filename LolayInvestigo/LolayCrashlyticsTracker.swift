//
//  Copyright © 2019 Lolay, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Crashlytics

public class LolayCrashlyticsTracker: LolayBaseTracker {
    override public func setIdentifier(_ identifier: String) {
        Crashlytics.sharedInstance().setUserIdentifier(identifier)
    }
    
    override public func setEmail(_ email: String) {
        Crashlytics.sharedInstance().setUserEmail(email)
    }
    
    override public func setName(_ name: String) {
        Crashlytics.sharedInstance().setUserName(name)
    }
    
    override public func setGlobalParameters(_ globalParameters: [String:String]) {
        let crashlytics = Crashlytics.sharedInstance()
        for (key, value) in globalParameters {
            crashlytics.setObjectValue(value, forKey: key)
        }
    }
    
    override public func setGlobalParameter(_ value: String, forKey key:String) {
        Crashlytics.sharedInstance().setObjectValue(value, forKey: key)
    }
    
    override public func removeGlobalParameterForKey(_ key:String) {
        Crashlytics.sharedInstance().setObjectValue(nil, forKey: key)
    }
    
    override public func logEvent(_ name: String) {
        Answers.logCustomEvent(withName: name, customAttributes: nil)
    }
    
    override public func logEvent(_ name: String, withDictionary dictionary: [String:String]) {
        Answers.logCustomEvent(withName: name, customAttributes: dictionary)
    }
    
    override public func logPage(_ name: String) {
        Answers.logCustomEvent(withName: name + "-page", customAttributes: nil)
    }
    
    override public func logPage(_ name: String, withDictionary dictionary: [String:String]) {
        Answers.logCustomEvent(withName: name + "-page", customAttributes: dictionary)
    }
    
    override public func logError(_ error: Error) {
        Crashlytics.sharedInstance().recordError(error)
    }
    
    override public func logError(_ error: NSError) {
        Crashlytics.sharedInstance().recordError(error)
    }
}
