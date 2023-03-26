let n = Int(readLine()!)!
for i in 1...n{
    var stars = ""
    for _ in 0..<n-i{
        stars += " "
    }
    for _ in 0..<i{
        stars += "*"
    }
    print(stars)
}