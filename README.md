## Alpine Linux Docker image with GNU C library (glibc)

### Supported tags and respective Dockerfile links:

* ```3.5-2.25``` _\([3.5-2.25/Dockerfile]\)_
* ```3.5-2.26``` _\([3.5-2.26/Dockerfile]\)_
* ```3.6-2.25``` _\([3.6-2.25/Dockerfile]\)_
* ```3.6-2.26```, ```latest``` _\([3.6-2.26/Dockerfile]\)_

#### All tag names follow the naming convention:

```alpine_image_tag``` + '-' + ```glibc_version```

### Usage:

Build the image
```shell
docker build -t mbe1224/alpine-glibc .
```

### About this image:

- Alpine Linux image
- Signed glibc-_version_-r1.apk, glibc-bin-_version_-r1.apk and glibc-i18n-_version_-r1.apk packages
- SHA 256 sum checks for all downloads

### License:

* [MIT License]

   [3.5-2.25/Dockerfile]: <https://github.com/MihaiBogdanEugen/alpine-glibc/blob/3.5-2.25/Dockerfile>
   [3.5-2.26/Dockerfile]: <https://github.com/MihaiBogdanEugen/alpine-glibc/blob/3.5-2.26/Dockerfile>
   [3.6-2.25/Dockerfile]: <https://github.com/MihaiBogdanEugen/alpine-glibc/blob/3.6-2.25/Dockerfile>
   [3.6-2.26/Dockerfile]: <https://github.com/MihaiBogdanEugen/alpine-glibc/blob/3.6-2.26/Dockerfile>
   [MIT License]: <https://raw.githubusercontent.com/MihaiBogdanEugen/alpine-glibc/master/LICENSE>
