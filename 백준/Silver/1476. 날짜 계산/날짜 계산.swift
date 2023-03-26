import Foundation

var esm = readLine()!.split(separator: " ").map{Int(String($0))!}
var cnt = 1
while esm != [1,1,1]{
    cnt += 1
    esm[0] -= 1
    esm[1] -= 1
    esm[2] -= 1
    if esm[0] == 0{ esm[0] = 15 }
    if esm[1] == 0{ esm[1] = 28 }
    if esm[2] == 0{ esm[2] = 19 }
}
print(cnt)