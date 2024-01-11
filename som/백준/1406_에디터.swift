import Foundation

func result1406() {
    // 내가 짠 코드 - 시간초과
    var text = Array(readLine()!) // 문장 [a,b,c,d]
    let count = Int(readLine()!)! // 명령어 개수
    var cursor = text.count // 커서

    for _ in 0..<count {
        var command = readLine()!.components(separatedBy: " ") // 명렁어 배열

        switch command.removeFirst() {
        case "P":
            var word = command.popLast()!
            text.insert(contentsOf: word, at: cursor)
            cursor += 1

        case "L":
            if cursor > 0 {
                cursor -= 1
            }

        case "D":
            if cursor != text.count {
                cursor += 1
            }

        case "B":
            if cursor != 0 {
                text.remove(at: cursor - 1)
                cursor -= 1
            }

        default:
            break
        }
    }

    print(String(text))

    // 찾아본 코드
    var letters = readLine()! // left
    let testCase = Int(readLine()!)!
    var rightLetters = "" // right

    for _ in 0..<testCase {
        let line = readLine()!

        if line == "L" {
            if !letters.isEmpty {
                rightLetters.append(letters.popLast()!)
            }
        } else if line == "D" {
            if !rightLetters.isEmpty {
                letters.append(rightLetters.popLast()!)
            }
        } else if line == "B" {
            if !letters.isEmpty {
                letters.removeLast()
            }
        } else {
            letters.append(line.last!)
        }
    }

    print(letters + rightLetters.reversed())

    // 새로 푼 버전
    var Ltext = readLine()!
    var Rtext = ""
    let count1 = Int(readLine()!)!

    for _ in 0..<count1 {
        var input = readLine()!

        switch input {
        case "L":
            if Ltext.isEmpty == false {
                Rtext.append(Ltext.popLast()!)
            }
        case "D":
            if Rtext.isEmpty == false {
                Ltext.append(Rtext.popLast()!)
            }
        case "B":
            if Ltext.isEmpty == false {
                Ltext.removeLast()
            }
        default:
            Ltext.append(input.last!)
        }
    }

    print(Ltext + Rtext.reversed())
}

