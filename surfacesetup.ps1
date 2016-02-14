# @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin 
# Use --force if you need to reinstall and of the software

choco visualstudio2015community
choco install xunit.visualstudio -y  
choco install SpecFlow -y  
choco install resharper -y   ##  LICESNSE REQUIRED

# databases toold
choco install mssqlserver2014express  -y  
choco install mssqlservermanagementstudio2014express -y  

# browsers
choco install Firefox -y  
choco install GoogleChrome -y  

# source control tools
choco install git.install -y  
choco install gitextensions -y  
choco install githubforwindows -y  
choco install sourcetree -y  

#Testing
choco install pester -y  

#other tools
choco install notepadplusplus.install -y  
choco install winmerge -y  
choco install 7zip.install -y  
choco install fiddler -y  
choco install curl -y  
choco install scriptcs -y  
choco install sublimetext3 -y  
choco install SublimeText3.PackageControl -y  
choco install azurestorageexplorer -y  
choco install putty -y  
choco install winscp -y  
#choco install virtualbox

choco install vlc -y  
