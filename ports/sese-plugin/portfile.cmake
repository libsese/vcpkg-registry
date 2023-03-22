set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-plugin)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese.plugin/archive/refs/tags/0.2.0.zip"
        FILENAME "sese-plugin.0.2.0.zip"
        SHA512 69ad1d332fb2005742661bca1ecdd935c209407209684ba95dad23628267f21e593db849d457b0449bb9ffa74abd8335ac277803ca34bfe0cf1554fddedeefb8
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


