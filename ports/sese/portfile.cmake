set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-core/archive/refs/tags/0.5.3a.zip"
        FILENAME "sese-core-0.5.3a.zip"
        SHA512 fceba95a7ced1d9715de461e171d948f44c58c4a043949c94e8c414a61af41024000422858cafb7634d6bb887fedfed0df7e6d40fd612923f87982c8b722ad1b
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sese)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sese")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sese/LICENSE" "${CURRENT_PACKAGES_DIR}/share/sese/copyright")