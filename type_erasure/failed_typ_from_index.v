module main

import v.reflection

struct User {
	age int
}

fn create_row(idx int) reflection.Type {
	typ := reflection.get_type(idx) or { return reflection.Type{} }
	return typ
}

fn main() {
	user_idx := typeof[User]().idx
	user := create_row(user_idx)
	{
		age:
		5
	}
	println(user)
}
