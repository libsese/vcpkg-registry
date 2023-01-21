set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/simpleuuid)

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/libsese/SimpleUuid/archive/refs/tags/v0.1.3.zip"
    FILENAME "SimpleUuid-0.1.3.zip"
    SHA512 6c90583e29a11f859c4b1b8d6384e4cef4ee8e2632d37d7f6d73b1252ff3587494360f4b0d80ddc079cb6e2d46c813db20ef39e6a8c2c2049ce4327a619002a4
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/simpleuuid)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/simpleuuid")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/simpleuuid/LICENSE" "${CURRENT_PACKAGES_DIR}/share/simpleuuid/copyright")