import br.com.borgeslandeiro.intranet.HomeController

class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/building/listTorres/$id" (controller: "building", action: "listTorres")
		"/"(controller: 'home', action: 'indexHome')
		"500"(view:'/error')
	}
}
