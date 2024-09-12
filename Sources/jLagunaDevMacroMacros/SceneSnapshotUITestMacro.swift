import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct SceneSnapshotUITestMacro: MemberMacro {
    
    // TODO: JLI Config parameter
    private static let useOrientations = false
    
    public struct Variant {
        let name: String
        let params: String?
        let setUp: String?
        
        fileprivate static var defaultVariant: Variant {
            Variant(name: "", params: nil, setUp: nil)
        }
    }
    
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        
        let scene = try getSceneName(from: node)
        let funcName = scene.camelCased
        
        var variants = try getVariants(from: node)
        
        if variants.isEmpty {
            variants = [Variant.defaultVariant]
            
        } else {
            let variantNames = variants.map { $0.name }
            if variantNames.count != Set(variantNames).count {
                throw Error.variantNameDuplicated
            }
        }
        
        let funcs: [String] = variants.map { variant in
            
            let variantName = variant.name.isEmpty ? "_" : "_\(variant.name)_"
            let setUp = getVariantSetUpFunc(variant: variant)
            let params = variant.params ?? ""
            
            let deviceTests = Device.allCases.map { device in
                if device == .image {
                    let funcTitle = """
                        @Test
                        func \(funcName)\(variantName)\(device.rawValue)_snapshot() {
                        """
                    
                    var setUpFunc = ""
                    if let setUp {
                        setUpFunc = """
                            
                            \(setUp)
                            """
                    }
                    
                    let assertFunc = """
                        
                        assertSnapshot(
                            of: \(scene)(\(params)),
                            \(getImageConfig(device: device, style: .light, orientation: nil))
                        )
                        """
                    
                    return ["""
                            \(funcTitle)
                            \(setUpFunc)
                            \(assertFunc)
                        }
                        """]
                }
                
                let withStyleTests = UIStyle.allCases.map { style in
                    let funcTitle = """
                        @Test
                        func \(funcName)\(variantName)\(device.rawValue)_\(style)_snapshot() {
                        """
                    
                    var setUpFunc = ""
                    if let setUp {
                        setUpFunc = """
                            
                            \(setUp)
                            """
                    }
                    
                    let assertFunc = """
                        
                        assertSnapshot(
                            of: \(scene)(\(params)),
                            \(getImageConfig(device: device, style: style, orientation: nil))
                        )
                        """
                    
                    return """
                            \(funcTitle)
                            \(setUpFunc)
                            \(assertFunc)
                        }
                        """
                }
                
                return withStyleTests
            }
            
            return deviceTests.flatMap { $0 }
        }
        .flatMap { $0 }
        
        return funcs.map { DeclSyntax(stringLiteral: $0) }
    }
}

private extension SceneSnapshotUITestMacro {
    
    static let sceneParamKey = "scene"
    static let variantsParamKey = "variants"
    static let variantNameParamKey = "name"
    static let variantParamsParamKey = "params"
    static let variantSetUpParamKey = "setUp"
    
    enum Device: String, CaseIterable {
        case image
        case iPhoneSmallest = "iPhoneSe"
        case iPhoneSmall = "iPhone13Mini"
        case iPhoneMedium = "iPhoneX"
        case iPhoneBig = "iPhone13Pro"
        case iPhoneBigest = "iPhone13ProMax"
    }
    
    enum UIStyle: String, CaseIterable {
        case light
        case dark
    }
    
    enum Orientation: String, CaseIterable { // TODO: IMPLEMENT
        case landscape
        case portrait
    }
    
    enum Error: Swift.Error, CustomStringConvertible {
        case sceneNotFound
        case sceneInvalidType
        case sceneEmpty
        case variantNameDuplicated
        case variantNameEmpty
        
        var description: String {
            switch self {
            case .sceneNotFound: "Required scene param."
            case .sceneInvalidType: "Scene param must be a String."
            case .sceneEmpty: "Scene param can not be empty."
            case .variantNameDuplicated: "Variant name can not be duplicated."
            case .variantNameEmpty: "Variant name param can not be empty."
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
    
    static func getVariants(from node: SwiftSyntax.AttributeSyntax) throws -> [Variant] {
        
        guard let argumentTuple = node.arguments?.as(LabeledExprListSyntax.self)?.first(where: {
            $0.label?.text == variantsParamKey
        }) else {
            return []
        }
        
        guard let arrayExpression = argumentTuple.expression.as(ArrayExprSyntax.self) else {
            return []
        }
        
        return try arrayExpression.elements.map { element in
            let arguments = element.expression.as(FunctionCallExprSyntax.self)?.arguments
            
            let nameArgument = arguments?.first(where: {
                $0.label?.text == variantNameParamKey
            })?.expression.as(StringLiteralExprSyntax.self)?.segments.first?.as(StringSegmentSyntax.self)
            
            guard let name = nameArgument?.content.text, !name.isEmpty else {
                throw Error.variantNameEmpty
            }
            
            let paramsArgument = arguments?.first(where: {
                $0.label?.text == variantParamsParamKey
            })?.expression.as(StringLiteralExprSyntax.self)?.segments.first?.as(StringSegmentSyntax.self)
            let params = paramsArgument?.content.text
            
            let setUpArgument = arguments?.first(where: {
                $0.label?.text == variantSetUpParamKey
            })?.expression.as(StringLiteralExprSyntax.self)?.segments.first?.as(StringSegmentSyntax.self)
            let setUp = setUpArgument?.content.text
            
            return .init(name: name, params: params, setUp: setUp)
        }
    }
    
    static func getVariantSetUpFunc(variant: Variant) -> String? {
        guard let setUp = variant.setUp, !setUp.isEmpty else {
            return nil
        }
        
        return "\(setUp)()"
    }
    
    static func getImageConfig(
        device: Device,
        style: UIStyle,
        orientation: Orientation?
    ) -> String {
        
        if device == .image {
            return """
            as: .image
            """
            
        } else {
            var orientationValue = ""
            if useOrientations, let orientation {
                orientationValue = "(.\(orientation)"
            }
            
            return """
            as: .image(
                layout: .device(config: .\(device.rawValue)\(orientationValue)),
                traits: .init(userInterfaceStyle: .\(style))
            )
            """
        }
    }
}
