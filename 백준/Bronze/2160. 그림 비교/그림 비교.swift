import Foundation

let n = Int(readLine()!)!
var value = Int.max
var ans = ""
var pictures = [[[String]]]()

func check(A:[[String]], B:[[String]]) -> Int{
    var result = 0
    for i in 0..<5{
        for k in 0..<7{
            if A[i][k] != B[i][k]{
                result += 1
            }
        }
    }
    return result
}

for _ in 0..<n{
    var picture = [[String]]()
    for _ in 0..<5{
        picture.append(readLine()!.map{String($0)})
    }
    pictures.append(picture)
}

for i in 0..<n{
    for k in i+1..<n{
        if value > check(A: pictures[i], B: pictures[k]){
            value = check(A: pictures[i], B: pictures[k])
            ans = "\(i+1) \(k+1)"
        }
    }
}
print(ans)