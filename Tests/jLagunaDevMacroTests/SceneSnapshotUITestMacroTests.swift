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

              
          func test_charactersListViewStoreStore_xState_iPhone15Pro_light_snapshot() {
              
              assertSnapshot(
              
                  matching: CharactersListView(store: store),
              
                  as: .image(
              
                      layout: .device(config: .iPhone15Pro),
              
                      traits: .init(userInterfaceStyle: .light)
              
                  )
              
              )
              
          }

              
          func test_charactersListViewStoreStore_xState_iPhone15Pro_dark_snapshot() {
              
              assertSnapshot(
              
                  matching: CharactersListView(store: store),
              
                  as: .image(
              
                      layout: .device(config: .iPhone15Pro),
              
                      traits: .init(userInterfaceStyle: .dark)
              
                  )
              
              )
              
          }
              
          }
          """
      }
    }
    
    func testMacroError() {
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
            ╰─ 🛑 sceneNotFound
            final class CharactersListViewTests: XCTestCase {
                
            }
            """
        }
    }
}
