CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f ListExamples.java ]]
then
    echo "ListExamples found"
else 
    echo "need file ListExamples.java"
    exit 1
fi

cp ../TestListExamples.java ./
cp ../Server.java ./
cp ../GradeServer.java ./
mkdir lib
cp ../lib/hamcrest-core-1.3.jar lib/
cp ../lib/junit-4.13.2.jar lib/


javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
if [[ -f ListExamples.class ]] && [[ -f TestListExamples.class ]]
then
    echo "Compiled files"
else
    echo "Files did not compile correctly"
    exit 1
fi

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples


