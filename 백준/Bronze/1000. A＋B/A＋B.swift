import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
print(inputs[0]+inputs[1])