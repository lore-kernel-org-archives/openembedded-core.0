Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 77CDF600AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 01:23:29 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id u14so2906593lbd.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 17:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=QIgdW7Ge/QkowJfUnrhRKEJo5WT1FILAKCM2iA8wNuo=;
	b=cC132AubqVNUZiW9APToQkcMgQSIVRDUq9TyX+ldGaOe5sTjaTNN/gwwXoagBULPTB
	WR9KMSx2GrEQ7KDykh+PsbdleR3cneoDjG/+yBjMAqm35MWj8muVKD6EtRHNBCOGyE0Z
	N6lic1LqZpe1Wv6/OHtYrgmwKKx8h3rs764PXEX3akS+NHrItDab0BtyPqpp8VjzJO4k
	4T9eDq3bmIMO6XCVcxOK0GqMJ55KKHeZrLnmtE0lggxJSS7JgQxP5pHkPRQix2LI7oAj
	hZkGaB9mmFMKK7RTcVW3Xdu58rPhkHAmY69F4IVTmY/lWfHb2fkhHqBLxsxCR8df9eMI
	KC8g==
X-Received: by 10.112.139.72 with SMTP id qw8mr2512543lbb.16.1389317009799;
	Thu, 09 Jan 2014 17:23:29 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.22.167 with HTTP; Thu, 9 Jan 2014 17:23:09 -0800 (PST)
In-Reply-To: <20140109233510.GO3709@jama>
References: <52CEEE43.1090209@linaro.org>
	<CADkTA4M+KG9uXtb91ANThgzMgOAb0WjiVmBvf48UszmSnX62dA@mail.gmail.com>
	<20140109233510.GO3709@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 9 Jan 2014 18:23:09 -0700
X-Google-Sender-Auth: PSp5QBRlAqLdkJH24Aj0x4sRHAU
Message-ID: <CABcZAN=NSNoGf1GJLBeG++LrJo3G2SUbyJ7ks=WG6O+=5PmX=A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: unmaintained layers
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
X-List-Received-Date: Fri, 10 Jan 2014 01:23:30 -0000
Content-Type: multipart/alternative; boundary=089e0112c1bad9807904ef9392b0

--089e0112c1bad9807904ef9392b0
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 9, 2014 at 4:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Thu, Jan 09, 2014 at 04:45:38PM -0500, Bruce Ashfield wrote:
> > On Thu, Jan 9, 2014 at 1:45 PM, Trevor Woerner
> > <trevor.woerner@linaro.org> wrote:
> > > Hi everyone,
> > >
> > > At the last TSC meeting the topic of unmaintained layers came up. Here
> > > is the sorted list of master layers from the layer index [1], would it
> > > be possible for those in the know to indicate which layers are, or are
> > > suspected of being, unmaintained?
> >
> > Wouldn't it be easier to do an initial sort based on commit activity ?
> Versus an
> > opt-in query ?
>

In case we're sticking to opt-in rather than opt-out, meta-mentor,
meta-sourcery, meta-ro-rootfs, and meta-tracing are maintained by Mentor
Graphics at this time. :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0112c1bad9807904ef9392b0
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><div class="gmail_quote">On Thu, Jan 9, 2014 at 4:35 PM, Martin Jansa <span dir="ltr">&lt;<a href="mailto:martin.jansa@gmail.com" target="_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="im">On Thu, Jan 09, 2014 at 04:45:38PM -0500, Bruce Ashfield wrote:<br>
&gt; On Thu, Jan 9, 2014 at 1:45 PM, Trevor Woerner<br>
&gt; &lt;<a href="mailto:trevor.woerner@linaro.org">trevor.woerner@linaro.org</a>&gt; wrote:<br>
&gt; &gt; Hi everyone,<br>
&gt; &gt;<br>
&gt; &gt; At the last TSC meeting the topic of unmaintained layers came up. Here<br>
&gt; &gt; is the sorted list of master layers from the layer index [1], would it<br>
&gt; &gt; be possible for those in the know to indicate which layers are, or are<br>
&gt; &gt; suspected of being, unmaintained?<br>
&gt;<br>
&gt; Wouldn&#39;t it be easier to do an initial sort based on commit activity ? Versus an<br>
&gt; opt-in query ?<br></div></blockquote><div><br></div><div>In case we&#39;re sticking to opt-in rather than opt-out, meta-mentor, meta-sourcery, meta-ro-rootfs, and meta-tracing are maintained by Mentor Graphics at this time. :)</div>

</div>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e0112c1bad9807904ef9392b0--
