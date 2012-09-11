Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBXqs-0002au-O6
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 23:18:34 +0200
Received: by eaad12 with SMTP id d12so452722eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rxk8yH+ybc/9Wi0TAd1ucd2iuwSnWWihy5sbhFDKd7M=;
	b=ol577jR107h0GyUdcsYM/z7XoVRUEwkAvLpnGrnCv6MbrWgnRrqXCBXYjIWEAeTKLf
	iHnCPKxGtlV4k3sYEPrMa+Eu7tUaEKFP+oaFdM+33AU38uwHQJ90DP2ZYbDU7A4nqC8w
	A0TbDa+nbTV8iCVRdudZGaOkOu7569ArOfXC2hP8my1+hBFYSKqw1oTporf80eBYUYI9
	lRvIoH0flnqs+fcGC16g5OzG/KbwxVIY9cJSoSR4Kj7eq+mBAWLXDKVc084Dc/SIPD3l
	rVFrgm8pD9o3sxW33d5jrXPyTuwuFmktlckHvqJXiumlKk9/kByGfA8yH+c/Q5xYoGNz
	fdtg==
Received: by 10.14.204.72 with SMTP id g48mr27932021eeo.45.1347397563743; Tue,
	11 Sep 2012 14:06:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 11 Sep 2012 14:05:31 -0700 (PDT)
In-Reply-To: <1347397258.2122.55.camel@ted>
References: <504F8D62.8010508@intel.com>
	<CAJTo0LYf2C0PmrpMf3-RsUub1pQmN=G3f6Tt8ou6UNJ-8NoJKA@mail.gmail.com>
	<504F8EB5.30503@intel.com>
	<CAJTo0LbTe4462EVa6u30FrYHh96oUXnksKkpWy8hVFbM=dz_9A@mail.gmail.com>
	<504F92B2.6000304@intel.com> <1347397258.2122.55.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Sep 2012 14:05:31 -0700
Message-ID: <CAMKF1spfvPUJR4Cix_50eL8=UFyNoBNjjc7jYT08CYhiww00eQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: the oe-core layer <openembedded-core@lists.openembedded.org>,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: Sato virtual keyboard - how to close it?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 21:18:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 11, 2012 at 2:00 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3093
>
> There has been a bug open for this for years :(
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=149
>
> Ross appears to have recently closed it as NOTABUG but I think he
> misunderstood the problem.

I have had this problem with sato for a long time that explains it.


