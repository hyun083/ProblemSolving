import Foundation

var arr = Array(repeating: Array(repeating: false, count: 100), count: 100)
var ans = 0

for _ in 0..<4{
    let rect = readLine()!.split(separator: " ").map{Int($0)!}
    for x in rect[0]..<rect[2]{
        for y in rect[1]..<rect[3]{
            if !arr[x][y]{
                arr[x][y] = true
                ans+=1
            }
        }
    }
}
print(ans)