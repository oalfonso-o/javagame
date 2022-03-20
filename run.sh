DIRBUILD=.build
JAVASOURCESFILE=$DIRBUILD/javaSources.txt
CLASSSOURCESFILE=$DIRBUILD/classSources.txt
BUILDFILE=$DIRBUILD/build.jar

echo ""
echo "----> Cleaning previous builds..."
find . -type f -name '*.class' -delete
rm $DIRBUILD -rf | true
mkdir $DIRBUILD

# find all java files and output the names to sources.txt
find -name "*.java" > $JAVASOURCESFILE

echo ""
echo "----> Compiling .java to .class files..."
javac @$JAVASOURCESFILE
echo ""
echo "----> Files compiled to .class:"
cat $JAVASOURCESFILE

# get compiled files and now output to sources.txt
find -name "*.class" > $CLASSSOURCESFILE

echo ""
echo "----> Creating .jar from .class files..."
jar cvfm $BUILDFILE MANIFEST.MF @$CLASSSOURCESFILE
echo ""
echo "----> Files found:"
cat $CLASSSOURCESFILE

echo ""
echo "----> Contents of .jar:"
jar tf $BUILDFILE
echo ""
echo "----> Contents of new manifest:"
unzip -p $BUILDFILE META-INF/MANIFEST.MF

printf "\033[0;32m----> Running .jar...\033[0m\n"
java -jar $BUILDFILE

echo ""
echo "----> Cleaning build..."
find . -type f -name '*.class' -delete
rm $DIRBUILD -rf | true