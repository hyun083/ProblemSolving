import Foundation

let line = readLine()!.map{String($0)}
var stk = [String]()

for input in line{
    if !stk.isEmpty{
        if stk.last! == "(" && input == ")"{
            stk.removeLast()
            continue
        }
    }
    stk.append(input)
}
print(stk.count)