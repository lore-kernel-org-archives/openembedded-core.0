Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpnhG-00033h-8k
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 23:46:46 +0200
Received: by obcva7 with SMTP id va7so4996835obc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 14:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=VJDKtxsc1Vgx+flMsvUc7BvRLEU1j20cgcNudb57CeM=;
	b=cuPC4InayiTipkJI1MLdxPIwYR4hY4J7d6DhKn2f1QKo2qRCS6p502Et2awt3Rnlf5
	5IoZU/RigBkPFiHvXcuuipYn3RuXX/Cqh4lrC/dSegP4gt9PGLHH09iY4h+3s2F6v+c6
	1qipDaj0cricc8cASYQ3Y3Yua7FkYx4VzWWNfgfIXAk/9gAIjLAYjEBHXYxqCVpB6i7k
	3rn5iHkXbPO2tVEhTUPPV0bziu4Fwb99Dw8/u8hGGy2oIoCLy0vPGpEW2GUBCzV2/nvA
	FcBh13HV6Jz0rXjSLBziCKnrumMhureIwycLuRMGsiJzJx1GBB92czJimGZ0PZWdQb/y
	XEjw==
Received: by 10.182.17.36 with SMTP id l4mr3722858obd.59.1342215329752; Fri,
	13 Jul 2012 14:35:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.81.37 with HTTP; Fri, 13 Jul 2012 14:35:09 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <30507362.5flLOTLR4H@helios>
References: <CAK18fxFBi0=eFEPPrr=O0FXNnivTSUvPe04pnqxpOKDSvT2ehw@mail.gmail.com>
	<30507362.5flLOTLR4H@helios>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sat, 14 Jul 2012 00:35:09 +0300
Message-ID: <CAK18fxHURg0pSngghV9OO-V6OFa3UwK8XH1RJHA56z8-W=QuFA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnPv8KJYfs2eTp5JL6i8OeEK3IdU2PXxla7rsif0BLiRfciiKOhmpakW3DwciJUi5SFCJnm
Cc: openembedded-core@lists.openembedded.org
Subject: Re: http://xorg.freedesktop.org/ down
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
X-List-Received-Date: Fri, 13 Jul 2012 21:46:46 -0000
Content-Type: multipart/alternative; boundary=f46d0444732ff1277a04c4bcdbee

--f46d0444732ff1277a04c4bcdbee
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 14, 2012 at 12:03 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Friday 13 July 2012 21:52:24 Andrei Gherzan wrote:
> > http://xorg.freedesktop.org/ is down so libx11-trim will fail at fetch.
> >
> > Use
> > http://ftp.x.org/pub/individual/lib/
> > temporary.
>
> Isn't this why we have source mirrors? Are they not helping for this
> recipe?
>
> Not working for this.

ag

--f46d0444732ff1277a04c4bcdbee
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Sat, Jul 14, 2012 at 12:03 AM, Paul Eggleton =
<span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" targ=
et=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5">On Friday 13 July 2012 21:52:24 And=
rei Gherzan wrote:<br>
&gt; <a href=3D"http://xorg.freedesktop.org/" target=3D"_blank">http://xorg=
.freedesktop.org/</a> is down so libx11-trim will fail at fetch.<br>
&gt;<br>
&gt; Use<br>
&gt; <a href=3D"http://ftp.x.org/pub/individual/lib/" target=3D"_blank">htt=
p://ftp.x.org/pub/individual/lib/</a><br>
&gt; temporary.<br>
<br>
</div></div>Isn&#39;t this why we have source mirrors? Are they not helping=
 for this recipe?<br><br></blockquote><div>Not working for this.</div><div>=
<br></div><div>ag=A0</div></div>

--f46d0444732ff1277a04c4bcdbee--
