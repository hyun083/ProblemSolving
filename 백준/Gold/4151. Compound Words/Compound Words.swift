import Foundation

var dic = Set<String>()
while let line = readLine() {
    let word = line
    dic.insert(word)
}

for word in dic.sorted() {
    let chars = Array(word)
    for i in 1..<chars.count {
        let prefix = String(chars[0..<i])
        let suffix = String(chars[i..<chars.count])
        if dic.contains(prefix) && dic.contains(suffix) {
            print(word)
            break
        }
    }
}