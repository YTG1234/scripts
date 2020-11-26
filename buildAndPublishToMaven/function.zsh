function buildAndPublishToMaven {
    # Change dir into the target project
    cd "$1"
    # patch build.gradle
    curl "$3" | patch
    # build and publish
    ./gradlew build
    ./gradlew publish
    # unpatch build.gradle
    curl "$3" | patch -R
    # remove build.gradle.orig
    rm build.gradle.orig
	# assuming the target project published to ./repo, copy the files to the maven
	cp -R ./repo/* "$2"
	# remove the repo folder because it's not needed
	rm -rf repo
	# go into repo repo
	cd "$2"
	# commit changes
	git add --all
	git commit -m "published project"
	echo "now, good sir, you just need to push it yourself"
}
