 /Users/rasharab/.android-sdk-installer/android-sdk-macosx/tools/bin/sdkmanager --update
 /Users/rasharab/.android-sdk-installer/android-sdk-macosx/tools/bin/sdkmanager --list --verbose |\
    # This is a hack as 25.2.4- tools do not correctly list paths for sdkmanager
    # grep -Riwo -e "path.*>" $ANDROID_STORE | awk -F'path="' -F'"' {'print $2'} | sort | uniq |\
    # Filter packages
    egrep '^\S+'      |\
    sed -E '/(---)/d'  |\
    sed -E '/(Info)/d' |\
    sed -E '/(Installed)/d' |\
    sed -E '/(Available)/d' |\
    sed -E '/(sources)/d' |\
    sed -E '/(docs)/d' |\
    sed -E '/(mips)/d' |\
    sed -E '/(intel)/d' |\
    sed -E '/(android-tv)/d' |\
    sed -E '/(android-wear)/d' |\
    sed -E '/(usb)/d' |\
    sed -E '/(x86)/d' |\
    sed -E '/(arm64)/d' |\
    sed -E '/(add-ons;addon-google_apis-google-(1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19))/d' |\
    sed -E '/(lldb;2.(0|1|2))/d' |\
    # emulators no longer really work in our environment
    sed -E '/(system-images)/d' |\
    sed -E '/(^tools)/d' |\
    sed -E '/(done)/d'