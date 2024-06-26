// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "jLagunaDevMacroMacros", type: "StringifyMacro")

@attached(member, names: named(title))
public macro EnumTitle() = #externalMacro(module: "jLagunaDevMacroMacros", type: "EnumTitleMacro")

@attached(member, names: arbitrary)
public macro SceneSnapshotUITest(
    scene: String,
    variants: [Any] = [] // TODO: JLI
) = #externalMacro(module: "jLagunaDevMacroMacros", type: "SceneSnapshotUITestMacro")
