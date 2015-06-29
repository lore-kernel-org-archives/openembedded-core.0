Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id F06F975C51
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 15:58:27 +0000 (UTC)
Received: by oigb199 with SMTP id b199so121214618oig.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=bgA19XM8Mlzv85yRK4Lho30pM+O+MZN3ARAnSr5qAbg=;
	b=PpritMBrCYDu9PJeBHHaUERLsKpBWOkPKKd1JEF5ub0nODHIw0mrCSYLpIX2E3GD0A
	zvkbQwa2HGmxqTILsfEM9dPSHew3lIG1HP6PwxGSsPqq7lWFiG9vLxM+huq2iZTJELn3
	Npjhe+bcKFzXk0sj7kod/l3BnZxtfEDELXDKCjYC0GsZgffXgjbWZbiO1qfP8kocQa2K
	bAdRh5B/IhMW/ylgXF/g6AiivYfej09tprDRl0c3cLv/HPgqSVorZUx/IxiHLKpyuoDW
	qysoN4Z/hu2B935mj6GvWcXIi0BUXldSnW0OZzdfrY1g78+5D+ZxN3Uw19CGeOd1S+Zn
	ju3A==
MIME-Version: 1.0
X-Received: by 10.182.33.38 with SMTP id o6mr12102122obi.41.1435593508642;
	Mon, 29 Jun 2015 08:58:28 -0700 (PDT)
Received: by 10.182.197.161 with HTTP; Mon, 29 Jun 2015 08:58:28 -0700 (PDT)
In-Reply-To: <CAA=rs97NQABfUn=p1D1vdMn9=+DgRmtnBnN9EVAkMvumC0eXiA@mail.gmail.com>
References: <CAOLEWZUq-ig-fVZgdgd7P15U-jCKaG0FnJM9zYVgPYvxqXDmyw@mail.gmail.com>
	<556E355B.8010604@balister.org>
	<CAEaCVQhNeXoTyLDtXGnKkHyXj9D5yrjwiYV0=K6k_bjsP-BibA@mail.gmail.com>
	<CAOLEWZUhy1csD3WfDr7T5F10wrYvs-+UoucyXps3dYjY=gmHww@mail.gmail.com>
	<CAEaCVQjNRXpA0QB5T0qyA_Wz4_He5XrdM5UTDUA2sc9XN+W0xA@mail.gmail.com>
	<CAA=rs96KA=p1-QXcp+PL1T4UfxL4Rem625+xamB-SuhG0Gs1hg@mail.gmail.com>
	<CAEaCVQgc6WjdakQPL-AG47j64v6u=s8pg14uXLgLHeBN-es21A@mail.gmail.com>
	<CAA=rs97NQABfUn=p1D1vdMn9=+DgRmtnBnN9EVAkMvumC0eXiA@mail.gmail.com>
Date: Mon, 29 Jun 2015 08:58:28 -0700
Message-ID: <CAOLEWZW1QYV18fVGJtWqXhw0BOeReYb2enKnnp1v7sN2nhOGJA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Diego Turcios <diegoturciostc@gmail.com>
Cc: Eduardo Silva <eduardo@monkey.io>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Fwd: open source conference in Honduras needs Yocto Project/Openembedded/OpenHardware speaker
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
X-List-Received-Date: Mon, 29 Jun 2015 15:58:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Then I assume open source and related examples related to open
hardware?  Most of the "open" hardware I've got is still tied to
vendor blobs/forks; several specific machines have good mainline
kernel/u-boot support (with a few patches) but that's about as far as
things go, although some of the video support is in-work currently
(eg, rpi kms-vc4 kernel/mesa support).

Can you give some examples?  If I can make it, I would probably submit
something on using OpenEmbedded with some of the more "open" machines,
eg, RPi, BeagleBone, iMX/6, etc.  I've pledged on a couple of the
newer devices on kickstarter but I won't actually have any for a while
yet...

Steve

