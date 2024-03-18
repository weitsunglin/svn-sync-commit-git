# svn sync commit git tutorial [使用git財寶樹龜]

1. 將要同步commit的項目，滑鼠右鍵點選要同步commit的資料夾，git create  local repository 


2. 將 local repository 設定 remote repository (ex: https://github.com/OLD-RD2/test.git)

![remote setting](https://github.com/weitsunglin/svn-sync-commit-git/blob/main/step1.jpg)

3. 檢查電腦是否有svn

![svn check](https://github.com/weitsunglin/svn-sync-commit-git/blob/main/step2.jpg)


4. 設定svn hook script

![svn check](https://github.com/weitsunglin/svn-sync-commit-git/blob/main/step3.jpg)


## 目前設定只將 [ trunk ] 同步commit 至 github
1. 如果在branches開發，不會同步commit到igs git
2. 如果切到trunk，將branche merger過來，再commit，就會同步到github了