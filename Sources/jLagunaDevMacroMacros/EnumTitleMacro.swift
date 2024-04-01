import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct EnumTitleMacro: MemberMacro {
    
    public static func expansion(of node: AttributeSyntax, providingMembersOf declaration: some DeclGroupSyntax, in context: some MacroExpansionContext) throws -> [DeclSyntax] {
    
        guard let enumDel = declaration.as(EnumDeclSyntax.self) else {
            throw Error.onlyApplicableToEnum
        }
        
        let members = enumDel.memberBlock.members
        let caseDecl = members.compactMap { $0.decl.as(EnumCaseDeclSyntax.self) }
        let cases = caseDecl.compactMap { $0.elements.first?.name.text }
        
        var title = """
        var title: String {
            switch self {
        """
        
        for titleCase in cases {
            title += "case .\(titleCase): \"\(titleCase.capitalized)\""
        }
        
        title += """
            }
        }
        """

        return [DeclSyntax(stringLiteral: title)]
    }
}

// MARK: Private methods
private extension EnumTitleMacro {
    
    enum Error: Swift.Error, CustomStringConvertible {
        case onlyApplicableToEnum
        
        var description: String {
            switch self {
            case .onlyApplicableToEnum: "This macro can only be applied to a enum."
            }
        }
    }
}
