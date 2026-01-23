extends GutTest
var unionFind: UnionFind
func before_all():
	unionFind = UnionFind.new(8)

func before_each():
	unionFind = UnionFind.new(8)

func after_each():
	gut.p("Runs after each test.")

func after_all():
	gut.p("Runs once after all tests")

func test_sequence1():
	unionFind.Union(0, 1)
	unionFind.Union(2, 3)
	unionFind.Union(0, 2)
	var findRes: int = unionFind.Find(3)
	assert_eq(findRes, 0, "actual value: {0} \n expected value: {1}".format([findRes, 0]))

func test_sequence2():
	unionFind.Union(0, 1)
	unionFind.Union(2, 3)
	unionFind.Union(0, 2)
	unionFind.Union(4, 5)
	unionFind.Union(6, 7)
	unionFind.Union(4, 6)
	unionFind.Union(0, 4)
	var findRes: int = unionFind.Find(7)
	assert_eq(findRes, 0, "actual value: {0} \n expected value: {1}".format([findRes, 0]))