import Foundation

let notes = readLine()!.split(separator: "|").map{String($0)}
var countOfA = 0
var countOfC = 0
var AMinor:Set<String> = ["A","D","E"]
var CMajor:Set<String> = ["C","F","G"]

for i in 0..<notes.count {
    let baseNote = notes[i].map{String($0)}[0]
    
    if AMinor.contains(baseNote) {
        countOfA += 1
    } else if CMajor.contains(baseNote) {
        countOfC += 1
    } else {
        continue
    }
}

if countOfA == countOfC {
    let lastNote = String(notes.last!.last!)
    print(AMinor.contains(lastNote) ? "A-minor":"C-major")
} else {
    print(countOfA > countOfC ? "A-minor" : "C-major")
}