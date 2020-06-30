#pragma once

#ifdef MG_PLATFORM_WINDOWS
#include "Application.h"

extern Mango::Application* Mango::CreateApplication();

int main(int argc, char** argv) {
	auto app = Mango::CreateApplication();
	app->Run();
	delete app;
	return 0;
}

#endif // MG_PLAT_WINDOWS