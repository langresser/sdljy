import os,glob

def DirLower(dirName):
    print("Process {0}".format(dirName));
    for root, dirs, files in os.walk(dirName):
        for dir in dirs:
            strDir = os.path.join(root, dir);
            os.rename(strDir, strDir.lower());

        for file in files:
            strFile = os.path.join(root, file);
            os.rename(strFile, strFile.lower());


DirLower("sdljy")


