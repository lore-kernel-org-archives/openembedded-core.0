Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E90AA6081F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 22:43:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s09Mhoic029600
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jan 2014 14:43:50 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 9 Jan 2014 14:43:50 -0800
Message-ID: <52CF2625.5030407@windriver.com>
Date: Thu, 9 Jan 2014 16:43:49 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <52CEEE43.1090209@linaro.org>
	<CADkTA4M+KG9uXtb91ANThgzMgOAb0WjiVmBvf48UszmSnX62dA@mail.gmail.com>
In-Reply-To: <CADkTA4M+KG9uXtb91ANThgzMgOAb0WjiVmBvf48UszmSnX62dA@mail.gmail.com>
Subject: Re: unmaintained layers
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
X-List-Received-Date: Thu, 09 Jan 2014 22:43:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/14, 3:45 PM, Bruce Ashfield wrote:
> On Thu, Jan 9, 2014 at 1:45 PM, Trevor Woerner
> <trevor.woerner@linaro.org> wrote:
>> Hi everyone,
>>
>> At the last TSC meeting the topic of unmaintained layers came up. Here
>> is the sorted list of master layers from the layer index [1], would it
>> be possible for those in the know to indicate which layers are, or are
>> suspected of being, unmaintained?
>
> Wouldn't it be easier to do an initial sort based on commit activity ? Versus an
> opt-in query ?

I agree..  see below for mine..

>>
>>
>> meta-aarch64
>> meta-acer
>> meta-ada
>> meta-android
>> meta-angstrom
>> meta-arago-distro
>> meta-arago-extras
>> meta-asus
>> meta-aurora
>> meta-baryon
>> meta-beagleboard
>> meta-beagleboard-extras
>> meta-browser
>> meta-bug
>> meta-buglabs
>> meta-chicken
>> meta-chiefriver
>> meta-clutter
>> meta-crownbay
>> meta-crystalforest
>> meta-cubox
>> meta-darwin
>> meta-eca
>> meta-efikamx
>> meta-efl
>> meta-eldk
>> meta-emenlow
>> meta-erlang
>> meta-ettus
>> meta-filesystems
>> meta-fri2
>> meta-fsl-arm
>> meta-fsl-arm-extra
>> meta-fsl-demos
>> meta-fsl-ppc
>> meta-fso
>> meta-games
>> meta-geeksphone
>> meta-gir
>> meta-gnome
>> meta-gpe
>> meta-gstreamer10
>> meta-guacamayo
>> meta-gumstix
>> meta-gumstix-community
>> meta-gumstix-extras
>> meta-hamradio
>> meta-handheld
>> meta-hipos
>> meta-htc
>> meta-igep
>> meta-initramfs
>> meta-intel
>> meta-ivi
>> meta-jasperforest
>> meta-java
>> meta-kde
>> meta-kernel-dev
>
> maintained.
>
>> meta-kirkwood
>> meta-linaro
>> meta-linaro-toolchain
>> meta-lsi
>> meta-lxcbench
>> meta-measured
>> meta-mentor
>> meta-micro
>> meta-mingw
>> meta-minnow
>> meta-mono
>> meta-multimedia
>> meta-n450
>> meta-netbookpro
>> meta-netmodule
>> meta-networking
>> meta-nokia
>> meta-nslu2
>> meta-nuc
>> meta-oe
>> meta-openmoko
>> meta-openpandora
>> meta-openstack
>> meta-openstack-compute-deploy
>> meta-openstack-controller-deploy
>> meta-openstack-qemu
>
> All openstack layers are maintained.
>
>> meta-opie
>> meta-oracle-java
>> meta-osmocombb
>> meta-ouya
>> meta-palm
>> meta-perl
>> meta-picosam9
>> meta-qt3
>> meta-qt5
>> meta-raspberrypi
>> meta-realtime
>
> mantained
>
>> meta-ro-rootfs
>> meta-romley
>> meta-ros
>> meta-ruby
>> meta-samsung
>> meta-sdr
>> meta-security
>> meta-selinux

maintained

>> meta-shr
>> meta-shr-distro
>> meta-slugos
>> meta-smalltalk
>> meta-sourcery
>> meta-sugarbay
>> meta-sunxi
>> meta-sys940x
>> meta-systemd
>> meta-telephony
>> meta-telldus
>> meta-ti
>> meta-tlk
>> meta-tracing
>> meta-virtualization
>
> maintained
>
> But I can't say if I didn't miss something I maintain in the list,
> since it is long and I scanned
> it quickly.
>
> Bruce
>
>> meta-web-kiosk
>> meta-webos
>> meta-webos-ports
>> meta-webserver
>> meta-woce
>> meta-x10
>> meta-xfce
>> meta-xilinx
>> meta-xilinx-community
>> meta-yassl
>> meta-yocto
>> meta-yocto-bsp
>> meta-zynq
>> meta-zynq-milo
>> openembedded-core
>> toolchain-layer
>>
>>
>> Thank you for your input, and best regards,
>>      Trevor
>>
>>
>>
>>
>> [1] http://layers.openembedded.org/layerindex/branch/master/layers/
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>


