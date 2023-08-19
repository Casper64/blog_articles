module main

import admin

struct User {
	id   int    [primary; sql: serial]
	name string
	age  int
}

fn main() {
	admin.register[User]()
	admin.start()
}
