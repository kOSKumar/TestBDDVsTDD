# TestBDDVsTDD

TDD:---------

import XCTest
@testable import Proj

class SampleTests: XCTestCase {

  func testGunCanShootIfItHasBullets() {
    // 1. Setup: create a gun with 1 bullet
    let gun = Gun(bullets: 1)
    // 2. Execution: shoot
    gun.shoot()
    // 3. Expectation: expect Gun to be out of bullet
    XCTAssertTrue(gun.bullets == 0, "expect Gun to be out of bullet")
  }

  func testGunCannotShootIfItHasNoBullet() {
    // 1. Setup: create a gun with no bullet
    let gun = Gun(bullets: 0)
    // 2. Execution: shoot
    gun.shoot()
    // 3. Expectation: expect Gun to not shoot anything
    XCTAssertTrue(gun.bullets == 0, "expect the number of bullets to remain the same")
  }
  
  
 -----------------------
 import Foundation

class Gun : NSObject {

  var bullets = 0

  init(bullets: Int) {
    self.bullets = bullets
  }

  func shoot() {
    if self.bullets > 0 {
      self.bullets -= 1
    }
  }

}
----------------------------

class Gun : NSObject {

  var bullets = 0
  // add isLocked property here
  var isLocked = true

  //...
}

----------------------------
The idea is: you describe how your class would behave from the top down to the bottom. You describe the big picture first, then go down to the nitty gritty.


override func spec() {
  super.spec()

  describe("shoot") {
    context("has bullets") {
      context("is unlocked") {
        it("can shoot") {

        }
      }

      context("is locked") {
        it("cannot shoot") {

        }
      }
    }

    context("has no bullet") {
      it("cannot shoot") {

      }
    }
  }

  describe("lock") {
    it("locks the Gun") {

    }
  }

  describe("unlock") {
    it("unlocks the Gun") {

    }
  }
}
----------

describe("shoot") {
  context("has bullets") {
    context("is unlocked") {
      it("can shoot") {
        // 1. Setup: create a gun with 1 bullet
        let gun = Gun(bullets: 1)
        // make sure it is unlocked
        gun.isLocked = false
        // 2. Execution: call the shoot method
        gun.shoot()
        // 3. Expectation: expect the gun to be out of bullet
        XCTAssertTrue(gun.bullets == 0, "expect Gun to be out of bullet")
      }
    }
    
    ------------------
    
    describe("shoot") {
  context("has bullets") {
    //...

    context("is locked") {
      it("cannot shoot") {
        let gun = Gun(bullets: 1)
        // the gun is locked
        gun.isLocked = true
        gun.shoot()
        XCTAssertTrue(gun.bullets == 1, "expect Gun to not shoot anything")
      }
    }
    ------------------------------------
    
    class Gun : NSObject {
  //...

  func shoot() {
    if self.bullets > 0 {
      if !isLocked {
        self.bullets -= 1
      }
    }
  }

  //...
}
----------------------------------------

class GunSpec : QuickSpec {
  override func spec() {
    super.spec()

    describe("shoot") {
      context("has bullets") {
        context("is unlocked") {
          it("can shoot") {
            let gun = Gun(bullets: 1)
            gun.isLocked = false
            gun.shoot()
            XCTAssertTrue(gun.bullets == 0, "expect Gun to be out of bullet")
          }
        }

        context("is locked") {
          it("cannot shoot") {
            let gun = Gun(bullets: 1)
            gun.isLocked = true
            gun.shoot()
            XCTAssertTrue(gun.bullets == 1, "expect Gun to not shoot anything")
          }
        }
      }

      context("has no bullet") {
        it("cannot shoot") {
            let gun = Gun(bullets: 0)
            gun.shoot()
            XCTAssertTrue(gun.bullets == 0, "expect Gun to not shoot anything")
        }
      }
    }

    describe("lock") {
      it("locks the Gun") {
        let gun = Gun(bullets: 2)
        gun.lock()
        XCTAssertTrue(gun.isLocked, "expect Gun to be locked")
      }
    }

    describe("unlock") {
      it("unlocks the Gun") {
        let gun = Gun(bullets: 2)
        gun.unlock()
        // notice that we use assert False here
        XCTAssertFalse(gun.isLocked, "expect Gun to be unlocked")
      }
    }

  }
}

-------------------------------

class Gun : NSObject {

  var bullets = 0
  var isLocked = true

  init(bullets: Int) {
    self.bullets = bullets
  }

  func shoot() {
    if self.bullets > 0 {
      if !isLocked {
        self.bullets -= 1
      }
    }
  }

  func lock() {
    isLocked = true
  }

  func unlock() {
    isLocked = false
  }
}
---------------------------------------
    
