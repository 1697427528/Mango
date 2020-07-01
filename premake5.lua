workspace "Mango"
	architecture "x64"

	configurations
	{
		"Debug", 
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Mango"
	location "Mango"
	kind "SharedLib"
	language "C++"
	
	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.17763.0"

		defines {
			"MG_PLATFORM_WINDOWS",
			"MG_BUILD_DLL",
			"_WINDLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
		
	filter "configurations:Debug"
		defines "MG_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "MG_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "MG_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	
	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Mango/vendor/spdlog/include",
		"Mango/src"
	}

	links {
		"Mango"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.17763.0"

		defines {
			"MG_PLATFORM_WINDOWS",
			"_WINDLL"
		}

	filter "configurations:Debug"
		defines "MG_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "MG_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "MG_DIST"
		optimize "On"
