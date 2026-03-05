import Foundation

var ans = [Int]()
var num = 1
while let name = readLine() {
    if name.contains("FBI") {
        ans.append(num)
    }
    num += 1
}
if ans.isEmpty {
    print("HE GOT AWAY!")
} else {
    for num in ans {
        print(num, terminator: " ")
    }
}