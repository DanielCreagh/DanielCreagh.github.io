# [Consume noncopyable types in Swift](https://developer.apple.com/videos/play/wwdc2024/10170/)
Values in Swift are not unique, they can be copied
Uniquness can be powerful in programming.

## Revisit Value vs. Reference Types
- pointers
- shallow and deep copying

## Copyable protocol
- Copyable is implicit (we get it by default)

## Stateful resources

## `~Copyable` 
- removes the protocol conformance
- `consume` will remove the reference to the value
```
struct FlppyDisk: ~Copyable {}

func newDisk() -> FloppyDisk
    let result = FloppyDisk
    format(result)
    return result
}

func format(_ disk: consuming FloppyDisk) {
    var tempDisk = disk

}

func format(_ disk: inout FloppyDisk) {
    var tempDisk = disk
    
}


```

Swift 6 enabled ~Copyable Generics
`~Copyable` when applied to Generics can mean may be copyable and may also not copyable