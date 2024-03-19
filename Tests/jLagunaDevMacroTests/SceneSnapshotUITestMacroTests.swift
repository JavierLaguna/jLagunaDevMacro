import XCTest
import MacroTesting

@testable import jLagunaDevMacroMacros

final class SceneSnapshotUITestMacroTests: XCTestCase {
    
    func testMacro() {
      assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest(
            scene: "CharactersListView",
            variants: [
                .init(name: "variantOne", params: "foo: bar", setUp: "setUpOneFunc"),
                 Variant(name: "variantTwo"),
            ]
        )
        final class CharactersListViewTests: XCTestCase {
            
        }
        """
      } expansion: {
          """
          final class CharactersListViewTests: XCTestCase {

              func test_charactersListView_variantOne_image_light_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image
                  )
              }

              func test_charactersListView_variantOne_image_dark_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image
                  )
              }

              func test_charactersListView_variantOne_iPhoneSe_light_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image(
                      layout: .device(config: .iPhoneSe,
                      traits: .init(userInterfaceStyle: .light)
                      )
                      )
              }

              func test_charactersListView_variantOne_iPhoneSe_dark_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image(
                      layout: .device(config: .iPhoneSe,
                      traits: .init(userInterfaceStyle: .dark)
                      )
                      )
              }

              func test_charactersListView_variantOne_iPhone13Mini_light_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image(
                      layout: .device(config: .iPhone13Mini,
                      traits: .init(userInterfaceStyle: .light)
                      )
                      )
              }

              func test_charactersListView_variantOne_iPhone13Mini_dark_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image(
                      layout: .device(config: .iPhone13Mini,
                      traits: .init(userInterfaceStyle: .dark)
                      )
                      )
              }

              func test_charactersListView_variantOne_iPhoneX_light_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image(
                      layout: .device(config: .iPhoneX,
                      traits: .init(userInterfaceStyle: .light)
                      )
                      )
              }

              func test_charactersListView_variantOne_iPhoneX_dark_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image(
                      layout: .device(config: .iPhoneX,
                      traits: .init(userInterfaceStyle: .dark)
                      )
                      )
              }

              func test_charactersListView_variantOne_iPhone13Pro_light_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image(
                      layout: .device(config: .iPhone13Pro,
                      traits: .init(userInterfaceStyle: .light)
                      )
                      )
              }

              func test_charactersListView_variantOne_iPhone13Pro_dark_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image(
                      layout: .device(config: .iPhone13Pro,
                      traits: .init(userInterfaceStyle: .dark)
                      )
                      )
              }

              func test_charactersListView_variantOne_iPhone13ProMax_light_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image(
                      layout: .device(config: .iPhone13ProMax,
                      traits: .init(userInterfaceStyle: .light)
                      )
                      )
              }

              func test_charactersListView_variantOne_iPhone13ProMax_dark_snapshot() {

                  setUpOneFunc()

                  assertSnapshot(
                      matching: CharactersListView(foo: bar),
                      as: .image(
                      layout: .device(config: .iPhone13ProMax,
                      traits: .init(userInterfaceStyle: .dark)
                      )
                      )
              }

              func test_charactersListView_variantTwo_image_light_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image
                  )
              }

              func test_charactersListView_variantTwo_image_dark_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image
                  )
              }

              func test_charactersListView_variantTwo_iPhoneSe_light_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image(
                      layout: .device(config: .iPhoneSe,
                      traits: .init(userInterfaceStyle: .light)
                      )
                      )
              }

              func test_charactersListView_variantTwo_iPhoneSe_dark_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image(
                      layout: .device(config: .iPhoneSe,
                      traits: .init(userInterfaceStyle: .dark)
                      )
                      )
              }

              func test_charactersListView_variantTwo_iPhone13Mini_light_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image(
                      layout: .device(config: .iPhone13Mini,
                      traits: .init(userInterfaceStyle: .light)
                      )
                      )
              }

              func test_charactersListView_variantTwo_iPhone13Mini_dark_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image(
                      layout: .device(config: .iPhone13Mini,
                      traits: .init(userInterfaceStyle: .dark)
                      )
                      )
              }

              func test_charactersListView_variantTwo_iPhoneX_light_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image(
                      layout: .device(config: .iPhoneX,
                      traits: .init(userInterfaceStyle: .light)
                      )
                      )
              }

              func test_charactersListView_variantTwo_iPhoneX_dark_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image(
                      layout: .device(config: .iPhoneX,
                      traits: .init(userInterfaceStyle: .dark)
                      )
                      )
              }

              func test_charactersListView_variantTwo_iPhone13Pro_light_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image(
                      layout: .device(config: .iPhone13Pro,
                      traits: .init(userInterfaceStyle: .light)
                      )
                      )
              }

              func test_charactersListView_variantTwo_iPhone13Pro_dark_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image(
                      layout: .device(config: .iPhone13Pro,
                      traits: .init(userInterfaceStyle: .dark)
                      )
                      )
              }

              func test_charactersListView_variantTwo_iPhone13ProMax_light_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image(
                      layout: .device(config: .iPhone13ProMax,
                      traits: .init(userInterfaceStyle: .light)
                      )
                      )
              }

              func test_charactersListView_variantTwo_iPhone13ProMax_dark_snapshot() {


                  assertSnapshot(
                      matching: CharactersListView(),
                      as: .image(
                      layout: .device(config: .iPhone13ProMax,
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
    
    func testMacroDuplicatedVariantNameError() {
        assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest(
            scene: "CharactersListView",
            variants: [
                .init(name: "variantOne", params: "foo: bar", setUp: "setUpOneFunc"),
                 Variant(name: "variantOne"),
            ]
        )
        final class CharactersListViewTests: XCTestCase {
            
        }
        """
        } diagnostics: {
            """
            @SceneSnapshotUITest(
            ╰─ 🛑 Variant name can not be duplicated.
                scene: "CharactersListView",
                variants: [
                    .init(name: "variantOne", params: "foo: bar", setUp: "setUpOneFunc"),
                     Variant(name: "variantOne"),
                ]
            )
            final class CharactersListViewTests: XCTestCase {
                
            }
            """
        }
    }
    
    func testMacroVariantNameEmptyError() {
        assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest(
            scene: "CharactersListView",
            variants: [
                 Variant(name: ""),
            ]
        )
        final class CharactersListViewTests: XCTestCase {
            
        }
        """
        } diagnostics: {
            """
            @SceneSnapshotUITest(
            ╰─ 🛑 Variant name param can not be empty.
                scene: "CharactersListView",
                variants: [
                     Variant(name: ""),
                ]
            )
            final class CharactersListViewTests: XCTestCase {
                
            }
            """
        }
    }
}
