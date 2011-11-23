Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTHZB-0003oU-2j
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 19:29:05 +0100
Received: by ghy10 with SMTP id 10so1705515ghy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 10:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=1C9a2uT02ZzP0i107GEPLPDo8+yS36BCP1IQw64A+f4=;
	b=vmxg0OP8vA2RrC6cTnEdsXklPmWSn7V0243ZKRYWJai8G5GK5FZwxs94fQHYzL92a+
	vR+H/1sjHMlX4/rruy0SYMc7m8E+8Gce91Vt+pjdpVd1ZRPhgkX4TczckumiFSHvV53C
	BvgjoreFFOvO35BcF1f60FBr1g1QNCMmO7YfM=
MIME-Version: 1.0
Received: by 10.204.148.4 with SMTP id n4mr25547210bkv.42.1322072550392; Wed,
	23 Nov 2011 10:22:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Wed, 23 Nov 2011 10:22:30 -0800 (PST)
In-Reply-To: <1322070823.26081.37.camel@phil-desktop>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<1322066940.26081.27.camel@phil-desktop>
	<1322068148.15626.15.camel@ted> <6713028.ehgggRD6ui@helios>
	<1322070823.26081.37.camel@phil-desktop>
Date: Wed, 23 Nov 2011 16:22:30 -0200
X-Google-Sender-Auth: js52qVcXZETLMlSt3pbSmKEYqIM
Message-ID: <CAP9ODKpbitsOYjUNOMU3UpZcM1q5mqs0ifWUCLp1z7ZzDS5z4Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 18:29:05 -0000
Content-Type: multipart/alternative; boundary=0015174bf02cbbc21204b26b007f

--0015174bf02cbbc21204b26b007f
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 23, 2011 at 15:53, Phil Blundell <philb@gnu.org> wrote:

> ...
>
It's true that this will (in some sense) segment them into "new" and
> "old" features but it isn't going to be a hard, fixed division and I
> would expect that most DISTROs will do a fairly good job of keeping up
> to date with the newly introduced flags.


In this case I think distros can live with those new features and deal with
it.


-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015174bf02cbbc21204b26b007f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Nov 23, 2011 at 15:53, Phil Blundell <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">...=A0</div></blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">=
<div class=3D"im">It&#39;s true that this will (in some sense) segment them=
 into &quot;new&quot; and</div>

&quot;old&quot; features but it isn&#39;t going to be a hard, fixed divisio=
n and I<br>
would expect that most DISTROs will do a fairly good job of keeping up<br>
to date with the newly introduced flags.</blockquote><div><br></div><div>In=
 this case I think distros can live with those new features and deal with i=
t.=A0</div></div><br clear=3D"all"><div><br></div>-- <br>Otavio Salvador=A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--0015174bf02cbbc21204b26b007f--
