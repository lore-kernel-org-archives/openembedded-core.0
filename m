Return-Path: <andrej.valek@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id B5AF6744B1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 12:46:06 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id w85Ck6Tf021050
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 5 Sep 2018 14:46:06 +0200
Received: from [192.168.253.100] ([163.242.50.201])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id w85Ck5p4009451;
	Wed, 5 Sep 2018 14:46:05 +0200
To: Alex Kiernan <alex.kiernan@gmail.com>,
	"Denys Vlasenko <vda.linux@googlemail.com>; Chen Qi"
	<Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <CAO5Uq5SjWvxmEXisPRmgM92JaGRHgAdd0qoCsTb=P=1PDzh+fg@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual; keydata=
	xsBNBFkSzTcBCADSJTRk7YudjxZ/ma2IXPV4Y5gkACJKDOYAZcRqNjDbIFUmc7ck3KeuUGKy
	ifrpWD6/7YPXbixv4sAlFly6sNL31agVHLO4BCCE77DaZ2smiN0JaLYzmMdr0BPLMsL96nBO
	UDo8o2a1NwU+GpD8a0/vcovro+NgLvfk9xP4rYAve09VYvF4DbQNW9Y+8reqWFnBI8EN5Fps
	vPCUr/TSuxk3VpU//8QtP7WqyRA31qiWFDxE2dqSnrpUBojxQMY94tDP7kjQtzD2ZpaDt1oL
	PDE/n6qtYG792JVvNjuo1QpfPo8a8I4HvMmbh/Orv0fniauB229OaWNPp27ln55xG8FvABEB
	AAHNJ0FuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPsLAfgQTAQIAKAUC
	WRLNNwIbAwUJA8JnAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ3npj5PmioO8DZQgA
	ibpOwfxDw3qlSEHDE395Tf+bEAYWjjNz9OQB4nnhq1Ql9jbUhfQQk/equaxoIfNHyLNDbeUU
	8ULLXJS+nDRi13yf2w/9L386fd5V63cdP6no2dpnEhwOKV1miiUtvcjDCe3bjm7WHVfg9OsF
	4AWox+/GR6sGJHRestHeXIJthmru8dB57oKy2fPgPpY1Ld1Wwb4okZgIi+1sKx19fk2xX9lc
	KpdvCXx+6FB3a9+sJTmb12meeGtKWC7BeElM2sG5NK7yx9zFNqSRebilwNankSE0QzWwmu4M
	bW6OTuxv/3qeHIvFH3EhrEmnd68Zm4+/jx2ZN5Ax23ZaGD8pabuO587ATQRZEs03AQgA0oCu
	faa9qlV0iYK+XlLcW6u55/o5psqtwoUCo8u18v8j4qB80r9latFKsO/SOjhVOYgIuzTTftQs
	Di71i9GJwK8Kk2FMo0YuJ9J9xdcvmjUI2vNUbOcaz2V0tRC9P/P5UaIltQAMVxbFHDwj17UA
	7YpEUL3ixxMs/usIKKGA+jIvsBdcn1WFji/NXLffwQ+zrAoT3q8EuGn4jSdROND16e9ynKgk
	D5D+EoA5RoFi8y3tRHJsi/dNlaUISsQOux/MgXsk1UU2lkmq7uxddRw8xwzG5dhx79sQp4Dt
	YpSfZBylD3DnCTg3ajdWCHGVyBdMLVncfj8sPDsVkCozTaSqFwARAQABwsBlBBgBAgAPBQJZ
	Es03AhsMBQkDwmcAAAoJEN56Y+T5oqDv8EEH/0qUECI1OpJS5R9Di9yc6YOfyNdCFHJ5rnUx
	dTr5+U3z30HBpzv1yPtO0fRQPulFRp2T81nhzT07B6Jce/pPUPE4QUVuwkM80KUbveJSNVHH
	Vp+9MGHEmpSevVHGKwzr+/7n5KJd5+SX3Y0mFxbu7GUZTMvM9Ra/p7lu0DsAH1CgEzKf3KTx
	FrUN9oSYETbN3l6+pxO3RYAxtCVRMCOCJ7skHkfPH0ADxsbecaKo2CHqcDJigqZBKxjnWYsm
	0+8mRhIQs3JuF0z7hKJGRacdGvKdQbCo0swLT9NVWU0IcUc/gwsCzQu/0Iml1x6MbgameiX4
	emYHzsJ3+vLapH+kAEI=
Message-ID: <4b1aadc2-475b-df41-270c-ffbfbcf086c1@siemens.com>
Date: Wed, 5 Sep 2018 14:46:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5SjWvxmEXisPRmgM92JaGRHgAdd0qoCsTb=P=1PDzh+fg@mail.gmail.com>
Subject: Re: systemd/busybox fsck fail to run
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2018 12:46:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Alex,

There could be multiple options, how to handle this.

My 2cents about this problem:
 1. Use update-alternatives to handle this
 2. Rework busybox itself to handle this option
 3. Just create a patch to ignore this option

Cheers,
Andrej

On 09/05/18 10:37, Alex Kiernan wrote:
> I've just come across a box with a corrupt filesystem which wasn't
> being cleaned (using systemd and busybox):
> 
> Aug 29 16:03:22 localhost systemd-fsck[143]: read_bad_blocks_file: No
> such file or directory while trying to open -M
> Aug 29 16:03:22 localhost systemd-fsck[143]: Warning: fsck.ext4
> /dev/mmcblk0p4 terminated by signal 8
> Aug 29 16:03:22 localhost systemd-fsck[143]: fsck failed with exit status 8.
> Aug 29 16:03:22 localhost systemd-fsck[143]: Ignoring error.
> Aug 29 16:03:22 localhost systemd[1]:
> systemd-fsck@dev-mmcblk0p4.service: cgroup is empty
> Aug 29 16:03:22 localhost systemd[1]:
> systemd-fsck@dev-mmcblk0p4.service: Child 143 belongs to
> systemd-fsck@dev-mmcblk0p4.service.
> Aug 29 16:03:22 localhost systemd[1]:
> systemd-fsck@dev-mmcblk0p4.service: Main process exited, code=exited,
> status=0/SUCCESS
> Aug 29 16:03:22 localhost systemd[1]:
> systemd-fsck@dev-mmcblk0p4.service: Changed start -> exited
> Aug 29 16:03:22 localhost systemd[1]:
> systemd-fsck@dev-mmcblk0p4.service: Job
> systemd-fsck@dev-mmcblk0p4.service/start finished, result=done
> Aug 29 16:03:22 localhost systemd[1]: Started File System Check on
> /dev/mmcblk0p4.
> 
> It turns out systemd-fsck unconditionally passes `-l` to lock the filesystem:
> 
> https://github.com/systemd/systemd/blame/master/src/fsck/fsck.c#L408
> 
> which busybox fsck doesn't interpret and so passes on to fsck.ext4,
> which then interprets it as a badblocks file...
> 
> What's the right answer here? Add a patch to busybox fsck so it just
> ignores `-l`, or do we need something more sophisticated?
> 
> Obviously swapping in util-linux-fsck works around the problem.
> 

