if glob('AndroidManifest.xml') =~ ''
    if filereadable('project.properties') 
        let s:androidSdkPath = '/home/ryujin/Apps/android-sdk-r20'
        for line in readfile('project.properties')
          if line =~ 'target='
            let s:androidTargetPlatform = split(line, '=')[1]
            let s:targetAndroidJar = s:androidSdkPath . '/platforms/' . s:androidTargetPlatform . '/android.jar'
            if $CLASSPATH =~ ''
              let $CLASSPATH = s:targetAndroidJar . ':' . $CLASSPATH
            else
              let $CLASSPATH = s:targetAndroidJar
            endif
            break
          endif
        endfor
    end
endif
