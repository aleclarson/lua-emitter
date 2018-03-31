package = "emitter"
version = "0.0.2"

description = {
	summary = "Event emitters for Lua";
	homepage = "https://github.com/aleclarson/lua-emitter";
	license = "MIT";
}

source = {
	url = "git+https://github.com/aleclarson/lua-emitter.git";
}

build = {
	type = "builtin";
	modules = {
		["emitter"] = "emitter/init.lua";
	};
}
