import XCTest
import MacroTesting

@testable import jLagunaDevMacroMacros

final class SceneSnapshotUITestMacroTests: XCTestCase {
    
    func testMacro() {
      assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest(scene: "CharactersListView(store: store)")
        final class CharactersListViewTests: XCTestCase {
            
        }
        """
      } expansion: {
          """
          final class CharactersListViewTests: XCTestCase {

              
          func test_charactersListViewStoreStore_xState_iPhoneSe_light_snapshot() {
              
              assertSnapshot(
              
                  matching: CharactersListView(store: store),
              
                  as: .image(
              
                      layout: .device(config: .iPhoneSe),
              
                      traits: .init(userInterfaceStyle: .light)
              
                  )
              
              )
              
          }

              
          func test_charactersListViewStoreStore_xState_iPhoneSe_dark_snapshot() {
              
              assertSnapshot(
              
                  matching: CharactersListView(store: store),
              
                  as: .image(
              
                      layout: .device(config: .iPhoneSe),
              
                      traits: .init(userInterfaceStyle: .dark)
              
                  )
              
              )
              
          }

              
          func test_charactersListViewStoreStore_xState_iPhone13Mini_light_snapshot() {
              
              assertSnapshot(
              
                  matching: CharactersListView(store: store),
              
                  as: .image(
              
                      layout: .device(config: .iPhone13Mini),
              
                      traits: .init(userInterfaceStyle: .light)
              
                  )
              
              )
              
          }

              
          func test_charactersListViewStoreStore_xState_iPhone13Mini_dark_snapshot() {
              
              assertSnapshot(
              
                  matching: CharactersListView(store: store),
              
                  as: .image(
              
                      layout: .device(config: .iPhone13Mini),
              
                      traits: .init(userInterfaceStyle: .dark)
              
                  )
              
              )
              
          }

              
          func test_charactersListViewStoreStore_xState_iPhone13Pro_light_snapshot() {
              
              assertSnapshot(
              
                  matching: CharactersListView(store: store),
              
                  as: .image(
              
                      layout: .device(config: .iPhone13Pro),
              
                      traits: .init(userInterfaceStyle: .light)
              
                  )
              
              )
              
          }

              
          func test_charactersListViewStoreStore_xState_iPhone13Pro_dark_snapshot() {
              
              assertSnapshot(
              
                  matching: CharactersListView(store: store),
              
                  as: .image(
              
                      layout: .device(config: .iPhone13Pro),
              
                      traits: .init(userInterfaceStyle: .dark)
              
                  )
              
              )
              
          }

              
          func test_charactersListViewStoreStore_xState_iPhone13ProMax_light_snapshot() {
              
              assertSnapshot(
              
                  matching: CharactersListView(store: store),
              
                  as: .image(
              
                      layout: .device(config: .iPhone13ProMax),
              
                      traits: .init(userInterfaceStyle: .light)
              
                  )
              
              )
              
          }

              
          func test_charactersListViewStoreStore_xState_iPhone13ProMax_dark_snapshot() {
              
              assertSnapshot(
              
                  matching: CharactersListView(store: store),
              
                  as: .image(
              
                      layout: .device(config: .iPhone13ProMax),
              
                      traits: .init(userInterfaceStyle: .dark)
              
                  )
              
              )
              
          }
              
          }
          """
      }
    }
    
    func testMacroRequiredSceneError() {
        assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest
        final class CharactersListViewTests: XCTestCase {
            
        }
        """
        } diagnostics: {
            """
            @SceneSnapshotUITest
            ┬───────────────────
            ╰─ 🛑 Required scene param.
            final class CharactersListViewTests: XCTestCase {
                
            }
            """
        }
    }
    
    func testMacroSceneInvalidTypeError() {
        assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest(scene: 2)
        final class CharactersListViewTests: XCTestCase {
            
        }
        """
        } diagnostics: {
            """
            @SceneSnapshotUITest(scene: 2)
            ┬─────────────────────────────
            ╰─ 🛑 Scene param must be a String.
            final class CharactersListViewTests: XCTestCase {
                
            }
            """
        }
    }
    
    func testMacroSceneEmptyError() {
        assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest(scene: "")
        final class CharactersListViewTests: XCTestCase {
            
        }
        """
        } diagnostics: {
            """
            @SceneSnapshotUITest(scene: "")
            ┬──────────────────────────────
            ╰─ 🛑 Scene param can not be empty.
            final class CharactersListViewTests: XCTestCase {
                
            }
            """
        }
    }
}
