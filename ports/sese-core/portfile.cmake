set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO libsese/sese-core
        REF 1.3.2
        SHA512 878c19c886f5333ef13712febd7e95aaa4dceb10053a73725ff5e241d7e33fbe209deab0f272b96f49c3da7cce2f3f624cae83771643377d62298dcb57b15dc6
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        tests        SESE_BUILD_TEST
        async-logger USE_ASYNC_LOGGER
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