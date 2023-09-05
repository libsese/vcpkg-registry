set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-plugin)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-plugin/archive/refs/tags/0.2.3.zip"
        FILENAME "sese-plugin.0.2.3.zip"
        SHA512 efb57e4323f975c47d7ab0e71ab181f3b2d5f055b8aa74307f960431146f5d31ab57fe26df831da397a2a5616238f4cdb74ef06391bd47be4e514bfe0d2d5ba8
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sese-plugin)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sese-plugin")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sese-plugin/LICENSE" "${CURRENT_PACKAGES_DIR}/share/sese-plugin/copyright")


