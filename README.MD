# First steps in Java

## How to run a simple JAVA app building a .jar and executing it from command line
```
./run.sh
```

This script automatically:
1. searches for all .java files
2. compiles these .java to .class files
3. include these .class files + the MANIFEST.MF file in a .jar file
4. executes this .jar file

Some notes:
- The idea is to don't be locked to an IDE and to understand how JAVA works when executing a package
- The package name an paths have to be the same in multiple places:
    * in the definition of the .java files, these files need the package name and the paths names, in this case it is "com.oalfonso.javagame"
    * in the definition of the Main-Class of the MANIFEST.MF -> com.oalfonso.javagame, and after the package name we can include the name of the class that will be the main.
    * in the build command when providing the path to the class files -> they MUST have the same path as the .java files because they will be moved inside the .jar with these paths. A problem found was building the .class files in a different directory (.build/com/oalfonso/javagame) so then in the .jar the package had also the prefix .build. To avoid this the idea is to build the .class files in the same path as the .java files and give them to the jar command with the original paths.