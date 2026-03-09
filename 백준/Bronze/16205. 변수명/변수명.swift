import Foundation

let line = readLine()!.split(separator: " ").map{String($0)}
let N = Int(line[0])!
let name = line[1]
var camelCase = [String]()
var snake_case = [String]()
var PascalCase = [String]()

if N == 1 {
    camelCase = name.map{String($0)}
    
    for target in name {
        if target.isUppercase {
            snake_case.append("_")
        }
        snake_case.append(target.lowercased())
    }
    
    PascalCase = camelCase
    PascalCase[0] = PascalCase[0].capitalized
} else if N == 2 {
    snake_case = name.map{String($0)}
    
    var temp = name.split(separator: "_").map{String($0)}
    for target in temp {
        var newTarget = target.map{String($0)}
        newTarget[0] = newTarget[0].uppercased()
        PascalCase.append(newTarget.joined())
        camelCase.append(newTarget.joined())
    }
    
    camelCase[0] = temp.removeFirst()
} else {
    PascalCase = name.map{String($0)}
    
    camelCase = name.map{String($0)}
    camelCase[0] = camelCase[0].lowercased()
    
    for target in camelCase.joined(){
        if target.isUppercase {
            snake_case.append("_")
        }
        snake_case.append(String(target.lowercased()))
    }
}
print(camelCase.joined())
print(snake_case.joined())
print(PascalCase.joined())