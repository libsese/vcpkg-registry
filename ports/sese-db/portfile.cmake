set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-db)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-db/archive/refs/tags/v1.2.0.tar.gz"
        FILENAME "sese-db-1.2.0.tar.gz"
        SHA512 e2078d5db8bc92511ec7bc448e9b59102225bce959a5abbe2ac01e4a85ba488ccae1067c2a94de471390cd79f1ba7c972c7523f10e52bcabfdbe69cd4aff0170
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        tests   SESE_DB_BUILD_TEST
        mysql   SESE_DB_USE_MARIADB
        sqlite3 SESE_DB_USE_SQLITE
        psql    SESE_DB_USE_POSTGRES
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sese-db)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sese-db")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sese-db/LICENSE" "${CURRENT_PACKAGES_DIR}/share/sese-db/copyright")