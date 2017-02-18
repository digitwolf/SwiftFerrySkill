## What is Kitura?
[Kitura](https://github.com/IBM-Swift/Kitura) is a new, modular, package-based web framework written in the Swift language, that allows you to build web services with complex routes, easi

## Kitura-Starter Overview
Kitura-Starter is a [Kitura](https://github.com/IBM-Swift/Kitura) based server application that you can use as a starting point to get your own Kitura application up and running on Bluemix. Also, if you'd like to run this app locally, you can do so on your [macOS](http://www.apple.com/osx/) or [Ubuntu 14.04](http://www.ubuntu.com/download) system.

## Application Requirements
To compile and run this starter application on your local system, you need to install the [Swift compiler](https://swift.org/download/) for your platform. This version of Kitura-Starter works with the Swift `3.0.2` release binaries. Compatibility with other Swift versions is not guaranteed.

For further details on executing Kitura-based applications locally, please see Kitura's instructions for installation on [macOS ](https://github.com/IBM-Swift/Kitura#installation-os-x) and on [Linux](https://github.com/IBM-Swift/Kitura#installation-linux-apt-based) since system level dependencies may be required before attempting to execute this starter app.

If you are interested in manually deploying the application to Bluemix, you'll need to install the Cloud Foundry [command line](https://docs.cloudfoundry.org/devguide/cf-cli/install-go-cli.html) on your system.  Once it is installed, you can use it to [authenticate and access](https://www.ng.bluemix.net/docs/starters/install_cli.html) your Bluemix organization(s) and spaces.  You can find further details on how to deploy this sample application to Bluemix in a subsequent section.

## Clone, build, and run locally
Once you have installed the Swift compiler and any system level dependencies required by the Kitura framework, you can proceed with the steps described in this section.

1) Clone this repo using `git clone https://github.com/digitwolf/SwiftFerrySkill.git`.

2) Go to the root folder of this repo on your system and issue the `swift build` command to compile the application:

```
$ swift build
```

```
$ ./.build/debug/Kitura-Starter
 INFO: Kitura_Starter main.swift line 29 - Server will be started on 'http://localhost:8080'.
 INFO: listen(on:) HTTPServer.swift line 73 - Listening on port 8080
```

Once the server starts, you should see the message _Listening on port 8080_ as shown above.

3) Open your browser at [http://localhost:8080](http://localhost:8080) to access the welcome page for the Kitura-Starter app. This page displays static HTML content served from the Kitura-based server application. You can explore the `public` folder in the repo to see the HTML file and related resources (e.g. images, CSS file)

4) Generate XCode Project

```
$ swift package generate-xcodeproj
```

It will generate FerrySkill.xcodeproj which you can open in xcode:
```
xcode FerrySkill.xcodeproj
```
