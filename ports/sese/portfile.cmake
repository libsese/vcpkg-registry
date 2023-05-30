set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-core/archive/refs/tags/0.5.3a.zip"
        FILENAME "sese-core-0.5.3a.zip"
        SHA512 b7f40babaed592bab899d54e78e555817e3d0b037ac2da1978ba70df32d44cb77c219097c85599097044d19bd2fdf1a3889fd2aa147c565623840807d59bf611
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