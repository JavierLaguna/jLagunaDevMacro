import XCTest
import MacroTesting

@testable import jLagunaDevMacroMacros

final class EnumTitleMacroTests: XCTestCase {
    
    func testMacro() {
      assertMacro(["EnumTitle": EnumTitleMacro.self]) {
        """
        @EnumTitle
        enum Genre {
            case action
            case horror
            case comedy
        }
        """
      } expansion: {
          """
          enum Genre {
              case action
              case horror
              case comedy

              var title: String {
                  switch self {
                  case .action:
                      "Action"
                  case .horror:
                      "Horror"
                  case .comedy:
                      "Comedy"
                  }
              }
          }
          """
      }
    }
    
    func testMacroOnANonEnum() {
      assertMacro(["EnumTitle": EnumTitleMacro.self]) {
        """
        @EnumTitle
        struct Foo {
            let bar: String
        }
        """
      } diagnostics: {
          """
          @EnumTitle
          ┬─────────
          ╰─ 🛑 This macro can only be applied to a enum.
          struct Foo {
              let bar: String
          }
          """
      }
    }
}
