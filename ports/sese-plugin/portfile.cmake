set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-plugin)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese.plugin/archive/refs/tags/0.1.0.zip"
        FILENAME "sese-plugin.0.1.0.zip"
        SHA512 1f341e5cdc78c6f37b0365f3b9dd1d08114b571900a72148cdf334ace53d4c8d41265305cd0dc8f31f3f4b41e2c9ba51e0b0317655fd6b05a0b1ebbeedc21f40
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


