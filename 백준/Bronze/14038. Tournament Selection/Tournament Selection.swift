import Foundation

var cnt = 0

for _ in 0..<6{
    let info = readLine()!
    cnt += info=="W" ? 1:0
}
if cnt >= 5{
    print(1)
}else if cnt >= 3{
    print(2)
}else if cnt >= 1{
    print(3)
}else{
    print(-1)
}