Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1QrqT7-000310-C7
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 14:04:05 +0200
Received: by gwb11 with SMTP id 11so1913356gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 04:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=FM2H1J7SoZU96WnsMf+KSXhk1nEtiNjsMgovGsLDFZw=;
	b=c7BW3LeYzX12vSHuCVD6pLaQIHjh8NbdLfTMm9mYTf1NoKnpPtLjNX5uLoo5U4jPXH
	cPFquMYcLkLlS6DPvJKLj2CmSRvQe8OAYlAO8qKZLqNFjzvFG+Cv2a4K0nYzjC2Thma6
	PgUyvlJHwYeT3gLjnXSWyFLnLh7KdbEGtUmj8=
MIME-Version: 1.0
Received: by 10.236.176.97 with SMTP id a61mr2459309yhm.250.1313150370075;
	Fri, 12 Aug 2011 04:59:30 -0700 (PDT)
Received: by 10.236.110.3 with HTTP; Fri, 12 Aug 2011 04:59:30 -0700 (PDT)
In-Reply-To: <201108121147.58438.paul.eggleton@linux.intel.com>
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
	<201108121008.03554.paul.eggleton@linux.intel.com>
	<CAGiJk9dGQ5N0xd+L81Bit-jp4YDYPwSBjNvn5_io38vyH2nREg@mail.gmail.com>
	<201108121147.58438.paul.eggleton@linux.intel.com>
Date: Fri, 12 Aug 2011 07:59:30 -0400
Message-ID: <CAFu+nvEY-=wvh0zn3WgOCNjM0e54Q3LSK2N5jWb6-Yi3hnDZxQ@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Questions about the layer structure in OpenEmbedded-Core
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
X-List-Received-Date: Fri, 12 Aug 2011 12:04:05 -0000
Content-Type: multipart/alternative; boundary=485b397dd10d58543c04aa4da585

--485b397dd10d58543c04aa4da585
Content-Type: text/plain; charset=UTF-8

that graphic is nice, could it be included in the wiki?

On Fri, Aug 12, 2011 at 6:47 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Friday 12 August 2011 10:31:12 you wrote:
> > 2011/8/12 Paul Eggleton <paul.eggleton@linux.intel.com>:
> > > I wrote both of these with input from the community recently, so they
> > > should be fairly reliable and up-to-date - was there something missing
> > > that you noticed? Suggestions welcome.
> >
> > Maybe these are not from OpenEmbedded (or newer than the update) but I
> > got additionally items, which where provided by the setup script:
> > meta-efikamx, meta-openpandora (openpandora may come somewhere from
> > angstrom) and meta-xilinx.
>
> Right, I have now added those to the layer index. Thanks!
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
>

--485b397dd10d58543c04aa4da585
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

that graphic is nice, could it be included in the wiki?<br><br><div class=
=3D"gmail_quote">On Fri, Aug 12, 2011 at 6:47 AM, Paul Eggleton <span dir=
=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton=
@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;">On Friday 12 August 2011 10:31:12 you wrote=
:<br>
&gt; 2011/8/12 Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.inte=
l.com">paul.eggleton@linux.intel.com</a>&gt;:<br>
<div class=3D"im">&gt; &gt; I wrote both of these with input from the commu=
nity recently, so they<br>
&gt; &gt; should be fairly reliable and up-to-date - was there something mi=
ssing<br>
&gt; &gt; that you noticed? Suggestions welcome.<br>
&gt;<br>
</div>&gt; Maybe these are not from OpenEmbedded (or newer than the update)=
 but I<br>
&gt; got additionally items, which where provided by the setup script:<br>
&gt; meta-efikamx, meta-openpandora (openpandora may come somewhere from<br=
>
&gt; angstrom) and meta-xilinx.<br>
<br>
Right, I have now added those to the layer index. Thanks!<br>
<div><div></div><div class=3D"h5"><br>
Cheers,<br>
Paul<br>
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--485b397dd10d58543c04aa4da585--
