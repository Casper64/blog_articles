module admin

const (
	structs = map[int]Model{}
)

struct Model {
	typ    int
	name   string
	create fn ()  [required]
}

pub fn create_row(idx int) {
	model := admin.structs[idx] or { return }
	model.create()
}

pub fn register[T]() {
	println('The index of type "${T.name}" is ${T.idx}')

	// const hack
	mut mutable_structs := unsafe { admin.structs }

	mutable_structs[T.idx] = Model{
		typ: T.idx
		name: T.name
		create: fn [T]() {
			obj := T{}
			println('Created instance of "${T.name}": ${obj}')
			// do stuff with the database
		}
	}
}
