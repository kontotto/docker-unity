# docker-unity(Docker container for Unity)
This image is suitable for building.
You can easily build Unity from the command line.

## Preparation
In order to build from the command line you need to add only one class to your project.
Like an official sample, create a build class below the Editor directory (BuildPlayerExample for example).

```
using UnityEditor;
using UnityEngine;

public class BuildPlayerExample : MonoBehaviour
{
    [MenuItem("Build/Build iOS")]
    public static void MyBuild()
    {
        BuildPlayerOptions buildPlayerOptions = new BuildPlayerOptions();
        buildPlayerOptions.scenes = new[] { "Assets/Scene1.unity", "Assets/Scene2.unity" };
        buildPlayerOptions.locationPathName = "iOSBuild";
        buildPlayerOptions.target = BuildTarget.iOS;
        buildPlayerOptions.options = BuildOptions.None;
        BuildPipeline.BuildPlayer(buildPlayerOptions);
    }
}
```

## Build
In order to build, it is necessary to fill in the following three.
Project path on the host side.
E-mail address and password registered with Unity.
```
docker run --rm -v /path/to/project:/root kontotto/unity Unity -batchmode -quit \
  -projectPath /root -executeMethod BuildPlayerExample.MyBuild \
  -serial SB-XXXX-XXXX-XXXX-XXXX-XXXX -username "youremail@example.com" \
  -password "yourpassword"
```