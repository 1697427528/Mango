#pragma once

#ifdef MG_PLATFORM_WINDOWS
#ifdef MG_BUILD_DLL
#define MANGO_API __declspec(dllexport)
#else
#define MANGO_API __declspec(dllimport)
#endif
#else
#error Sorry, Mango only supports Windows!
#endif // MG_PLATFORM_WINDOWS