On Sat, Jun 13, 2015 at 6:05 PM, Diego Turcios <diegoturciostc@gmail.com> w=
rote:
> Hi Eduardo
> The event is a meeting of central American hackers, developers, open sour=
ce
> activists, students and teachers.
>
> We expect from 70 - 120 people from central america. Plus local people
> (100-200) .
>
> My expectations is to start promoting open hardware in the region. Curren=
tly
> we have a strong feeling on free software and open source, but not on ope=
n
> hardware.
>
> For doing this, we need to start involving more open hardware projects on
> the region, how they work and involved all of this technology in the peop=
le.
>
> Thanks
> Diego
>
> El jun. 10, 2015 12:10 PM, "Eduardo Silva" <eduardo@monkey.io> escribi=C3=
=B3:
>>
>> Hi Diego,
>>
>> I am available on those days. Would you please share more details/stats
>> about the attendees, expectations, others ?
>>
>> thanks
>>
>> On Mon, Jun 8, 2015 at 9:16 AM, Diego Turcios <diegoturciostc@gmail.com>
>> wrote:
>>>
>>> Hi Eduardo
>>> That sounds cool!
>>> The event is the 7 & 8 of August. It takes places on San Pedro Sula. If
>>> your agenda is available we can talk more.
>>>
>>> Please let me know
>>>
>>>
>>> 2015-06-04 21:50 GMT-06:00 Eduardo Silva <eduardo@monkey.io>:
>>>>
>>>> Hi Stephen and Diego,
>>>>
>>>> Our work is basically data collection from a end-to-end point of view
>>>> with Open Source tools that we develop and distribute. It covers embed=
ded
>>>> (openembedded/yocto) and common system applications, the project invol=
ved
>>>> are:
>>>>
>>>> 1. Fluentd / http://fluentd.org : open source data collector
>>>> 2. Fluent Bit / http://fluentbit.io : open source data collector with =
a
>>>> strong focus in Embedded Linux
>>>> 3. Monkey Server / http://monkey-project.com : a scalable web server f=
or
>>>> embedded linux and others.
>>>> 4. Duda I/O / http://duda.io: a web services framework for Linux and
>>>> embedded Linux.
>>>>
>>>> note: all projects are licensed under the Apache v2 License
>>>>
>>>> we have international experience, at the moment (in 1 hour) I will be
>>>> presenting at LinuxCon Japan:
>>>>
>>>>   http://sched.co/2mgz
>>>>
>>>> We can cover the travel costs, If you like the proposal I will only ne=
ed
>>>> to re-check my schedule to validate availability. Please let me know i=
f this
>>>> works.
>>>>
>>>> thanks for your time,
>>>>
>>>>
>>>>
>>>> On Thu, Jun 4, 2015 at 10:27 AM, Stephen Arnold
>>>> <stephen.arnold42@gmail.com> wrote:
>>>>>
>>>>> That works if you have some travel
>>>>> coverage, unfortunately I just
>>>>> heard Diego is in the hospital (no details yet) so there may be a
>>>>> short delay in reply...
>>>>>
>>>>> They are very interested in open source (both hardware and software)
>>>>> so feel free to propose suitable topics (depends on what you've been
>>>>> working on recently I guess).  I was going to do Gentoo embedded but
>>>>> I'm not sure if I can even go yet...
>>>>>
>>>>> Steve
>>>>>
>>>>> On Tue, Jun 2, 2015 at 6:36 PM, Eduardo Silva <eduardo@monkey.io>
>>>>> wrote:
>>>>> > HI Stephen,
>>>>> >
>>>>> > I just read on the OpenEmbedded List that you are looking for
>>>>> > candidates to
>>>>> > talk about Yocto or related technology.
>>>>> >
>>>>> > I work for the Open Source team at Treasure Data and we are a Linux
>>>>> > Foundation member. As I am based in Costa Rica I see a good chance =
to
>>>>> > participate.
>>>>> >
>>>>> > If you are interested let me know so we can discuss more in detail,
>>>>> >
>>>>> > thanks in advance,
>>>>> >
>>>>> >
>>>>> > On Tue, Jun 2, 2015 at 4:59 PM, Philip Balister <philip@balister.or=
g>
>>>>> > wrote:
>>>>> >>
>>>>> >> Speaking opportunity in Honduras.
>>>>> >>
>>>>> >> Contact Steve, not me.
>>>>> >>
>>>>> >> Philip
>>>>> >>
>>>>> >>
>>>>> >> -------- Forwarded Message --------
>>>>> >> Subject: [OE-core] open source conference in Honduras needs Yocto
>>>>> >> Project/Openembedded/OpenHardware speaker
>>>>> >> Date: Tue, 2 Jun 2015 14:45:22 -0700
>>>>> >> From: Stephen Arnold <stephen.arnold42@gmail.com>
>>>>> >> To: Patches and discussions about the oe-core layer
>>>>> >> <openembedded-core@lists.openembedded.org>
>>>>> >>
>>>>> >> There seems to be plenty of room (only 2 or 3 speakers signed up s=
o
>>>>> >> far) and they'd love to have an "official" LF (or just embedded
>>>>> >> linux)
>>>>> >> speaker.  I've been invited to speak, and they can cover the norma=
l
>>>>> >> fees/lodging/food for speakers (just not the travel costs, so I'm
>>>>> >> still working things out with my wife...)
>>>>> >>
>>>>> >> http://ecsl2015.softwarelibre.ca/
>>>>> >>
>>>>> >> I guess I was hoping Linux Foundation (or member companies) had
>>>>> >> enough
>>>>> >> support to maybe send an openembedded developer to speak as an
>>>>> >> outreach sort of thing.
>>>>> >>
>>>>> >> Steve Arnold
>>>>> >> aka nerdboy/mr_science
>>>>> >> --
>>>>> >> _______________________________________________
>>>>> >> Openembedded-core mailing list
>>>>> >> Openembedded-core@lists.openembedded.org
>>>>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>> >>
>>>>> >>
>>>>> >>
>>>>> >>
>>>>> >> --
>>>>> >> _______________________________________________
>>>>> >> Openembedded-devel mailing list
>>>>> >> Openembedded-devel@lists.openembedded.org
>>>>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>> >
>>>>> >
>>>>> >
>>>>> >
>>>>> > --
>>>>> > Eduardo Silva
>>>>> >
>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> Eduardo Silva
>>>> Monkey Software
>>>
>>>
>>>
>>>
>>> --
>>> Diego Turcios
>>> DiegoTc
>>> Ubuntu User  # 27518
>>> ----------------------------------------------------------
>>> ----------------------------------------------------------
>>> Recuerden Dios siempre esta presente
>>
>>
>>
>>
>> --
>> Eduardo Silva
>> Monkey Software

