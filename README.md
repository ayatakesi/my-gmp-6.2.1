# libgmp
GNU Emacs30.0.50に含まれる`java/INSTALL`にしたがって取得したlibgmpモジュール(gnutlsの依存モジュール)のレポジトリ。

# 作成した手順
1. [Android ports for GNU Emacs](https://sourceforge.net/projects/android-ports-for-gnu-emacs/files/gmp-6.2.1-emacs.tgz)を取得して展開

```bash
$: wget https://sourceforge.net/projects/android-ports-for-gnu-emacs/files/gmp-6.2.1-emacs.tgz
$: tar xvfz gmp-6.2.1-emacs.tgz
```

2. gitレポジトリとして初期化し修正用ブランチ`my/master`をcheckout

```bash
$: cd gmp-6.2.1
$: git init
$: git checkout -b my/master
```

3. ビルド用空ディレクトリを維持するために`.gitignore`を追加([How do I add an empty directory to a Git repository?](https://stackoverflow.com/questions/115983/how-do-i-add-an-empty-directory-to-a-git-repository)を参照)

```bash
$: for mydir in &(find . -type d -name dummy)
> do
> cat <<EOS > $mydir/.gitignore
# Ignore everything in this directory
*
# Except this file
!.gitignore
EOS
> done
```

4. 追加したファイルファイルをcommitして空レポジトリにpush

```bash
$: git add -A
$: git commit -m 'nanika commit messages...'
$: gh repo create my-gmp-6.2.1 --public
$: git remote add mine https://github.com/JIBUN/my-gmp-6.2.1.git
$: git branch -M my/master
$: git push -u mine my/master
```
