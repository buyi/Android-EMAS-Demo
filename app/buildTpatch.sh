#!/bin/bash

echo "(1) 修改依赖的源码和版本"
echo "    修改App工程源码"
echo "    修改versionName"


echo "(2)  重新构建apk， 生成patch 包"

./gradlew clean assembleDebug -DEMAS_BASE_VERSION=1.0.0 -DEMAS_VERSION_NAME=1.0.1


echo "(3) 上传 tpatch"
adb push app/build/outputs/tpatch-debug/update-*.json /sdcard/Android/data/com.emas.demo/cache/update.json
adb push app/build/outputs/tpatch-debug/patch-*.tpatch /sdcard/Android/data/com.emas.demo/cache

echo "(4) 点击动态部署完成安装 "
