Return-Path: <prvs=04536f8613=mike.looijmans@topicproducts.com>
Received: from mx42-out4.antispamcloud.com (mx42-out4.antispamcloud.com
	[138.201.61.180])
	by mail.openembedded.org (Postfix) with ESMTP id 72E9477C31
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Oct 2017 09:15:27 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx42.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1e0lCf-0003S4-SJ; Sat, 07 Oct 2017 11:15:26 +0200
Received: from [192.168.1.17] (85.150.144.104) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Sat, 7 Oct 2017 11:15:23 +0200
To: Andre McCurdy <armccurdy@gmail.com>, Leonardo Sandoval
	<leonardo.sandoval.gonzalez@linux.intel.com>
References: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
	<20171005101918.282f15658ac2a600e3c4c251@linux.intel.com>
	<20171005164447.48dc7a86bd86519f67a3a41a@linux.intel.com>
	<CAJ86T=WdwVG5sqj70FZ-AEw7+CYu0dNvqqXBCxwp2jPP_bogcQ@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <f5a0f8aa-b2f4-7d3d-eb17-1206ee7d41f2@topic.nl>
Date: Sat, 7 Oct 2017 11:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WdwVG5sqj70FZ-AEw7+CYu0dNvqqXBCxwp2jPP_bogcQ@mail.gmail.com>
X-Originating-IP: [85.150.144.104]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.07)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5vowmECMiq/4JnAN/bmPlWbj1g3/PwYZaTCzSym8uE9HHLStVW7iHrxG
	SGdMbTuKxOGLXQDqhEd18VQjy7vXNEkEG5MLDuoooi9XIdhffT/c5t5kI8bj/+C8FfdyMi00+ual
	qIMc+aGxKBgFSUBu+Z1yAcBOUUaSDIlw73N6aFOq2O7exZs3WniBPxy5Jg8b6Wmtl09apMCg+hOC
	XfQjPFuWJBGK2n5zTKAcbNEplBODiX3B3wJ270/ucObjAI0W+hLZMhzkpYgnXUKzdOwkyNOLTZro
	hEYNqXHUJBt/zvJoTGAA1gLIPnzkgagc0cD3Qr55uEarDRQL7qLu2RUTIErKiQF97MDlWzng5zYL
	9n0H2pBQuvYxaKaSltgGMsRMCd8EV8HUERMpYa4seQ+ZSwen0oaFOaP/hpsrOHl4Aqy0FdlTez4E
	p6JVGftOsEfid75H5C/X4ju7C24pupFtnyB64Bn/xFW1Emq7hJ1ivG4zukmd9wS3TgOUAKXMmP2N
	lmHDuyYrGIFIj12us0/wEETNcgXXMYaGQeGKWD2ycTNwgjRzIF2aw7lrAkSGFzmzB9t1hZn/H5iq
	95o9mggIqa9zHDeqqFz43py4SDhdaHkWhhtV5JeaQLbEqlRdwnhcsh+LrVPfyiw4jXCWfHO/nErq
	HUx/wo0nG1y20s5lTkE9hJKO0HXjIOPGlWOKWte4nKjjs+yFELaYcViFGzPpcnGQnK1Eemanbhyv
	hRUH9mQs5OwVDz9YWiSIE6UlBHmyBNHWaeo31xlxAKeT3BrGQ4c1ocmVvOcmlSojJE0CfxBH9lcy
	xn1b8er9UeWkyQkvAU4I+Ejjz/JrjvMThG5CO0SH6640lW0V/uWsFpzOWyoD9R/2gMGq0KWAzmMf
	+ibVDlca0Oe+GLTU85C76niv74nFzIypV5FmMyQg7HiIwlVmxgQ5WhUTstUhLxc+FWbKglss+n2f
	fnQxt6aJ7klZab/PEOv01feB/X5C0TO9q4jiZAZIRR+VyigHaVBuCYGeaxrdrXiV0ngIHMGxAZUL
	6ME=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Recipe versions and layer confusion
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
X-List-Received-Date: Sat, 07 Oct 2017 09:15:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 06-10-17 00:10, Andre McCurdy wrote:
> On Thu, Oct 5, 2017 at 2:44 PM, Leonardo Sandoval
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>> On Thu, 5 Oct 2017 10:19:18 -0500
>> Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>>
>>> On Thu, 5 Oct 2017 16:49:28 +0200
>>> Mike Looijmans <mike.looijmans@topic.nl> wrote:
>>>
>>>> =EF=BB=BFI'm confused.
>>>>
>>>> Layer "meta-xilinx" defines:
>>>>
>>>> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.1.bb
>>>>
>>>> This recipe is too old for my liking, so I made a newer one in "meta-t=
opic"
>>>>
>>>> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.3.bb
>>>>
>>>>
>>>> Much to my surprise, when I build, OE picks the 2017.1 version and not=
 the
>>>> 2017.3 version.
>>>>
>>>> bitbake-layers show-layers reveils:
>>>> ..
>>>> meta-xilinx           /home/mike/projects/zynq-platform/meta-xilinx  5
>>>> meta-topic            /home/mike/projects/zynq-platform/meta-topic  6
>>>> ..
>>>>
>>>> so that means that my meta-topic should win even if my PV were lower, =
right?
>=20
> Yes. The comments in bitbake/lib/bb/providers.py -> findBestProvider()
> explain the process pretty well:
>=20
>    If there is a PREFERRED_VERSION, find the highest-priority bbfile
>    providing that version.  If not, find the latest version provided by
>    an bbfile in the highest-priority set.
>=20
> The only caveat is that if PREFERRED_VERSION contains a wildcard (%)
> and matches more than one available version then all bets are off and
> results may be unpredictable. It's up to the user to ensure that
> doesn't happen.
>=20
> Note that looking at the meta-xilinx recipe it seems that PV is set
> manually and doesn't follow the recipe name, so depending on how you
> set PV in your new recipe, it may not be completely obvious which
> recipe is actually being used?
>=20
>    https://github.com/Xilinx/meta-xilinx/blob/master/recipes-bsp/arm-trus=
ted-firmware/arm-trusted-firmware_2017.1.bb
>=20

Yeah, that turned out to be the problem. The recipe is versioned as=20
"2017.1" but that is not the version it will actually build.

"bitbake-layers show-recipes arm-trusted-firmware" reveiled the true=20
versions, as Paul suggested, and that explained the strange choices.

--=20
Mike Looijmans


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail


Visit us at the Space Tech Expo Europe (Stand E-71)

