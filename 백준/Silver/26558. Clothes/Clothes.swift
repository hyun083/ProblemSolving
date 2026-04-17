import Foundation

let N = Int(readLine()!)!
for _ in 0..<N {
    let C = Int(readLine()!)!
    var shirt = [String]()
    var pants = [String]()
    var socks = [String]()
    
    for _ in 0..<C {
        let clothes = readLine()!.split(separator: "(").map{String($0)}
        var article = clothes[0]
        article.removeLast()
        let type = clothes[1]
        
        if type == "shirt)" {
            shirt.append(article)
        } else if type == "pants)" {
            pants.append(article)
        } else {
            socks.append(article)
        }
    }
    
    while !shirt.isEmpty && !pants.isEmpty && !socks.isEmpty{
        let res = shirt.removeLast() + ", " + pants.removeLast() + ", " + socks.removeLast()
        print(res)
    }
    print()
}