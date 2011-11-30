Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVteT-00047Z-0S
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:33:21 +0100
Received: by lagj5 with SMTP id j5so489830lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OYJRxc5AaTM4b9cM8QXygONODhgXt1h/iGaz4Bfn/SY=;
	b=dkZZgSQzM2l4ynt1xJ6qGcRFIJpDYYbxAQmKQk3IEP1bMSLHrvmuicPru2gRm3FjPO
	Y5d1c2YPXIJzvI/an2AGiBmL3Lb1uqwWxX8qpAxmsN5Ja5k8QRZNIbZnBWIPNK2+rl9Q
	UAcC8YWa+JgkbYSZNwQ1y7UUY1d8GRz2iOQEk=
Received: by 10.152.104.20 with SMTP id ga20mr2964141lab.13.1322695600278;
	Wed, 30 Nov 2011 15:26:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 30 Nov 2011 15:26:09 -0800 (PST)
In-Reply-To: <4ED6B4EE.6000703@linux.intel.com>
References: <cover.1322689519.git.darren@dvhart.com>
	<e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
	<6e118d2846f5606561b4ae1f3c3ae93fd69bc360.1322689519.git.darren@dvhart.com>
	<CAMKF1sotPRfvMtbMYRBCtqpAj7CfYMzOzh1EORaOtBajzywwkA@mail.gmail.com>
	<4ED6B025.1060705@linux.intel.com>
	<CAMKF1sojotYjyRDVaVu0poUDRpTYMhA_9sX7sNvLQW7n-bL5Uw@mail.gmail.com>
	<4ED6B4EE.6000703@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2011 15:26:09 -0800
Message-ID: <CAMKF1sp6m_9ifGNqVQEzmY+b0G=5FNysqdM1KmsA1oTtti_MWQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] autotools.bbclass: Report the missing configure path
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
X-List-Received-Date: Wed, 30 Nov 2011 23:33:21 -0000
Content-Type: text/plain; charset=UTF-8

> I can see that (although I think can be argued this is correct as well -
> a path with a filename is still a location). I was copying the language
> used elsewhere... but from where is eluding my search at the moment. RP
> has pulled these already I believe, so if the language here truly
> bothers you, we can address it in a follow-on. Personally I don't think
> it's really worth the trouble.

yeah its fine


