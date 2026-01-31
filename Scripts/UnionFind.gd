class_name UnionFind

var _elementsParents: Array = []
var _rank: Array = []

func _init(size: int) -> void:
    for i in range(size):
        _elementsParents.append(i)
        _rank.append(1)

func Union(element1: int, element2: int) -> void:
    var set1 = Find(element1)
    var set2 = Find(element2)
    if set1 == set2:
        return
    if _rank[set1] < _rank[set2]:
        _elementsParents[set1] = set2
        _rank[set2] += _rank[set1]
    else:
        _elementsParents[set2] = set1
        _rank[set1] += _rank[set2]
        

func Find(element: int) -> int:
    if element != _elementsParents[element]:
        _elementsParents[element] = Find(_elementsParents[element])
    return _elementsParents[element]

func AddElement() -> int:
    var newIndex: int = _elementsParents.size()
    _elementsParents.append(newIndex)
    _rank.append(1)
    return newIndex