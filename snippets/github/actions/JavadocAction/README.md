# GitHub actions job for generating Javadoc HTML

## How to set up
* Make sure your repo uses Gradle as it's build system.
* Create a GitHub action.
* Put in all the necessary info (name, on, ...).
* Create a `jobs` object.
* Copy the `javadoc` object and paste it into the `jobs` object.

## How to set up GH pages
* In your repo settings, enable GitHub pages.
* Set the folder to `/docs`.
* The Javadoc will now be ready in GitHub pages!
