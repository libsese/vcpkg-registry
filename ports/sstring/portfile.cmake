set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sstring)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/SString/archive/refs/tags/v0.1.4.zip"
        FILENAME "SString-0.1.4.zip"
        SHA512 a869c46ee721e277710f245ced9f6f959b36a1d05ad7edd35cc923aec3d65ef9e6f7626d7059ca26d448af4f4ee1d63706076ca5947285875d4d9f403f6bec77
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/SString)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/license" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sstring")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sstring/license" "${CURRENT_PACKAGES_DIR}/share/sstring/copyright")