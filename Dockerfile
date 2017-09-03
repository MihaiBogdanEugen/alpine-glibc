# Start from alpine linux 3.5.*
FROM alpine:3.5

# Install glib 2.25
RUN ALPINE_GLIBC_APK_BASE_URL="https://github.com/MihaiBogdanEugen/alpine-glibc-apk/releases/download" && \
    ALPINE_GLIBC_APK_VERSION="2.25-r1" && \
    ALPINE_GLIBC_APK="glibc-$ALPINE_GLIBC_APK_VERSION.apk" && \
    ALPINE_GLIBC_BIN_APK="glibc-bin-$ALPINE_GLIBC_APK_VERSION.apk" && \
    ALPINE_GLIBC_I18N_APK="glibc-i18n-$ALPINE_GLIBC_APK_VERSION.apk" && \
    ID_RSA_PUB_SHA256_SUM="26df3c56980ba67f5dda27d290bfa708dc8d991f9f5fcc74bea87b7191e255f9" && \
    ALPINE_GLIBC_APK_SHA256_SUM="2b466dc92f98440260fe571d9620c64323953d0644e03d9e10b513e1103fe61f" && \
    ALPINE_GLIBC_BIN_APK_SHA256_SUM="5642a3142de834b1c3ad113472d07d2022909d04ee54551fb385be0370c90b81" && \
    ALPINE_GLIBC_I18N_APK_SHA256_SUM="388f97c07d698618f1b45e9cfc6a2cc6ae1a03c31e87514ec848de9f4e9e9f25" && \
    apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    wget \
        "https://raw.githubusercontent.com/MihaiBogdanEugen/alpine-glibc-apk/master/user.abuild/mbe1224%40gmail.com.rsa.pub" \
        -O "/etc/apk/keys/mbe1224@gmail.com.rsa.pub" && \
    echo "${ID_RSA_PUB_SHA256_SUM}  /etc/apk/keys/mbe1224@gmail.com.rsa.pub" | sha256sum -c - && \
    wget "$ALPINE_GLIBC_APK_BASE_URL/$ALPINE_GLIBC_APK_VERSION/$ALPINE_GLIBC_APK" && \
    echo "${ALPINE_GLIBC_APK_SHA256_SUM}  ${ALPINE_GLIBC_APK}" | sha256sum -c - && \
    wget "$ALPINE_GLIBC_APK_BASE_URL/$ALPINE_GLIBC_APK_VERSION/$ALPINE_GLIBC_BIN_APK" && \
    echo "${ALPINE_GLIBC_BIN_APK_SHA256_SUM}  ${ALPINE_GLIBC_BIN_APK}" | sha256sum -c - && \
    wget "$ALPINE_GLIBC_APK_BASE_URL/$ALPINE_GLIBC_APK_VERSION/$ALPINE_GLIBC_I18N_APK" && \
    echo "${ALPINE_GLIBC_I18N_APK_SHA256_SUM}  ${ALPINE_GLIBC_I18N_APK}" | sha256sum -c - && \
    apk add --no-cache \
        "$ALPINE_GLIBC_APK" \
        "$ALPINE_GLIBC_BIN_APK" \
        "$ALPINE_GLIBC_I18N_APK" && \
    \
    rm "/etc/apk/keys/mbe1224@gmail.com.rsa.pub" && \
    /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true && \
    echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
    \
    apk del glibc-i18n && \
    \
    rm "/root/.wget-hsts" && \
    apk del .build-dependencies && \
    rm \
        "$ALPINE_GLIBC_APK" \
        "$ALPINE_GLIBC_BIN_APK" \
        "$ALPINE_GLIBC_I18N_APK"

# set UTF-8 locale as default
ENV LANG=C.UTF-8