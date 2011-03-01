Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuZPS-0003r0-50
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 00:55:18 +0100
Received: by mail-fx0-f47.google.com with SMTP id 8so5212669fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 15:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=N29fmgA1Xg90hackj83eaMlBinTLp/P10DoysVGw0xA=;
	b=sjAiX+0/aeQo2syth1C3BRAKzjzlrrVqY1BwHq0JIW7wcrBvygtZTuhlEkaC3oGszi
	FndcpIbc8RaR4O7hXYK2fd+GCOPcAPxlAUaNQyZ+TA4HidQtzyJkVx3U5WTzPk1xNOHa
	M1gMFvIOYqd914zbJ0ZqyHbqdJIJMcMnZ9/Ag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=VpyhfUjy4dMA11ZYwu6t54ioH42dJ9TFLpZIE2KoQhXzev7VsewSRg78MriNTXR8B7
	JHyJpF0k+1JxnBSuch4yBE0j1lqRZdpyJffzx6BDWx27iGteCx7WLLxKoNp6/2SAAi5G
	mGgvSWnmerKrGf4v+MfCWX23Jd9oBXpaAJoe4=
Received: by 10.223.96.195 with SMTP id i3mr2809806fan.77.1299023633970; Tue,
	01 Mar 2011 15:53:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 1 Mar 2011 15:53:33 -0800 (PST)
In-Reply-To: <A632FFDE-18DE-439E-B247-80DE29746320@dominion.thruhere.net>
References: <1298920867-4961-1-git-send-email-koen@dominion.thruhere.net>
	<A632FFDE-18DE-439E-B247-80DE29746320@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2011 15:53:33 -0800
Message-ID: <AANLkTikpew7WfqY_0nf7h_Mkf+=S0KWFAdFdHO5KPkeB@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Tue, 01 Mar 2011 23:55:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 1, 2011 at 11:55 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> ping
>

I have applied this sorry for delay

-Khem


