Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TaBGA-0004wZ-H8
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Nov 2012 21:14:32 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so2630000pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2012 12:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=K/it60DEvc+01buCoADFtngC/YOSmwydAqPSNAsTySY=;
	b=sVLCvBbu4edb7TjFY22BrdiXhaGCFcPOK9plLJMTUrBQFZNJ9yH9cgo0mUypso59qt
	bhAihbDqfBgDTTTli+xihboBh3NORv35oINRw1x6oZgkn1HSg5A4UbuS8VAWx7n92h0J
	SV097iAGnZ6s+tSFcx0J+Do4pGWzVuT3BL+YTVr3t0OY83cnlG2QcKu0EH/az42iUMxB
	ItVZHetP6YZ/8pta76yFfcIaS79Wo2xwxh/ICoHdKxgazqQeuZjBpjeOa6wLobaVAY+9
	+2sTX5ptpynSmlXaB57mHNrcSsgxtJLyMOJP+rULLSN5C8/C2gR0U5KCws581Brlhu/s
	PLkg==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr27596947pbc.33.1353268828550;
	Sun, 18 Nov 2012 12:00:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Sun, 18 Nov 2012 12:00:28 -0800 (PST)
In-Reply-To: <CAP9ODKoT=n2Uxee7Weuh65OJ3ODat1pfnPmOAa0TxM05QLmB6Q@mail.gmail.com>
References: <70CC66F5C30A414DADDA6973E4CA391A780B30@039-SN1MPN1-001.039d.mgd.msft.net>
	<50A50BE1.2030305@balister.org>
	<CAP9ODKoT=n2Uxee7Weuh65OJ3ODat1pfnPmOAa0TxM05QLmB6Q@mail.gmail.com>
Date: Sun, 18 Nov 2012 18:00:28 -0200
X-Google-Sender-Auth: enHU2ti3edllf78Dpe4mS4CDmeg
Message-ID: <CAP9ODKqKvxEwDeoTeYZ3WogzZHbMMo8X9v9MLqqDk0e2xDOKmA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Philip Balister <philip@balister.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] meta-freescale general mailing list
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
X-List-Received-Date: Sun, 18 Nov 2012 20:14:32 -0000
Content-Type: multipart/alternative; boundary=047d7b10d185cfb8f304ceca733d

--047d7b10d185cfb8f304ceca733d
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 15, 2012 at 3:02 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

>
> On Thu, Nov 15, 2012 at 1:36 PM, Philip Balister <philip@balister.org>wrote:
>
>> On 11/14/2012 11:58 AM, McClintock Matthew-B29882 wrote:
>>
>>> YoctoProject.org is now hosting a meta-freescale mailing list that are
>>> going to unify the communities of meta-fsl-ppc and meta-fsl-arm.
>>>
>>>  From now on all patches affecting meta-fsl-ppc and meta-fsl-arm can be
>>>>
>>> sent to meta-freescale@yoctoproject.**org<meta-freescale@yoctoproject.org>and have the respective tag in
>>> the patch. Please check the README in respective layer about the
>>> command line to use for git format-patch.
>>>
>>> Please subscribe here: https://lists.yoctoproject.**
>>> org/listinfo/meta-freescale<https://lists.yoctoproject.org/listinfo/meta-freescale>
>>> Archives here: https://lists.yoctoproject.**
>>> org/pipermail/meta-freescale/<https://lists.yoctoproject.org/pipermail/meta-freescale/>
>>>
>>
>> Can you register the list with gmane? I find it is much easier to follow
>> lists there.
>>
>> Do we have a standard for yocto/OE list names on gmane?
>>
>
> I tried to add it but it did not work.
>

It is now done.

You can see it at
http://blog.gmane.org/gmane.linux.embedded.yocto.meta-freescale

Regards,
-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b10d185cfb8f304ceca733d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Thu, Nov 15, 2012 at 3:02 PM, Otavio =
Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" t=
arget=3D"_blank">otavio@ossystems.com.br</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br><div class=3D"gmail_quote"><div class=3D"im">On Thu, Nov 15, 2012 at 1:=
36 PM, Philip Balister <span dir=3D"ltr">&lt;<a href=3D"mailto:philip@balis=
ter.org" target=3D"_blank">philip@balister.org</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">

<div>On 11/14/2012 11:58 AM, McClintock Matthew-B29882 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
YoctoProject.org is now hosting a meta-freescale mailing list that are<br>
going to unify the communities of meta-fsl-ppc and meta-fsl-arm.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From now on all patches affecting meta-fsl-ppc and meta-fsl-arm can be<br>
</blockquote>
sent to <a href=3D"mailto:meta-freescale@yoctoproject.org" target=3D"_blank=
">meta-freescale@yoctoproject.<u></u>org</a> and have the respective tag in=
<br>
the patch. Please check the README in respective layer about the<br>
command line to use for git format-patch.<br>
<br>
Please subscribe here: <a href=3D"https://lists.yoctoproject.org/listinfo/m=
eta-freescale" target=3D"_blank">https://lists.yoctoproject.<u></u>org/list=
info/meta-freescale</a><br>
Archives here: <a href=3D"https://lists.yoctoproject.org/pipermail/meta-fre=
escale/" target=3D"_blank">https://lists.yoctoproject.<u></u>org/pipermail/=
meta-freescale/</a><br>
</blockquote>
<br></div>
Can you register the list with gmane? I find it is much easier to follow li=
sts there.<br>
<br>
Do we have a standard for yocto/OE list names on gmane?<br></blockquote><di=
v><br></div></div><div>I tried to add it but it did not work.</div></div></=
blockquote><div><br></div><div>It is now done.</div><div><br></div><div>
You can see it at=A0<a href=3D"http://blog.gmane.org/gmane.linux.embedded.y=
octo.meta-freescale">http://blog.gmane.org/gmane.linux.embedded.yocto.meta-=
freescale</a></div><div><br></div><div>Regards,=A0</div></div>-- <br>Otavio=
 Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Sy=
stems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--047d7b10d185cfb8f304ceca733d--
