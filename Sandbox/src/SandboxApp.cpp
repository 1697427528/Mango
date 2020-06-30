#include <Mango.h>

class Sandbox : public Mango::Application {
public:
	Sandbox() {

	}

	~Sandbox() {

	}
};

Mango::Application* Mango::CreateApplication() {
	return new Sandbox();
}
