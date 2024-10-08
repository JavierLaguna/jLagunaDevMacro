import Testing
import MacroTesting

@testable import jLagunaDevMacroMacros

@Suite("SceneSnapshotUImacro")
struct SceneSnapshotUImacroTests {
    
    @Test
    func macro() {
        assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest(scene: "LoadingView")
        final class LoadingViewTests: XCTestCase {
            
        }
        """
        } expansion: {
            """
            final class LoadingViewTests: XCTestCase {

                
            func test_loadingView_image_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image

                
            )
                
            }

                
            func test_loadingView_iPhoneSe_light_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhoneSe),

                
                traits: .init(userInterfaceStyle: .light)

                
                )

                
            )
                
            }

                
            func test_loadingView_iPhoneSe_dark_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhoneSe),

                
                traits: .init(userInterfaceStyle: .dark)

                
                )

                
            )
                
            }

                
            func test_loadingView_iPhone13Mini_light_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhone13Mini),

                
                traits: .init(userInterfaceStyle: .light)

                
                )

                
            )
                
            }

                
            func test_loadingView_iPhone13Mini_dark_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhone13Mini),

                
                traits: .init(userInterfaceStyle: .dark)

                
                )

                
            )
                
            }

                
            func test_loadingView_iPhoneX_light_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhoneX),

                
                traits: .init(userInterfaceStyle: .light)

                
                )

                
            )
                
            }

                
            func test_loadingView_iPhoneX_dark_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhoneX),

                
                traits: .init(userInterfaceStyle: .dark)

                
                )

                
            )
                
            }

                
            func test_loadingView_iPhone13Pro_light_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhone13Pro),

                
                traits: .init(userInterfaceStyle: .light)

                
                )

                
            )
                
            }

                
            func test_loadingView_iPhone13Pro_dark_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhone13Pro),

                
                traits: .init(userInterfaceStyle: .dark)

                
                )

                
            )
                
            }

                
            func test_loadingView_iPhone13ProMax_light_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhone13ProMax),

                
                traits: .init(userInterfaceStyle: .light)

                
                )

                
            )
                
            }

                
            func test_loadingView_iPhone13ProMax_dark_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
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
    
    @Test
    func macroWithVariants() {
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

                func test_charactersListView_variantOne_image_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image
                    )
                }

                func test_charactersListView_variantOne_iPhoneSe_light_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhoneSe),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                func test_charactersListView_variantOne_iPhoneSe_dark_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhoneSe),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                func test_charactersListView_variantOne_iPhone13Mini_light_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                func test_charactersListView_variantOne_iPhone13Mini_dark_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                func test_charactersListView_variantOne_iPhoneX_light_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhoneX),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                func test_charactersListView_variantOne_iPhoneX_dark_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhoneX),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                func test_charactersListView_variantOne_iPhone13Pro_light_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13Pro),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                func test_charactersListView_variantOne_iPhone13Pro_dark_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13Pro),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                func test_charactersListView_variantOne_iPhone13ProMax_light_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13ProMax),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                func test_charactersListView_variantOne_iPhone13ProMax_dark_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13ProMax),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                func test_charactersListView_variantTwo_image_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image
                    )
                }

                func test_charactersListView_variantTwo_iPhoneSe_light_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhoneSe),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                func test_charactersListView_variantTwo_iPhoneSe_dark_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhoneSe),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                func test_charactersListView_variantTwo_iPhone13Mini_light_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                func test_charactersListView_variantTwo_iPhone13Mini_dark_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                func test_charactersListView_variantTwo_iPhoneX_light_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhoneX),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                func test_charactersListView_variantTwo_iPhoneX_dark_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhoneX),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                func test_charactersListView_variantTwo_iPhone13Pro_light_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhone13Pro),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                func test_charactersListView_variantTwo_iPhone13Pro_dark_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhone13Pro),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                func test_charactersListView_variantTwo_iPhone13ProMax_light_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhone13ProMax),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                func test_charactersListView_variantTwo_iPhone13ProMax_dark_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
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
    
    @Test
    func macroRequiredSceneError() {
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
    
    @Test
    func macroSceneInvalidTypeError() {
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
    
    @Test
    func macroSceneEmptyError() {
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
    
    @Test
    func macroDuplicatedVariantNameError() {
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
    
    @Test
    func macroVariantNameEmptyError() {
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
