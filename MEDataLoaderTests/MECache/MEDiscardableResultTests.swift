//
//  MEDiscardableResultTests.swift
//  MEDataLoaderTests
//
//  Created by Mohamed Mostafa on 8/10/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import MEDataLoader

class MEDiscardableResultTests: QuickSpec {
    override func spec() {
        
        var discardableData: MEDiscardableData!
        let image = UIImage(named: "1", in: Bundle(for:MECacheTests.self), compatibleWith: nil)
        
        describe("testing MEDiscardableData") {
            
            context("having nil data") {
                beforeEach {
                    discardableData = MEDiscardableData(data: nil)
                }
                
                it("Content is Discardable") {
                    expect(discardableData.beginContentAccess()).to(equal(false))
                    expect(discardableData.isContentDiscarded()).to(equal(true))
                }
            }
            
            context("having valid data") {
                beforeEach {
                    discardableData = MEDiscardableData(data: image?.jpegData(compressionQuality: 0)!)
                }
                
                it("Content is not Discardable") {
                    expect(discardableData.beginContentAccess()).to(equal(true))
                    expect(discardableData.isContentDiscarded()).to(equal(false))
                }
                
                
                it("increases & decrease accessedCounter") {
                    expect(discardableData.accessedCounter).to(equal(0))
                    
                    _ = discardableData.beginContentAccess()
                    expect(discardableData.accessedCounter).to(equal(1))

                    _ = discardableData.beginContentAccess()
                    expect(discardableData.accessedCounter).to(equal(2))
                    
                    discardableData.endContentAccess()
                    expect(discardableData.accessedCounter).to(equal(1))
                    
                    discardableData.endContentAccess()
                    expect(discardableData.accessedCounter).to(equal(0))
                }
            }
        }
    }
}
