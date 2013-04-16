Received: from mail-vc0-f176.google.com ([209.85.220.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1URzbz-0003cm-VF
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 08:43:31 +0200
Received: by mail-vc0-f176.google.com with SMTP id hf12so107979vcb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 23:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9zYIIMyi8cBkILSJhrW7f790WaDIa5a8+2pIVNcUvcE=;
	b=rLyqssaaIap9mmLHm952o2gx/6HnT4r8RQbJZZZ6u4U7FWDQx5GINzjDl0yKlrkeEn
	1kODNry79E/PtuspBhfC4vxpaii7betjJZ6xXfFB4L5aGW8knv363U9JVHxA64SlejO6
	GK9kjw68MHRU4tKZ25gNszyavXjb+E8u5+I9fdrhHxX4ZRE2U+EC+NxG9Cw3cg14xdUY
	pgpCtzf1+BBI1irSsoQ5ym0MVQqj0FgP7IIf44V+S/5YNsl66ll14l4s+wjrC7E2HuHz
	+x7he3ap+KoA3bcIjVlCxawFhJzyy31DLw+aNL5IIVKLL0NifasDxNLnJNAi2Dozl+UI
	U85Q==
MIME-Version: 1.0
X-Received: by 10.52.33.236 with SMTP id u12mr456057vdi.101.1366093557763;
	Mon, 15 Apr 2013 23:25:57 -0700 (PDT)
Received: by 10.220.158.78 with HTTP; Mon, 15 Apr 2013 23:25:57 -0700 (PDT)
In-Reply-To: <CADkTA4NGns0txOGYZTiPpXkypcj0=dMcRAgkGF4NBHKE4tr-qA@mail.gmail.com>
References: <20130415180716.GA30774@ad.chargestorm.se>
	<CADkTA4Nz1jGjK+iJEXKQ8zVcR0DBOP-4x97b57_wdoN7kSdP4w@mail.gmail.com>
	<CADkTA4O8VpiQB8vCDPoB87N+fafYrpjL4grN3HNn_7ys_cty=Q@mail.gmail.com>
	<902155bf-386e-48bb-bb46-37febded2109@email.android.com>
	<CADkTA4NGns0txOGYZTiPpXkypcj0=dMcRAgkGF4NBHKE4tr-qA@mail.gmail.com>
Date: Tue, 16 Apr 2013 08:25:57 +0200
Message-ID: <CAE4k2390z9CQja3ioa43J9S1qgFfVa-ZgB912j+Hb6BcmL7u8A@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto-custom. error in patch step
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
X-List-Received-Date: Tue, 16 Apr 2013 06:43:34 -0000
Content-Type: multipart/alternative; boundary=20cf307ca3e63d983004da747114

--20cf307ca3e63d983004da747114
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 15, 2013 at 9:19 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> This is fixed here. One line fix (smaller than that actually) .. isn't
> that always the
> way.
>

Sure, it's always something small that has either been forgotten about or
that's falling apart for some other reasons!



> I'll be sending RP a fix for it shortly. Thanks for the report!


Thanks again for a quick fix!

Cheers,
Anders

-- 
Anders Darander
EPO guidelines 1978: "If the contribution to the known art resides
solely in a computer program then the subject matter is not
patentable in whatever manner it may be presented in the claims."

--20cf307ca3e63d983004da747114
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Apr 15, 2013 at 9:19 PM, Bruce Ashfield <span dir=3D"ltr">&=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashf=
ield@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><spa=
n style=3D"color:rgb(34,34,34)">This is fixed here. One line fix (smaller t=
han that actually) .. isn&#39;t</span><br>
</div></div>
that always the<br>
way.<br></blockquote><div><br></div><div style>Sure, it&#39;s always someth=
ing small that has either been forgotten about or that&#39;s falling apart =
for some other reasons!</div><div><br></div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

I&#39;ll be sending RP a fix for it shortly. Thanks for the report!</blockq=
uote><div><br></div><div style>Thanks again for a quick fix!</div><div styl=
e><br></div><div style>Cheers,</div><div style>Anders=A0</div></div><div>
<br></div>-- <br>Anders Darander<br>EPO guidelines 1978: &quot;If the contr=
ibution to the known art resides<br>solely in a computer program then the s=
ubject matter is not<br>patentable in whatever manner it may be presented i=
n the claims.&quot;
</div></div>

--20cf307ca3e63d983004da747114--
