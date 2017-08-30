# Start from alpine linux 3.6.*
FROM alpine:3.6

# Install glib 2.26
RUN ALPINE_GLIBC_APK_BASE_URL="https://github.com/MihaiBogdanEugen/alpine-glibc-apk/releases/download" && \
    ALPINE_GLIBC_APK_VERSION="2.26-r1" && \
    ALPINE_GLIBC_BASE_APK="glibc-$ALPINE_GLIBC_APK_VERSION.apk" && \
    ALPINE_GLIBC_BIN_APK="glibc-bin-$ALPINE_GLIBC_APK_VERSION.apk" && \
    ALPINE_GLIBC_I18N_APK="glibc-i18n-$ALPINE_GLIBC_APK_VERSION.apk" && \
    apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    wget \
        "https://raw.githubusercontent.com/MihaiBogdanEugen/alpine-glibc-apk/master/user.abuild/mbe1224%40gmail.com.rsa.pub" \
        -O "/etc/apk/keys/mbe1224@gmail.com.rsa.pub" && \
    wget \
        "$ALPINE_GLIBC_APK_BASE_URL/$ALPINE_GLIBC_APK_VERSION/$ALPINE_GLIBC_BASE_APK" \
        "$ALPINE_GLIBC_APK_BASE_URL/$ALPINE_GLIBC_APK_VERSION/$ALPINE_GLIBC_BIN_APK" \
        "$ALPINE_GLIBC_APK_BASE_URL/$ALPINE_GLIBC_APK_VERSION/$ALPINE_GLIBC_I18N_APK" && \
    apk add --no-cache \
        "$ALPINE_GLIBC_BASE_APK" \
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
        "$ALPINE_GLIBC_BASE_APK" \
        "$ALPINE_GLIBC_BIN_APK" \
        "$ALPINE_GLIBC_I18N_APK"

# set UTF-8 locale as default
ENV LANG=C.UTF-8