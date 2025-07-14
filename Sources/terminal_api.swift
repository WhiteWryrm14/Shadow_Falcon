import Foundation

// Check if the code is running on Windows
#if os(Windows)
import WinSDK

// Define the COORD structure
struct COORD {
    var X: Int16
    var Y: Int16

    init(X: Int16, Y: Int16) {
        self.X = X
        self.Y = Y
    }
}

// Define the CONSOLE_CURSOR_INFO structure - contains information about the console cursor
struct CONSOLE_CURSOR_INFO {
    var dwSize: UInt32       // The size of the cursor, as a percentage of the character cell
    var bVisible: Bool       // Whether the cursor is visible
}

// Define the CONSOLE_SCREEN_BUFFER_INFO structure - contains information about the console screen buffer
struct CONSOLE_SCREEN_BUFFER_INFO {
    var dwSize: COORD            // The size of the console screen buffer
    var dwCursorPosition: COORD  // The current position of the cursor
    var wAttributes: UInt16      // The attributes of the characters in the console
    var srWindow: SMALL_RECT     // The console screen buffer's window
    var dwMaximumWindowSize: COORD // The maximum size of the console window
}

// Define the SMALL_RECT structure - represents a rectangle in the console screen buffer
struct SMALL_RECT {
    var Left: Int16
    var Top: Int16
    var Right: Int16
    var Bottom: Int16
}

struct KEY_EVENT_RECORD{
    var bKeyDown: Bool
    var wRepeatCount: UInt16
    var wVirtualKeyCode: UInt16
    var wVirtualScanCode: UInt16
    var uChar: UnicodeChar
    var dwControlKeyState: UInt32
}

struct UnicodeChar{
    var UnicodeChar: UInt16
}

struct INPUT_RECORD{
    var EventType: UInt16
    var KeyEvent: KEY_EVENT_RECORD
}

struct KeyEventUnion{
    var KeyEvent: KEY_EVENT_RECORD
}

let STD_INPUT_HANDLE: UInt32 = 0xFFFFFFF6
let STD_OUTPUT_HANDLE: UInt32 = 0xFFFFFFF5
let KEY_EVENT: UInt16 = 0x0001 

// Define Windows console API functions
func GetStdHandle(_ nStdHandle: UInt32) -> HANDLE
func SetConsoleCursorPosition(_ hConsoleOutput: HANDLE, _ dwCursorPosition: COORD) -> Bool
func SetConsoleTextAttribute(_ hConsoleOutput: HANDLE, _ wAttributes: UInt16) -> Bool
func GetConsoleScreenBufferInfo(_ hConsoleOutput: HANDLE, _ lpConsoleScreenBufferInfo: UnsafeMutablePointer<CONSOLE_SCREEN_BUFFER_INFO>) -> Bool
func ReadConsoleInput(_ hConsoleInput: HANDLE, _ lpBuffer: UnsafeMutablePointer<INPUT_RECORD>, _ nLength: UInt32, _ lpNumberOfEventsRead: UnsafeMutablePointer<UInt32>) -> Bool
func SetConsoleCursorInfo(_ hConsoleOutput: HANDLE, _ lpConsoleCursorInfo: UnsafePointer<CONSOLE_CURSOR_INFO>) -> Bool
#endif
