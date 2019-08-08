Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D44E7EE4F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 22:00:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x78M02Lx003567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 15:00:18 -0700
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 14:59:52 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1549591052-12688-1-git-send-email-chandana.kalluri@xilinx.com>
	<3413405.x9v3DxCAyA@localhost.localdomain>
	<BYAPR02MB6005C04842C60A8C3A4DDF26B9710@BYAPR02MB6005.namprd02.prod.outlook.com>
	<BYAPR02MB6005A1297BC34875CB9623C0B9D70@BYAPR02MB6005.namprd02.prod.outlook.com>
	<CANNYZj9BTxaV4_2Tojp16ac5d+suXmaLXWEuCeAGzfFNMe0S2w@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	mQENBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAG0JU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT6JATcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrrkBDQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABiQEfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <da705f5b-0584-f75f-2284-789027dda921@windriver.com>
Date: Thu, 8 Aug 2019 16:59:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9BTxaV4_2Tojp16ac5d+suXmaLXWEuCeAGzfFNMe0S2w@mail.gmail.com>
Subject: Re: [master][PATCH] standard.py: Provide an additional option for devtool reset
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
X-List-Received-Date: Thu, 08 Aug 2019 22:00:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/8/19 3:27 PM, Alexander Kanavin wrote:
> For what it's worth I am firmly in the camp that finds the non-deletion of
> sources annoying. When I run 'devtool reset', there is never any unsaved work
> left in there, but I am in too much of a hurry to do the extra 'rm' on those
> sources, and so much later (sometimes months later) it has to be done just prior
> to starting work on something else entirely (but with the same upstream component).

May make sense to follow git as an example..

devtool reset does what it already does..

devtool reset --hard  also does the removal of the existing source.

But I've seen too many people blow away in progress source code without meaning
to.  Adding something like the --hard option would make it clear it's going to
all go away.

--Mark

> Alex
> 
> 
> On Thu, 8 Aug 2019 at 22:17, Manjukumar Harthikote Matha <MANJUKUM@xilinx.com
> <mailto:MANJUKUM@xilinx.com>> wrote:
> 
>     Hi Paul,
> 
>     > -----Original Message-----
>     > From: openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>
>     > <openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>> On Behalf Of
>     > Manjukumar Harthikote Matha
>     > Sent: Monday, March 4, 2019 3:27 PM
>     > To: Paul Eggleton <paul.eggleton@linux.intel.com
>     <mailto:paul.eggleton@linux.intel.com>>; openembedded-
>     > core@lists.openembedded.org <mailto:core@lists.openembedded.org>; Chandana
>     Kalluri <ckalluri@xilinx.com <mailto:ckalluri@xilinx.com>>
>     > Subject: Re: [OE-core] [OE-Core][master][PATCH] standard.py: Provide an
>     > additional option for devtool reset
>     >
>     > Hi Paul,
>     >
>     > > -----Original Message-----
>     > > From: openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>
>     > > [mailto:openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>] On Behalf Of
>     > > Paul Eggleton
>     > > Sent: Monday, March 04, 2019 12:17 PM
>     > > To: openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>; Chandana Kalluri
>     > > <ckalluri@xilinx.com <mailto:ckalluri@xilinx.com>>
>     > > Subject: Re: [OE-core] [OE-Core][master][PATCH] standard.py: Provide
>     > > an additional option for devtool reset
>     > >
>     > > On Friday, 8 February 2019 2:57:32 PM NZDT Sai Hari Chandana Kalluri wrote:
>     > > > The devtool reset command cleans the sysroot for a recipe in workspace.
>     > > > It also removes the append file but leaves the source code as in
>     > > > workspace. The source is not cleaned intentionally and the user has
>     > > > to manually remove it before calling devtool modify again.
>     > > >
>     > > > Provide the user with an option to remove the source code from
>     > > > workspace by adding a flag to the devtool reset command. The
>     > > > --rm-source option for the devtool reset command will also clean the
>     > > > source code from the workspace along with the sysroot and the append file.
>     > > > Ex: devtool reset --rm-source zip or devtool reset -r zip
>     > >
>     > > When I wrote this I made a conscious decision not to delete the
>     > > source, in case the user has unsaved work in the source tree; at least
>     > > then the user has to take an explicit step (an additional rm -rf) in
>     > > order to delete it. You might argue that adding an option is the same
>     > > as that explicit step, but I am still hesitant as you might for
>     > > example pick a previously used command from your command history with
>     > > -r in it and only realise after you've run it that you've just blown
>     away a bunch
>     > of your work.
>     > >
>     > > However, I have received the feedback from a number of people that
>     > > they find it annoying that they have to delete the source themselves
>     > > before being able to run devtool on the recipe again. I'd like to hear
>     > > from the wider community on the following two questions:
>     > >
>     > > 1) Does the convenience of having this kind of option outweigh the
>     > > potential danger of deleting unsaved work?
>     > >
>     > > 2) Are there issues that anyone is experiencing that force you to run
>     > > devtool clean/finish and then re-run devtool modify (or add, or
>     > > upgrade), making this kind of situation come up more frequently? Or is
>     > > it mostly that the source directories end up being left around to
>     stumble over
>     > some time later?
>     >
>     > We have seen source directories end up being left around (taking more disk
>     > space on certain projects), hence a solution to remove it might be
>     optimal. If the
>     > preference is not have "-r" option to avoid command history mistake, then
>     a full
>     > command like devtool reset --rm-source is acceptable as well
>     >
> 
> 
>     Any update on this?  Is there a reason not to merge this feature?
> 
>     Thanks,
>     Manju
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 


