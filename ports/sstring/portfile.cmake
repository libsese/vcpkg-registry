set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sstring)

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/libsese/SString/archive/refs/tags/v0.1.3.zip"
    FILENAME "SString-0.1.3.zip"
    SHA512 c7bdda20f3c25276941eacd445d77908c541a0150aa85c39fef64585debb086c71817b0fe7438f2b0844f769d595c08a0e34065bbd5b21582c8c9778ec7f5863
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