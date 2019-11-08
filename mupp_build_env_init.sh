#! /bin/bash
print 'entitlement config'
cd ios
ruby entitlement_config.rb
cd ..
#屏蔽Build Shell
sed -i "" "s/\/bin\/sh \\\\\"\\\$FLUTTER_ROOT/#\/bin\/sh \\\\\"\\\$FLUTTER_ROOT/" ./ios/Runner.xcodeproj/project.pbxproj
#拷贝已生成好的Dart代码中间产物
mtl_dir="ios/Flutter_MTL/Flutter"
flutter_dir="ios/Flutter"
[ -d ${flutter_dir} ] || mkdir ${flutter_dir}
rm -rf ${flutter_dir}/*
cp -r ${mtl_dir}/ ${flutter_dir}/
sizeStr=`wc -c ${flutter_dir}/Flutter.framework/Flutter`
lipoStr=`lipo -info ${flutter_dir}/Flutter.framework/Flutter`
echo "[KWLM]Flutter.framework size:${sizeStr}${lipoStr}"
cat ./ios/Runner.xcodeproj/project.pbxproj
