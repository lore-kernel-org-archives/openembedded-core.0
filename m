Return-Path: <twoerner@gmail.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id 71367608B7;
	Thu, 31 Jan 2019 16:31:28 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id q3so1577651lfm.2;
	Thu, 31 Jan 2019 08:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=If7KMuZBWNE74Tso88nNWrdTXc/180mqlgtNNCrvA40=;
	b=MjKutm5j5lRyRwdK/6XFfZmsjSvH9qyb9m6hV+xqmi0t5S8vEvMh4L8mh0xS4YNwfI
	kQnMUsanjl/HsipRgUjp1qSHq8sofL2EOYNz/gnSS+UfO3epJg+vbKuKBOxrpM7oB+tG
	UwFaaZ6xoQHPPGN9BHIBMFV7p6dxHxaYzMV7p8J/kATGthRhe6K8r3XOHk62lRmrSGA9
	QojMsc+pWlj1BT2+KZqTaPzjI6u6CV0c4XfRtdquZT10jJRjo3medg4KzFaSjgNyZTxE
	wB1qDh9Z5Ue3K1ePLk+vXoHImNkwHbefGIyt3/J9qapilm/BEwLEzjGmm9WKvEXqLP3M
	d1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=If7KMuZBWNE74Tso88nNWrdTXc/180mqlgtNNCrvA40=;
	b=WZ7zsUKuMaiIOFZGPrG8yjNlaT4NTC1TmSb1aXi567SQy59dpEZsJPt0tLN3O8hNPX
	wuGlOQG+4kPmNqFcK8EodUfWv4Tpzl+g9v5XY5gFZQSwuRQP8iwr5/KNbgAnOGVNuNC3
	d1bwuP31Vutyr4R7CEJewXCR+licZDxvnOGntecGxOcpHU3Fp4fXuOAvrR7FY3iGTuXI
	D6uwFPpfffLaZKjdf5kLEqZyaMNAI3yoTNYnl2Er9kL/AvCAa+rKfJzy1MW7llvzKQ10
	UfPQpj7Wcr6K15a7fokXyrBZEGM+uKO6qSjOWYLI2Q/egp6vFsYU+GWbxGkwW02WySCF
	xPLA==
X-Gm-Message-State: AJcUukf+WlfCCiSHcdty60jbxqF2VxPiyosSR6MDcnsr7nWF33yXf276
	3BJYWCm++3cAYzaiss8n3EAVK3Oa5iUMUZ1Gw8g=
X-Google-Smtp-Source: ALg8bN5xr4ttfojLHWrrrcNsnibWZebVI2qqIWecUW8Q6nZ8qvKn+RVVgLpnBCXb+u+CYpX8+ayQ9LNTyj7jQejUEOw=
X-Received: by 2002:a19:9dd1:: with SMTP id
	g200mr27558099lfe.127.1548952288912; 
	Thu, 31 Jan 2019 08:31:28 -0800 (PST)
MIME-Version: 1.0
References: <CAHUNapTBZZRA4+RiFLVHYX6CAkAC8_s9jA0KrFc8Rvs0ksLG-Q@mail.gmail.com>
	<CAC+thW3KsvrR3X++ywQRQvqjNcs7z7pocq9CBH_s7-jYJXe9bg@mail.gmail.com>
In-Reply-To: <CAC+thW3KsvrR3X++ywQRQvqjNcs7z7pocq9CBH_s7-jYJXe9bg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 31 Jan 2019 11:31:16 -0500
Message-ID: <CAHUNapR7edqX1VyV0hCXegL5hFrAKC_Xa+YZ57iSWQwnrbfSAQ@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-members@lists.openembedded.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OE Summit @ SCaLE 17x - Sunday March 10th 2019 - Pasadena CA
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
X-List-Received-Date: Thu, 31 Jan 2019 16:31:29 -0000
Content-Type: multipart/alternative; boundary="000000000000f46afd0580c38e3e"

--000000000000f46afd0580c38e3e
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 31, 2019 at 5:40 AM Andrea Galbusera <gizero@gmail.com> wrote:

> On Thu, Jan 31, 2019 at 8:26 AM Trevor Woerner <twoerner@gmail.com> wrote:
> > The schedule for the OE Summit has been posted:
> > https://www.socallinuxexpo.org/scale/17x/schedule/sunday
> > https://www.socallinuxexpo.org/scale/17x/open-embedded-summit-0
>
> To whoever can double check and fix the schedule... it looks like
> there's a typo at the second link, where Alistair's talk is listed
> twice. From the first link "Lokesh Kumar Goel
> OpenEmbedded in LG Products" should be at 11.30am instead.
>

Thanks.

There are a bunch of other snafus with the webpages (i.e. the title of
Alistair's talk is actually "RISC-V and OpenEmbedded", and some of the
links to the speakers' bios doesn't seem to work properly). I had notified
the organizers even before I sent out this email, but didn't want to wait
even longer to let everyone know about this event. Hopefully the organizers
can get around to fixing them soon-ish.

--000000000000f46afd0580c38e3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Jan 31, 2019 at 5:40 AM Andrea Galbusera &lt;<a href=3D"mail=
to:gizero@gmail.com">gizero@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Thu, Jan 31, 2019 at 8:26 AM Trevor=
 Woerner &lt;<a href=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoern=
er@gmail.com</a>&gt; wrote:<br>&gt; The schedule for the OE Summit has been=
 posted:<br>
&gt; <a href=3D"https://www.socallinuxexpo.org/scale/17x/schedule/sunday" r=
el=3D"noreferrer" target=3D"_blank">https://www.socallinuxexpo.org/scale/17=
x/schedule/sunday</a><br>
&gt; <a href=3D"https://www.socallinuxexpo.org/scale/17x/open-embedded-summ=
it-0" rel=3D"noreferrer" target=3D"_blank">https://www.socallinuxexpo.org/s=
cale/17x/open-embedded-summit-0</a><br>
<br>
To whoever can double check and fix the schedule... it looks like<br>
there&#39;s a typo at the second link, where Alistair&#39;s talk is listed<=
br>
twice. From the first link &quot;Lokesh Kumar Goel<br>
OpenEmbedded in LG Products&quot; should be at 11.30am instead.<br></blockq=
uote><div><br></div>Thanks.</div><div class=3D"gmail_quote"><br></div><div =
class=3D"gmail_quote">There are a bunch of other snafus with the webpages (=
i.e. the title of Alistair&#39;s talk is actually &quot;RISC-V and OpenEmbe=
dded&quot;, and some of the links to the speakers&#39; bios doesn&#39;t see=
m to work properly). I had notified the organizers even before I sent out t=
his email, but didn&#39;t want to wait even longer to let everyone know abo=
ut this event. Hopefully the organizers can get around to fixing them soon-=
ish.<br></div></div>

--000000000000f46afd0580c38e3e--
