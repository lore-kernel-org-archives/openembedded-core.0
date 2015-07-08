Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8433D74248
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 13:53:04 +0000 (UTC)
Received: by igrv9 with SMTP id v9so200273000igr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TVfk0LeJHaaQpQ6YaDUhrPEBwc+9gPJxx8eSrEvlHqs=;
	b=yrmccDe7zcgcD1hjYZk597HsgzHQDqT2IK+7WWVIHPmkWrGI7Spi56QWc/gPMngO77
	P1H34Z842hbh1RSFlNBGl4LpfRp7LmQvBlxBoJvY2LL1m/MVt/isBm3sv9FLrcQsltx0
	zukJRI3SvzRE2VFmyWxD956d9Ihs2xzyl5JR8uqHmeRQm7TRV2XixUe7n5rjPA/+4PcY
	1qYa/U/noEsuhDTHpIoSv3fS0h+3lRqwF3xTdVZoZubgym4czk0nPWZl1cEmZ2rbJnVb
	HMREgxDhndE7MMjGO328SbYTHO0IxWbLHeUmR47GVrcPnl2bUa4JSlV+2t8x0rPsr6lb
	lamw==
MIME-Version: 1.0
X-Received: by 10.50.141.164 with SMTP id rp4mr89419910igb.2.1436363585090;
	Wed, 08 Jul 2015 06:53:05 -0700 (PDT)
Received: by 10.107.141.78 with HTTP; Wed, 8 Jul 2015 06:53:04 -0700 (PDT)
Received: by 10.107.141.78 with HTTP; Wed, 8 Jul 2015 06:53:04 -0700 (PDT)
In-Reply-To: <CAJTo0LZBZ8rWUZF3MfUkm9MkZdaZwhDo4c+2ay1Peb_A05iGGw@mail.gmail.com>
References: <1436304174-24460-1-git-send-email-ashcharles@gmail.com>
	<CAJTo0LZBZ8rWUZF3MfUkm9MkZdaZwhDo4c+2ay1Peb_A05iGGw@mail.gmail.com>
Date: Wed, 8 Jul 2015 06:53:04 -0700
Message-ID: <CAK8F28m62nkjQVGaF8bVYiuKoRknNeNdKxS7rSB8YK=X2-1W=g@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-io: Add runtime dependency on contextlib
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
X-List-Received-Date: Wed, 08 Jul 2015 13:53:08 -0000
Content-Type: multipart/alternative; boundary=089e0129538041fc0a051a5d7544

--089e0129538041fc0a051a5d7544
Content-Type: text/plain; charset=UTF-8

On Jul 8, 2015 4:20 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 7 July 2015 at 22:22, Ash Charles <ashcharles@gmail.com> wrote:
>>
>> This applied to Python 2.7.9 but not 3.3.
>
>
> Do you mean this isn't applicable to python 3.3 or you haven't checked
with 3.3?
It is not applicable to 3.3.

Ash

--089e0129538041fc0a051a5d7544
Content-Type: text/html; charset=UTF-8

<p><br>
On Jul 8, 2015 4:20 AM, &quot;Burton, Ross&quot; &lt;<a href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 7 July 2015 at 22:22, Ash Charles &lt;<a href="mailto:ashcharles@gmail.com">ashcharles@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This applied to Python 2.7.9 but not 3.3.<br>
&gt;<br>
&gt;<br>
&gt; Do you mean this isn&#39;t applicable to python 3.3 or you haven&#39;t checked with 3.3?<br>
It is not applicable to 3.3.</p>
<p>Ash</p>

--089e0129538041fc0a051a5d7544--
