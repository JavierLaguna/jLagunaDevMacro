import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct SceneSnapshotUITestMacro: MemberMacro {

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        
        // TODO: JLI
        //        guard let enumDel = declaration.as(ClassDeclSyntax.self) else {
        //            throw Error.onlyApplicableToXCTestCase
        //        }
        
        let scene = try getSceneName(from: node)
        let funcName = scene.camelCased
        
        let funcs = Devices.allCases.map { device in
            UIStyle.allCases.map { style in // TODO: JLI xState
                """
                func test_\(funcName)_xState_\(device.rawValue)_\(style)_snapshot() {
                    assertSnapshot(
                        matching: \(scene),
                        as: .image(
                            layout: .device(config: .\(device.rawValue)),
                            traits: .init(userInterfaceStyle: .\(style))
                        )
                    )
                }
                """
            }
        }
        .flatMap { $0 }
        
        return funcs.map { DeclSyntax(stringLiteral: $0) }
    }
}

private extension SceneSnapshotUITestMacro {
    
    static let sceneParamKey = "scene"
    
    enum Devices: String, CaseIterable {
        case small = "iPhone13Mini"
        case medium = "iPhone15Pro"
    }
    
    enum UIStyle: String, CaseIterable {
        case light
        case dark
    }
    
    enum Error: Swift.Error, CustomStringConvertible {
        case onlyApplicableToXCTestCase
        case sceneNotFound
        case sceneInvalidType
        case sceneEmpty
        
        var description: String {
            switch self {
            case .onlyApplicableToXCTestCase: "This macro can only be applied to a XCTestCase."
            case .sceneNotFound: "Required scene param."
            case .sceneInvalidType: "Scene param must be a String."
            case .sceneEmpty: "Scene param can not be empty."
            }
        }
    }
    
    static func getSceneName(from node: SwiftSyntax.AttributeSyntax) throws -> String {
        
        guard let argumentTuple = node.arguments?.as(LabeledExprListSyntax.self)?.first(where: {
            $0.label?.text == sceneParamKey
        }) else {
            throw Error.sceneNotFound
        }
        
        guard let stringExpression = argumentTuple.expression.as(StringLiteralExprSyntax.self),
              let funcName = stringExpression.representedLiteralValue else {
            throw Error.sceneInvalidType
        }
        
        if funcName.isEmpty {
            throw Error.sceneEmpty
        }
        
        return funcName
    }
}
