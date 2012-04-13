Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SIbaX-000321-WC
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 10:10:38 +0200
Received: by wera1 with SMTP id a1so1779937wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 01:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=kBMeaB9zuvVowyc4jyvWibOnCYvmqJhg1MIGIvRSAVQ=;
	b=XVTe1Yr1JULHsAoAlnq795pxCTNRl1vhiWA+6pH6/uxyvtu0dZEnGfDDWUykEJ795P
	w6FxUx905agu/DNmwKzIGgTYWkNi06gxWpeJwmj7QNGaAa1tYFkr/T4A4MFustaP+Otu
	tb1eYKzpl8ju8rtZGscSSL6/9AX103sSBRoWhYyN/ORcLaGDxsBgJRIAcKVbxOZfxSaj
	Is02S48NGmbaA5tBir4Ku14KY8bWzlgJaSK+wAqBRN5YzQ3Y/aOBWVD3YCIwfa0zNu2l
	nFeWkfWLTCb1t11QiAQUAdhCNdYxUSgVQ2CeVm/oBktboUMnC3BSf8bU38Uw6SE5cEhk
	qXBQ==
MIME-Version: 1.0
Received: by 10.180.104.230 with SMTP id gh6mr1340602wib.22.1334302394307;
	Fri, 13 Apr 2012 00:33:14 -0700 (PDT)
Received: by 10.227.128.9 with HTTP; Fri, 13 Apr 2012 00:33:13 -0700 (PDT)
X-Originating-IP: [93.114.75.57]
Received: by 10.227.128.9 with HTTP; Fri, 13 Apr 2012 00:33:13 -0700 (PDT)
In-Reply-To: <1334266176.3382.75.camel@x121e.pbcl.net>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
	<D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>
	<CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
	<1334256020.7309.45.camel@ted> <4F873102.6020603@balister.org>
	<DE32AA93-7E17-480C-9027-DB6EA6F2A0C0@dominion.thruhere.net>
	<20120412211330.GG13291@denix.org>
	<1334266176.3382.75.camel@x121e.pbcl.net>
Date: Fri, 13 Apr 2012 10:33:13 +0300
Message-ID: <CAK18fxEisGiiT-Bcjikv36WZpRmOobSNtDz9su=9vmJGXj1YNA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmWPlQu54XRFzZp6DArWn3JoNcw84Sfm4wEgh1HkjZ5EUgWYg/ONlW1x6R+YGyN4+y//BXz
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Fri, 13 Apr 2012 08:10:38 -0000
Content-Type: multipart/alternative; boundary=f46d04428dca3c538604bd8a7cd1

--f46d04428dca3c538604bd8a7cd1
Content-Type: text/plain; charset=ISO-8859-1

On Apr 13, 2012 12:30 AM, "Phil Blundell" <philb@gnu.org> wrote:
>
> On Thu, 2012-04-12 at 17:13 -0400, Denys Dmytriyenko wrote:
> > Should we put it to vote? While we still have time before the release,
we need
> > to agree on the naming eventually.
>
> To be honest, it seems to me like a vote would be a waste of time.  It's
> only a name, after all.  This is Richard's project and I think he should
> probably just pick a tag name that he likes and be done with it.
>

One vote for this!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--f46d04428dca3c538604bd8a7cd1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Apr 13, 2012 12:30 AM, &quot;Phil Blundell&quot; &lt;<a href=3D"mailto:p=
hilb@gnu.org">philb@gnu.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 2012-04-12 at 17:13 -0400, Denys Dmytriyenko wrote:<br>
&gt; &gt; Should we put it to vote? While we still have time before the rel=
ease, we need<br>
&gt; &gt; to agree on the naming eventually.<br>
&gt;<br>
&gt; To be honest, it seems to me like a vote would be a waste of time. =A0=
It&#39;s<br>
&gt; only a name, after all. =A0This is Richard&#39;s project and I think h=
e should<br>
&gt; probably just pick a tag name that he likes and be done with it.<br>
&gt;</p>
<p>One vote for this! </p>
<p>&gt; p.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>
</p>

--f46d04428dca3c538604bd8a7cd1--
