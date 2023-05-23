import Foundation

/// CONS:
/// - not easy to access items

enum Item {
    
    case simple(SimpleItem)
    case complex(ComplexItem)
}

struct SimpleItem {
    
    let id: UUID
    let name: String
}

struct ComplexItem {
    
    let id: UUID
    let name: String
    let value: String
    let action: () -> Void
}

struct ItemsCollection {
    
    let items: [Item]
    
    func use(item: Item) {
        
        switch item {
        case let .simple(simpleItem):
            print(simpleItem.name)
            
        case let .complex(complexItem):
            print(complexItem.name)
            print(complexItem.value)
            complexItem.action()
        }
    }
    
    func item(with id: UUID) -> Item? {
        
        items.first(where: { item in
            
            switch item {
            case let .simple(simpleItem):
                return simpleItem.id == id
                
            case let .complex(complexItem):
                return complexItem.id == id
            }
        })
    }
}
