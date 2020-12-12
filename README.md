# Coolapk-Linux-PKGBUILD

为Coolapk-Linux提供自动打包服务以及PKGBUILD文件的存放。    

你可以在这里提交PR以添加PKGBUILD。    

***注意：本repo尚处于施工阶段，可能有待完善处或者未知问题！***

## Getting Started

请检查你是否已经是CoolapkLinux organization的成员。如果是，你可以直接在repo上修改。如果不是，你需要先创建一个fork。

这个repo的目录如下：

**.github/workflows/** ====>存储所有workflows。

|-**build.yml** ====>用于构建软件包。

|-**update.yml** ====>用于更新版本号，并将需要更新的包名写入need-update。其功能被迁移到update.sh。

**pkgbuild/** ====>存储所有包对应的PKGBUILD，其子目录名称必须为软件包名。*.install文件或配置文件也可以放在对应目录下，但请不要放置图片、压缩包或者其他二进制文件。

**update.sh** ====>执行对应的更新命令。

**packages.md** ====>markdown的软件包清单。每一次build.yml向软件源push软件包时会一并更新这个文件。

**need-update** ====>待更新的软件包会被写到这里。你也可以手动编辑这个文件来更新软件包。

## Submitting Packages

如果你不完全确定你的PKGBUILD可以正常工作，可以先将它放在draft下的软件包同名文件夹内，随后我们会进行完善。如果软件不是来自Github的release，最好附上检查更新的代码（shell脚本语言，输出为正常格式的版本号，不带“-”）。

要检验PKGBUILD是否可以通过actions的build，可以使用testpkgbuild。（见下文）

确保PKGBUILD可用后，和*.install（如果有）放入pkgbuild下同名文件夹，把包名写入need-update，然后手动运行build.yml（[Actions · Coolapk-Linux-PKGBUILD (github.com)](https://github.com/CoolapkLinux/Coolapk-Linux-PKGBUILD/actions?query=workflow%3Abuild) >> Run workflow）

## Testing PKGBUILD

可以使用[testpkgbuild](https://github.com/CoolapkLinux/testpkgbuid)进行测试，只需要在repo的根目录下建一个文件夹（名称不一定与包名相同），放入PKGBUILD，把.github/workflows/build-lazygit.yml里的

```
 - uses: 2m/arch-pkgbuild-builder@v1.16
        with:
          target: 'pkgbuild'
          pkgname: 'lazygit'
```

lazygit换成你的文件夹名称，在actions里运行这个workflow就行。

可以直接在github页面上操作，不要clone到本地（

## Contact

建议在[Discussions · Coolapk-Linux-PKGBUILD](https://github.com/CoolapkLinux/Coolapk-Linux-PKGBUILD/discussions)或者[gitter_for_coolapklinux/coolroom - Gitter](https://gitter.im/gitter_for_coolapklinux/coolroom)交流。

加入Coolapklinux organization请QQ群联系oganesson。

## Reference

- [makepkg - ArchWiki (archlinux.org)](https://wiki.archlinux.org/index.php/Makepkg)
- [PKGBUILD - ArchWiki (archlinux.org)](https://wiki.archlinux.org/index.php/PKGBUILD)
- [Creating packages - ArchWiki (archlinux.org)](https://wiki.archlinux.org/index.php/Creating_packages)




