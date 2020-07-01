#pragma once

#ifdef MG_PLATFORM_WINDOWS

extern Mango::Application* Mango::CreateApplication();

int main(int argc, char** argv)
{
	Mango::Log::Init();
	MG_CORE_WARN("Initialized Log!");
	MG_CLIENT_INFO("Hello!");

    auto app = Mango::CreateApplication();
    app->Run();
    delete app;
    return 0;
}

#endif // MG_PLAT_WINDOWS