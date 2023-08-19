module main

struct User {
pub mut:
	name string
	age  int
}

struct Employee {
pub mut:
	id   int
	name string
}

struct Model {
pub:
	name       string
	idx        int
	create_row fn ()  [required]
}

fn create_model[T]() Model {
	return Model{
		name: T.name
		idx: T.idx
		create_row: fn [T]() {
			mut obj := T{}
			println('We have an object of "${T.name}": ${obj}')
			other_generic_func[T]()
		}
	}
}

fn other_generic_func[T]() {
	println('Called other generic function with the type "${T.name}"')
}

fn main() {
	// stores all the models
	mut models := map[string]Model{}

	models['User'] = create_model[User]()
	models['Employee'] = create_model[Employee]()

	models['User'].create_row()
	models['Employee'].create_row()
}
