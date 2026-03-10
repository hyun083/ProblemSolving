import Foundation

let notes = readLine()!.split(separator: "|").map{String($0)}
var A:(cnt:Int, last:Int) = (0,-1)
var C:(cnt:Int, last:Int) = (0,-1)
var AMinor:Set<String> = ["A","D","E"]
var CMajor:Set<String> = ["C","F","G"]

for i in 0..<notes.count {
    let baseNote = notes[i].map{String($0)}[0]
    
    if AMinor.contains(baseNote) {
        A.cnt += 1
    } else if CMajor.contains(baseNote) {
        C.cnt += 1
    }
}

if A.cnt == C.cnt {
    let lastNote = String(notes.last!.last!)
    print(AMinor.contains(lastNote) ? "A-minor":"C-major")
} else {
    print(A.cnt > C.cnt ? "A-minor" : "C-major")
}