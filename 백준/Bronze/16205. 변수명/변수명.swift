import Foundation

let line = readLine()!.split(separator: " ").map{String($0)}
let N = Int(line[0])!
let name = line[1]
var ans = [String]()
var camelCase = name.map{String($0)}
var snake_case = name.map{String($0)}
var PascalCase = name.map{String($0)}

if N == 1 {
    ans.append(name)
    
    var temp = [String]()
    for target in snake_case.joined() {
        if target.isUppercase { temp.append("_") }
        temp.append(target.lowercased())
    }
    snake_case = temp
    
    PascalCase[0] = PascalCase[0].capitalized
} else if N == 2 {
    PascalCase = []
    var temp = name.split(separator: "_").map{String($0)}
    for target in temp {
        var newTarget = target.map{String($0)}
        newTarget[0] = newTarget[0].uppercased()
        PascalCase.append(newTarget.joined())
    }
    let firstTarget = temp.removeFirst()
    camelCase = [firstTarget]
    for target in temp {
        var newTarget = target.map{String($0)}
        newTarget[0] = newTarget[0].uppercased()
        camelCase.append(newTarget.joined())
    }
} else {
    camelCase[0] = camelCase[0].lowercased()
    
    var temp = [String]()
    for target in camelCase.joined(){
        if target.isUppercase {
            temp.append("_")
        }
        temp.append(String(target.lowercased()))
    }
    snake_case = temp
}
print(camelCase.joined())
print(snake_case.joined())
print(PascalCase.joined())