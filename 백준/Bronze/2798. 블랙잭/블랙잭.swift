import Foundation

var arr = Set<Int>()

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = inputs[0]
let M = inputs[1]
let inputs2 = readLine()!.split(separator: " ").map{Int(String($0))!}

for index in inputs2.indices{
    var temp = inputs2
    var sum = 0
    let num1 = temp.remove(at: index)
    for index in temp.indices{
        var temp2 = temp
        let num2 = temp2.remove(at: index)
        for index in temp2.indices{
            var temp3 = temp2
            let num3 = temp3.remove(at: index)
            sum = num1 + num2 + num3
            if sum <= M {
                arr.insert(sum)
            }
        }
    }
}
print(arr.max()!)