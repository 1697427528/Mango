#include "Application.h"

#include "Events/ApplicationEvent.h"
#include "Log.h"

namespace Mango {

	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{
		WindowResizeEvent *e = new WindowResizeEvent(1280, 720);
		if (e->IsInCategory(EventCategoryApplication))
		{
			MG_CORE_TRACE(*e);
		}
		if (e->IsInCategory(EventCategoryInput))
		{
			MG_CORE_TRACE(*e);
		}

		while (true);
	}

}
