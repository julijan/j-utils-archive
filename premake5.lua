workspace "j-utils-archive"
	configurations { "Debug", "Release" }

project "j-utils-archive"
	language "C++"
	kind "StaticLib"
	cppdialect "C++20"
	architecture "x64"
	targetdir "bin/%{cfg.buildcfg}"
	files { "./src/**.h", "./src/**.cpp" }
	includedirs { "./includes/src", "./includes/src/**", "./includes/uses/src/**" }
	libdirs { "./includes/lib/**", "./includes/uses/lib/**" }
	buildoptions {
		"`pkg-config --cflags libarchive`"	}
	linkoptions {
		"`pkg-config --libs libarchive`"	}
	links {
		"archive", "j-utils-fs", "j-utils-string"
	}
	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "On"
	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "On"
