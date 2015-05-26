Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-out5.antispamcloud.com (mx12-out5.antispamcloud.com
	[46.165.232.175])
	by mail.openembedded.org (Postfix) with ESMTP id CB10765C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 09:03:17 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1YxAlW-0003cB-3A; Tue, 26 May 2015 11:03:15 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 26 May 2015 11:03:42 +0200
Message-ID: <556436D1.80906@topic.nl>
Date: Tue, 26 May 2015 11:03:13 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Andrea Adami <andrea.adami@gmail.com>
References: <55641868.1080406@topic.nl>	<CADkTA4NaTjRoydVSh63HB6QgvSnQis-z9RnaYZkT3Ng1cm1bWg@mail.gmail.com>	<55641D0C.5020408@topic.nl>	<55642019.3060305@topic.nl>	<55642B75.8050909@topic.nl>	<55642EFB.4070102@topic.nl>
	<CAAQYJAvzu1Jb76SgenWQPhs=9N_+aqqUece_hBhs-8_6nMbojg@mail.gmail.com>
In-Reply-To: <CAAQYJAvzu1Jb76SgenWQPhs=9N_+aqqUece_hBhs-8_6nMbojg@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw7KFnrUIdBhDr8cJqM7tGtosoGWsXIApbRqw/kZyRPH2zP/Nvy3REQvQ7/e6GGVMwjIG
	8v62mVM/KGZMxMFQ4hq799hHiJ5+/iMGxnVXF4Y9zbyjdpA52k0mu6wQ1hZXSfwas68cKC1XxN25
	3Nod4pF79aClCqb6XVXJwTEBzqD4cEshF4K/J1vQuDHCMrNlOroDbspWbC3r8uYmv2v/uWh3KLwb
	XHjHpxz8VOWtxaqRtGatS10rt65RhnWUgSkt1z0MG55XttaVB51zVtVpvemRVYKU9W9tbmVXJBqd
	HHDmCR+rAuaApP/L/ZmdZ2LPvUDgnu2qMIGJ4Jj3JtMuLMlf9h2GUykPq+ybfA9OCf2DiwQzKw+6
	v3CaIMG6s7LqJB8Vo/BaIgk6tCfqp9SGiaDWXnpbNyOL7KrZtXVwp2ixvaINbN+ZsNRPuRsdxXk7
	pfc1dLtKntiauI+EEFmk8XN6UYABPEJmokgMViEN6xeVtg/xmtX2XalNZC7O1JjQm1smbV3HV2Md
	crlHcZFhmWJhXHR7yD3iG0DkQzppNCn5fOdU2kQFJEzfkq4ITozmM1xxb52Ta22MKkYKziEOS1yO
	rsjsH1CJK77F2UVfFZRElF1QKZZXa/VA+oYr77g/aEN6fEUaZQVKuuKdFU3bHnIknh+RT3I4GGQ9
	krCL1VHvMS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJZ49yz1MT0kfUl6zGjl7omzJUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00434030336524)
X-Recommended-Action: accept
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: "bitbake -c menuconfig virtual/kernel" fails on ncurses dependency
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
X-List-Received-Date: Tue, 26 May 2015 09:03:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 26-05-15 10:40, Andrea Adami wrote:
> On Tue, May 26, 2015 at 10:29 AM, Mike Looijmans
> <mike.looijmans@topic.nl> wrote:
>> On 26-05-15 10:14, Mike Looijmans wrote:
>>>
>>> On 26-05-15 09:26, Mike Looijmans wrote:
>>>>
>>>> On 26-05-15 09:13, Mike Looijmans wrote:
>>>>>
>>>>> On 26-05-15 09:02, Bruce Ashfield wrote:
>>>>>>
>>>>>> On Tue, May 26, 2015 at 2:53 AM, Mike Looijmans
>>>>>> <mike.looijmans@topic.nl>
>>>>>> wrote:
>>>>>>>
>>>>>>> I get this when running
>>>>>>> bitbake -c menuconfig virtual/kernel
>>>>>>>
>>>>>>> scripts/kconfig/mconf.o: In function `show_help':
>>>>>>> mconf.c:(.text+0x884): undefined reference to `stdscr'
>>>>>>> scripts/kconfig/lxdialog/checklist.o: In function `print_arrows':
>>>>>>> checklist.c:(.text+0x2c): undefined reference to `wmove'
>>>>>>> checklist.c:(.text+0x4c): undefined reference to `acs_map'
>>>>>>> checklist.c:(.text+0x54): undefined reference to `waddch'
>>>>>>> checklist.c:(.text+0x66): undefined reference to `waddnstr'
>>>>>>> checklist.c:(.text+0x76): undefined reference to `wmove'
>>>>>>
>>>>>>
>>>>>> This has popped up on and off for several years now, and we have a f=
ew
>>>>>> bugzilla
>>>>>> entries that track it. The fix is never as simple as we would like.
>>>>>>
>>>>>> The most recent version is here:
>>>>>>
>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7609
>>>>>>
>>>>>> If you have more details about your enviroment, adding them to that =
bug
>>>>>> would
>>>>>> be idea.
>>>>>>
>>>>>> The problem with using the -native version, or the host, is that at
>>>>>> times
>>>>>> menu
>>>>>> config is rendered unusable. The fix isn't only in the dependencies,
>>>>>> but in
>>>>>> the
>>>>>> way that menuconfig is build within the kernel environment.
>>>>>>
>>>>>> This older bug tracks the details of that:
>>>>>>
>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3898
>>>>>
>>>>>
>>>>> I have an Ubuntu 14 system. The weird thing is, that I have several
>>>>> almost
>>>>> identical machines, and some of them fail and some don't.
>>>>>
>>>>> This one works fine:
>>>>> MACHINE=3Dtopic-miami-florida-med-xc7z030
>>>>>
>>>>> This one fails:
>>>>> MACHINE=3Dtopic-miami-florida-gen-xc7z030
>>>>>
>>>>> They all use the same kernel recipe, version, git tag, etc. These two
>>>>> even
>>>>> share the very same defconfig. Their builds run within the same OE
>>>>> environment, so the native sysroot for both is the same too!
>>>>
>>>>
>>>> I output "bitbake -c menuconfig virtual/kernel -e" for both machines i=
nto
>>>> two
>>>> files, then did a find/replace "med" with "gen", and then looked the t=
he
>>>> differences with meld. Both machines use the same environments all ove=
r,
>>>> only
>>>> differences are time stamps and task checksums.
>>>>
>>>> Next I'm gonna try the old "remove tmp" trick.
>>>
> I was there, it will fail (Ubuntu 14.04 fwiw).
>
>>>
>>> Removing tmp did not help either. Forcibly rebuilding ncurses-native al=
so
>>> did
>>> not help.
>
> Yes, as strange as it is, you need to bitbake ncurses.

Wow, indeed, "bitbake ncurses -c populate_sysroot -f" made the menuconfig w=
ork=20
again.

Looks like ncurses "fixes" something that ncurses-native broke.


>>> I'm now trying a complete clean start with current master branches...
>>
>>
>> Okay, that made things consistent again. Now all machines fail.
>>
>
> This little bug is very nasty and I've always postponed a deeper
> analysis because of other evil issues with the linux kernel taking all
> my little time :).

Ah well, never a boring day :)



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






