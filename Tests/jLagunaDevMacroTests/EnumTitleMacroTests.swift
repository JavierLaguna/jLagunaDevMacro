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
                      return "Action"
                  case .horror:
                      return "Horror"
                  case .comedy:
                      return "Comedy"
                  }
              }
          }
          """
      }
    }
}
