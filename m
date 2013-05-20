Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB0660655
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 21:12:59 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id fq12so6829057lab.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 14:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=EP0B8C++t19pWWMEyGbu8djXqCb/pp24f3qBjXIgl4I=;
	b=q66qZyvZoVcQLCdcqssv5DnX7PowOGRydalyUGqclqwquZyvplZvfJQofEEuagUoYB
	ZRxzrNjAIn4k+pQa/nF/KUy4sXMPk+9xqV4YhmXk/2G0k6N1sqrGvl+l74RxjWhvuWTa
	QtJpsQdgfc4zJA4iFDp91EV89IFjytCswM9TYx3vVQu2LBMtY7+2OHAzMkQLPdgfbcz/
	fdQ1qQbowT4C8znmQlb1MTYLS0S+rm2iv8EB1MPveKJut/gFBrbPvwhCpzaYrjZfu+rO
	v/I5om8PPeUSVw4BSa3CrJZo6oEmHAw5g1nz91WsPaRpA9tNKDCIaSpfDBhou6/BOxFj
	ogDg==
MIME-Version: 1.0
X-Received: by 10.152.45.33 with SMTP id j1mr10412779lam.29.1369080315685;
	Mon, 20 May 2013 13:05:15 -0700 (PDT)
Received: by 10.112.162.136 with HTTP; Mon, 20 May 2013 13:05:15 -0700 (PDT)
In-Reply-To: <2007052.kOyn5X0lFt@helios>
References: <cover.1369063930.git.paul.eggleton@linux.intel.com>
	<CAP9ODKpjkaACp937RtWqsP02Ama=HLDSPAG_KDaAMe-8nPi1Ag@mail.gmail.com>
	<1532244.5E4K0xnHso@helios> <2007052.kOyn5X0lFt@helios>
Date: Mon, 20 May 2013 16:05:15 -0400
Message-ID: <CADkTA4MMVZR7hQbr5rdATrYmQtDPAVxLK29cq2SDTECYRWkD_Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dylan][PATCH 00/41] Stable branch cherry-picks (cover letter only)
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
X-List-Received-Date: Mon, 20 May 2013 21:13:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 20, 2013 at 1:02 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 20 May 2013 17:54:21 Paul Eggleton wrote:
>> On Monday 20 May 2013 13:21:29 Otavio Salvador wrote:
>> > On Mon, May 20, 2013 at 12:58 PM, Paul Eggleton <
>> >
>> > paul.eggleton@linux.intel.com> wrote:
>> > > ...
>> > >
>> > > Bruce Ashfield (4):
>> > >   linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes
>> > >   kern-tools: anchor and delimit regexs
>> > >   linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56
>> > >   linux-yocto/3.8: udpate to v3.8.11
>> >
>> > Does this includes the dash kernel-tools fix?
>>
>> I don't think it does. Bruce is that suitable to be pulled into dylan?
>
> Scratch that - it is, I just missed including it.

Holiday here, so a slow response. But looks like you've sorted it out now.

Cheers,

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

