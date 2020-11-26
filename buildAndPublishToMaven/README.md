This is a quick script to upload files to my maven repository hosted on GitHub pages. You can use it too if you want. It is built for Minecraft mods using Fabric Loom.

**The function is made for macOS. I haven't tested it on a GNU/Linux system.**

*Just to be clear: This doesn't let **you** upload files to my maven repo, I'm just saving this here as a backup.*

## Usage
The [function file](#file-function-zsh) is built for the Z Shell (ZSH), and you need to load it on there. The best way to do that is to download that file and `source` it in your `.zshrc`.

* Run `buildAndPublishToMaven <projectDir> <mavenRepoRepo> <buildGradlePatch>`
    * `<projectDir>` is the directory where the Gradle project is located. For example `~/my_project/`
    * `<mavenRepoRepo>` is the directory where a GitHub repository for a maven repository is located (for me it's a clone of [YTG1234/maven](https://github.com/YTG1234/maven))
    * `<buildGradlePatch>` is a *URL* to a raw file that will be used to (un)patch `build.gradle` to add publishing to the repo. You can get it [from this Gist](#file-build-gradle-patch).
* The function will take care of doing everything, except for pushing. You will have to push to the remote yourself.
