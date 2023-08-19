module admin

import v.reflection
import vweb

pub struct AdminApp {
	vweb.Context
}

['/structs/:typs']
pub fn (mut app AdminApp) view(typs string) vweb.Result {
	typ := typs.int()
	type_name := reflection.type_name(typ)
	if type_name.len == 0 {
		eprintln(typs)
		// the type does not exist!
		return app.not_found()
	}

	return $vweb.html()
}

['/create/:typs'; post]
pub fn (mut app AdminApp) create(typs string) vweb.Result {
	typ := typs.int()

	create_row(typ)

	return app.text('Created row!')
}

pub fn start() {
	vweb.run(&AdminApp{}, 8000)
}
