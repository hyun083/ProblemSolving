while let line = readLine(){
    let N = Int(line)!
    if N == 0 { break }
    print((N*(N+1))/2)
}