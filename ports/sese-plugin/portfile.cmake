set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-plugin)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-plugin/archive/refs/tags/0.2.2.zip"
        FILENAME "sese-plugin.0.2.2.zip"
        SHA512 8cddd80130acbc5abf1327772fcf9a5ea29a945838f7a805d1329b0e08f7d0bcc3f7dee2b6be86da4ffdbc18824adeff0332e10f524331f609fc98805e915bf4
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


