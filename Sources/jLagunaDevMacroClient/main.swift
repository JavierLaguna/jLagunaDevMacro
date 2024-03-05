import jLagunaDevMacro

let a = 17
let b = 25

let (result, code) = #stringify(a + b)

print("The value \(result) was produced by the code \"\(code)\"")

@EnumTitle
enum Genre {
    case action
    case horror
    case comedy
}

print("\(Genre.action.title)")
print("\(Genre.horror.title)")
print("\(Genre.comedy.title)")
