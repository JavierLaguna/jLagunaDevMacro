import Testing
import MacroTesting

@testable import jLagunaDevMacroMacros

@Suite("SceneSnapshotUITestMacro")
struct SceneSnapshotUITestMacroTests {
    
    @Test
    func macro() {
        assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest(scene: "LoadingView")
        @Suite("LoadingView Tests")
        struct LoadingViewTests {
            
        }
        """
        } expansion: {
            """
            @Suite("LoadingView Tests")
            struct LoadingViewTests {

                
            @Test
                
            func loadingView_image_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image

                
            )
                
            }

                
            @Test
                
            func loadingView_iPhoneSe_light_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhoneSe),

                
                traits: .init(userInterfaceStyle: .light)

                
                )

                
            )
                
            }

                
            @Test
                
            func loadingView_iPhoneSe_dark_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhoneSe),

                
                traits: .init(userInterfaceStyle: .dark)

                
                )

                
            )
                
            }

                
            @Test
                
            func loadingView_iPhone13Mini_light_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhone13Mini),

                
                traits: .init(userInterfaceStyle: .light)

                
                )

                
            )
                
            }

                
            @Test
                
            func loadingView_iPhone13Mini_dark_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhone13Mini),

                
                traits: .init(userInterfaceStyle: .dark)

                
                )

                
            )
                
            }

                
            @Test
                
            func loadingView_iPhoneX_light_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhoneX),

                
                traits: .init(userInterfaceStyle: .light)

                
                )

                
            )
                
            }

                
            @Test
                
            func loadingView_iPhoneX_dark_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhoneX),

                
                traits: .init(userInterfaceStyle: .dark)

                
                )

                
            )
                
            }

                
            @Test
                
            func loadingView_iPhone13Pro_light_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhone13Pro),

                
                traits: .init(userInterfaceStyle: .light)

                
                )

                
            )
                
            }

                
            @Test
                
            func loadingView_iPhone13Pro_dark_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhone13Pro),

                
                traits: .init(userInterfaceStyle: .dark)

                
                )

                
            )
                
            }

                
            @Test
                
            func loadingView_iPhone13ProMax_light_snapshot() {





                
            assertSnapshot(

                
                of: LoadingView(),

                
                as: .image(

                
                layout: .device(config: .iPhone13ProMax),

                
                traits: .init(userInterfaceStyle: .light)

                
                )

                
            )
                
            }

                
            @Test
                
            func loadingView_iPhone13ProMax_dark_snapshot() {





                
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
        @Suite
        final class CharactersListViewTests {
            
        }
        """
        } expansion: {
            """
            @Suite
            final class CharactersListViewTests {

                @Test
                func charactersListView_variantOne_image_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image
                    )
                }

                @Test
                func charactersListView_variantOne_iPhoneSe_light_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhoneSe),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                @Test
                func charactersListView_variantOne_iPhoneSe_dark_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhoneSe),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                @Test
                func charactersListView_variantOne_iPhone13Mini_light_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                @Test
                func charactersListView_variantOne_iPhone13Mini_dark_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                @Test
                func charactersListView_variantOne_iPhoneX_light_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhoneX),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                @Test
                func charactersListView_variantOne_iPhoneX_dark_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhoneX),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                @Test
                func charactersListView_variantOne_iPhone13Pro_light_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13Pro),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                @Test
                func charactersListView_variantOne_iPhone13Pro_dark_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13Pro),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                @Test
                func charactersListView_variantOne_iPhone13ProMax_light_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13ProMax),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                @Test
                func charactersListView_variantOne_iPhone13ProMax_dark_snapshot() {

                    setUpOneFunc()

                    assertSnapshot(
                        of: CharactersListView(foo: bar),
                        as: .image(
                        layout: .device(config: .iPhone13ProMax),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                @Test
                func charactersListView_variantTwo_image_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image
                    )
                }

                @Test
                func charactersListView_variantTwo_iPhoneSe_light_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhoneSe),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                @Test
                func charactersListView_variantTwo_iPhoneSe_dark_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhoneSe),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                @Test
                func charactersListView_variantTwo_iPhone13Mini_light_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                @Test
                func charactersListView_variantTwo_iPhone13Mini_dark_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                @Test
                func charactersListView_variantTwo_iPhoneX_light_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhoneX),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                @Test
                func charactersListView_variantTwo_iPhoneX_dark_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhoneX),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                @Test
                func charactersListView_variantTwo_iPhone13Pro_light_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhone13Pro),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                @Test
                func charactersListView_variantTwo_iPhone13Pro_dark_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhone13Pro),
                        traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }

                @Test
                func charactersListView_variantTwo_iPhone13ProMax_light_snapshot() {


                    assertSnapshot(
                        of: CharactersListView(),
                        as: .image(
                        layout: .device(config: .iPhone13ProMax),
                        traits: .init(userInterfaceStyle: .light)
                        )
                    )
                }

                @Test
                func charactersListView_variantTwo_iPhone13ProMax_dark_snapshot() {


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
        @Suite
        struct CharactersListViewTests {
            
        }
        """
        } diagnostics: {
            """
            @SceneSnapshotUITest
            ┬───────────────────
            ╰─ 🛑 Required scene param.
            @Suite
            struct CharactersListViewTests {
                
            }
            """
        }
    }
    
    @Test
    func macroSceneInvalidTypeError() {
        assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest(scene: 2)
        @Suite
        final class CharactersListViewTests {
            
        }
        """
        } diagnostics: {
            """
            @SceneSnapshotUITest(scene: 2)
            ┬─────────────────────────────
            ╰─ 🛑 Scene param must be a String.
            @Suite
            final class CharactersListViewTests {
                
            }
            """
        }
    }
    
    @Test
    func macroSceneEmptyError() {
        assertMacro(["SceneSnapshotUITest": SceneSnapshotUITestMacro.self]) {
        """
        @SceneSnapshotUITest(scene: "")
        @Suite
        final class CharactersListViewTests {
            
        }
        """
        } diagnostics: {
            """
            @SceneSnapshotUITest(scene: "")
            ┬──────────────────────────────
            ╰─ 🛑 Scene param can not be empty.
            @Suite
            final class CharactersListViewTests {
                
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
        @Suite
        final class CharactersListViewTests {
            
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
            @Suite
            final class CharactersListViewTests {
                
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
        @Suite
        final class CharactersListViewTests {
            
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
            @Suite
            final class CharactersListViewTests {
                
            }
            """
        }
    }
}
