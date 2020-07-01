#pragma once

#include "Core.h"

namespace Mango {

	class MANGO_API Application {
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();

}
