## Clone, build, and run locally
Once you have installed the Swift compiler and any system level dependencies required by the Kitura framework, you can proceed with the steps described in this section.

1) Clone this repo using `git clone https://github.com/digitwolf/SwiftFerrySkill.git`.

2) Go to the root folder of this repo on your system and issue the `swift build` command to compile the application:

```
$ swift build
```

```
$ ./.build/debug/Server
```

Once the server starts, you should see the message _Listening on port 8080_ as shown above.

3) Open your browser at [http://localhost:8080](http://localhost:8080) to access the welcome page. This page displays static HTML content served from the Kitura-based server application. You can explore the `public` folder in the repo to see the HTML file and related resources (e.g. images, CSS file)

4) Generate XCode Project

```
$ swift package generate-xcodeproj
```

It will generate FerrySkill.xcodeproj which you can open in xcode:
```
xcode FerrySkill.xcodeproj
```
