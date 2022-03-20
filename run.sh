DIRBUILD=.build
JAVASOURCESFILE=$DIRBUILD/javaSources.txt
CLASSSOURCESFILE=$DIRBUILD/classSources.txt
BUILDFILE=$DIRBUILD/build.jar

echo ""
printf "\033[0;36m0.\033[0m -> Cleaning previous builds...\n"
find . -type f -name '*.class' -delete
rm $DIRBUILD -rf | true
mkdir $DIRBUILD

# find all java files and output the names to sources.txt
find -name "*.java" > $JAVASOURCESFILE

echo ""
printf "\033[0;36m1.\033[0m -> Compiling .java to .class files...\n"
javac @$JAVASOURCESFILE
echo "----> Files compiled to .class:"
cat $JAVASOURCESFILE

# get compiled files and now output to sources.txt
find -name "*.class" > $CLASSSOURCESFILE

echo ""
printf "\033[0;36m2.\033[0m -> Creating .jar from .class files...\n"
jar cvfm $BUILDFILE MANIFEST.MF @$CLASSSOURCESFILE
echo "----> Files found:"
cat $CLASSSOURCESFILE
echo "----> Contents of .jar:"
jar tf $BUILDFILE
echo "----> Contents of new manifest:"
unzip -p $BUILDFILE META-INF/MANIFEST.MF

printf "\033[0;32m3. -> Running .jar...\033[0m\n"
java -jar $BUILDFILE

echo ""
echo "----> Cleaning build..."
find . -type f -name '*.class' -delete
rm $DIRBUILD -rf | true