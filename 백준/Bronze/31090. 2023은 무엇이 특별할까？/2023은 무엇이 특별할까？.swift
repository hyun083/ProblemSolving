let S = Int(readLine()!)!
for _ in 0..<S{
    let N = Int(readLine()!)!
    print((N+1)%(N%100)==0 ? "Good":"Bye")
}