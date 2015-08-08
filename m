Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id D34D9767A3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Aug 2015 17:09:50 +0000 (UTC)
Received: (qmail 26831 invoked by uid 1003); 8 Aug 2015 17:09:49 -0000
Received: from unknown (HELO ?10.0.0.3?) (philip@opensdr.com@188.23.49.214)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	8 Aug 2015 17:09:49 -0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Khem Raj <raj.khem@gmail.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <55C637DB.9010106@balister.org>
Date: Sat, 8 Aug 2015 19:09:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <55C4A405.6050209@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Sat, 08 Aug 2015 17:09:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 08/07/2015 02:26 PM, Alexander Kanavin wrote:
> On 08/07/2015 12:17 PM, Philip Balister wrote:
> 
>> Thanks Khem. I also do not agree that we lack a self-sustaining
>> community. OpenEmbedded has functioned independently for far longer than
>> the Yocto Project has existed.
> 
> By 'self-sustaining' I mean 'being able to continuously produce quality
> work'. Looking at layers in meta-openembedded, not all of them are of
> high quality. Meta-gnome in particular is badly out of date, because no
> one wants to maintain it properly. If oe-core starts taking a lot more
> volunteer contributions, and the same thing happens (a volunteer
> contributes a large set of recipes, then disappears), what is supposed
> to happen then?

You are missing the point. We now use layers to segregate sets of
recipes o stuff that is not interesting to many people and becomes
obsolete may decline without compromising heavily used layers. This is
all part of the evolution of OpenEmbedded over many, many years.

If people lose interest in meta-gplv2, then so be it.

Philip

> 
> 
> Alex
> 

