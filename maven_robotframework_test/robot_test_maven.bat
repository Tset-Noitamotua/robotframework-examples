@echo off

mvn -B archetype:generate ^
      -DarchetypeGroupId=com.github.markusbernhardt ^
      -DarchetypeArtifactId=robotframework-archetype-quickstart ^
      -DarchetypeVersion=1.0.1 ^
      -DgroupId=com.yourcompany.yourdepartment ^
      -DartifactId=robot_test