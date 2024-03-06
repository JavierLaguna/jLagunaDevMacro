import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(jLagunaDevMacroMacros)
import jLagunaDevMacroMacros

fileprivate let testMacros: [String: Macro.Type] = [
    "EnumTitle": EnumTitleMacro.self,
]
#endif

final class EnumTitleMacroTests: XCTestCase {
    
    func testMacro() throws {
        #if canImport(jLagunaDevMacroMacros)
            assertMacroExpansion(
                """
                @EnumTitle
                enum Genre {
                    case action
                    case horror
                    case comedy
                }
                """,
                expandedSource:
                """
                @EnumTitle
                enum Genre {
                    case action
                    case horror
                    case comedy
                }
                
                var title: String {
                    switch self {
                    case .action:
                        return "Action"
                    case .horror:
                        return "Horror"
                    case .comedy:
                        return "Comedy"
                    }
                }
                """,
                macros: testMacros
            )
        #else
            throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
