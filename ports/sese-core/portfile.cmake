set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO libsese/sese-core
        REF 2.0.1
        SHA512 9500eae8de27a1a36c4423f388434bf78759781a67221fb5e45bece8975d14a6d3d0987d98cd6b73d90fdd8c1218894691c26093d8044a2bb451e4b4326f2e1c
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        tests        SESE_BUILD_TEST
        mysql        SESE_DB_USE_MARIADB
        sqlite3      SESE_DB_USE_SQLITE
        psql         SESE_DB_USE_POSTGRES
        async-logger SESE_USE_ASYNC_LOGGER
        archive      SESE_USE_ARCHIVE
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sese-core)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sese-core")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sese-core/LICENSE" "${CURRENT_PACKAGES_DIR}/share/sese-core/copyright")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")