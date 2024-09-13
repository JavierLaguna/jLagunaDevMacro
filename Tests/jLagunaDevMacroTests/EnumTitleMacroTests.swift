import Testing
import MacroTesting

@testable import jLagunaDevMacroMacros

@Suite("EnumTitleMacro")
struct EnumTitleMacroTests {
    
    @Test
    func macro() {
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
    
    @Test
    func macroOnANonEnum() {
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
