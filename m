Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuZOz-0003r0-T9
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 00:54:49 +0100
Received: by fxm8 with SMTP id 8so5212669fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 15:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CCDSAUiWyyTL475lwdhAqE0t6+OPMU5G3Zt1+Ru7sGo=;
	b=Mn2Y1KnSpkp/C8Ick+H+5U/zSyKmkzFepJBuzpO+7L91AlPzY8fwAGxaOcGSVlVMqL
	RzkCNsIltn58sLEXzinVG28QirpCaQUBEYhLjHdpnMXUEGGi2GZjUjZxXyP2lz1v2vzK
	6hmkP8tMwRlYje0DGeDGMwVKM57bL31Q2xypQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=OgkI6FG4pUQL4yse9axJluLfrdXvsZ16y/9zBGeUlLdF0mSWUzp0wFW34832L/Fqg2
	0C6Dx81XJjFgrcbAU9ypoupSKc+GjHW6lQgs82bcmeeAOw44FcPTwPjukDBwhnKiSlCD
	alhkFRwiCIBCysPdzooRil8efPqgqO3kY9Zg0=
Received: by 10.223.83.134 with SMTP id f6mr8930041fal.1.1299023603126; Tue,
	01 Mar 2011 15:53:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 1 Mar 2011 15:53:03 -0800 (PST)
In-Reply-To: <4D6D531D.5080704@mentor.com>
References: <1298534465-21119-1-git-send-email-koen@dominion.thruhere.net>
	<25E4086B-447B-4010-A1EE-17753B281EA8@dominion.thruhere.net>
	<4D6D531D.5080704@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2011 15:53:03 -0800
Message-ID: <AANLkTinzjOtO0=C1kjGjP_=ha-5GXySf4TbSEo0RQBad@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] remove non-qemu machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2011 23:54:50 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 1, 2011 at 12:12 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/01/2011 12:56 PM, Koen Kooi wrote:
>>
>> This needs some refreshing to apply, but do you agree with the idea?
>
> As this was agreed on by the TSC, yes.
>

I have applied this

-Khem

> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


