Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SppSg-00023n-3B
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 01:39:50 +0200
Received: from mail151-ch1-R.bigfish.com (10.43.68.243) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jul 2012 23:28:34 +0000
Received: from mail151-ch1 (localhost [127.0.0.1])	by
	mail151-ch1-R.bigfish.com (Postfix) with ESMTP id 9BFD9E0148	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 23:28:34 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371Ic85dh1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail151-ch1 (localhost.localdomain [127.0.0.1]) by mail151-ch1
	(MessageSwitch) id 1342222112994826_10106;
	Fri, 13 Jul 2012 23:28:32 +0000 (UTC)
Received: from CH1EHSMHS012.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.234])	by mail151-ch1.bigfish.com (Postfix) with ESMTP id
	E6E244200C1	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 23:28:32 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS012.bigfish.com
	(10.43.70.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jul 2012 23:28:32 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Fri, 13 Jul 2012 18:28:32 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] task-core-tools-testapps.bb: kexec-tools
	does not work on e5500-64b parts
Thread-Index: AQHNYTmLRzCgI7yOFUaJxPC5YLPQv5coLnwAgAABTYA=
Date: Fri, 13 Jul 2012 23:28:30 +0000
Message-ID: <CAEsOVNe-kKT9jP5XSTaskrr3sp5omoYd4Suw3ZZ3nKtNe2UWcQ@mail.gmail.com>
References: <1342210017-26817-1-git-send-email-msm@freescale.com>
	<CAMKF1sokTHtYziStdSsGvdh4HnhJs3KAYecs-dJ1UXeBGN_sUg@mail.gmail.com>
	<CAEsOVNdHzFoc6m_yAiUk97iFxuDsr-MDL=M19hvci-oxAAcnOg@mail.gmail.com>
	<CAMKF1sr_jLKLoRRP-p9aZEvd=mKxoDdmgjv4=iHwwzAz5TDmzg@mail.gmail.com>
In-Reply-To: <CAMKF1sr_jLKLoRRP-p9aZEvd=mKxoDdmgjv4=iHwwzAz5TDmzg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] task-core-tools-testapps.bb: kexec-tools does not work on e5500-64b parts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 13 Jul 2012 23:39:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CAEsOVNekKT9jP5XSTaskrr3sp5omoYd4Suw3ZZ3nKtNe2UWcQmailg_"

--_000_CAEsOVNekKT9jP5XSTaskrr3sp5omoYd4Suw3ZZ3nKtNe2UWcQmailg_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


On Jul 13, 2012 6:24 PM, "Khem Raj" <raj.khem@gmail.com<mailto:raj.khem@gma=
il.com>> wrote:
>
>
>
> On Friday, July 13, 2012, McClintock Matthew-B29882 <B29882@freescale.com=
<mailto:B29882@freescale.com>> wrote:
> > On Fri, Jul 13, 2012 at 3:43 PM, Khem Raj <raj.khem@gmail.com<mailto:ra=
j.khem@gmail.com>> wrote:
> >> On Fri, Jul 13, 2012 at 1:06 PM, Matthew McClintock <msm@freescale.com=
<mailto:msm@freescale.com>> wrote:
> >>> This prevents kexec from building for this part since it does not wor=
k
> >>>
> >>> Signed-off-by: Matthew McClintock <msm@freescale.com<mailto:msm@frees=
cale.com>>
> >>> ---
> >>>  meta/recipes-core/tasks/task-core-tools-testapps.bb<http://task-core=
-tools-testapps.bb> |    1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/meta/recipes-core/tasks/task-core-tools-testapps.bb<http=
://task-core-tools-testapps.bb> b/meta/recipes-core/tasks/task-core-tools-t=
estapps.bb<http://task-core-tools-testapps.bb>
> >>> index b5847f8..bdd0d05 100644
> >>> --- a/meta/recipes-core/tasks/task-core-tools-testapps.bb<http://task=
-core-tools-testapps.bb>
> >>> +++ b/meta/recipes-core/tasks/task-core-tools-testapps.bb<http://task=
-core-tools-testapps.bb>
> >>> @@ -22,6 +22,7 @@ KEXECTOOLS ?=3D "kexec"
> >>>  KEXECTOOLS_mips ?=3D ""
> >>>  KEXECTOOLS_mipsel ?=3D ""
> >>>  KEXECTOOLS_powerpc ?=3D ""
> >>> +KEXECTOOLS_e5500-64b ?=3D ""
> >>
> >> you should use arch override here this is not machine specific recipe =
probably
> >>
> >> KEXECTOOLS_powerpc64 ?=3D ""
> >>
> >> is better
> >
> > I thought about that at first, but there are plenty of powerpc64
> > machines that do support kexec ;) It's really just the Freescale
> > variant.
>
> OK I see I thought PowerPC 32 bit is ignored already so chances of 64 bit=
 working are even less but as you say it works on some of them so be it

Actually some freescale 32 bits parts work with kexec as I did some of that=
 enablement. I just need to test it out and change the other line.

-M

>
> >
> > -M
> >
> >>
> >>>
> >>>  RDEPENDS_${PN} =3D "\
> >>>      blktool \
> >>> --
> >>> 1.7.10
> >>>
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lis=
ts.openembedded.org>
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@list=
s.openembedded.org>
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists=
.openembedded.org>
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.o=
penembedded.org>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--_000_CAEsOVNekKT9jP5XSTaskrr3sp5omoYd4Suw3ZZ3nKtNe2UWcQmailg_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: <632365E6CB19BD45AC3CE15BF6D30827@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<p><br>
On Jul 13, 2012 6:24 PM, &quot;Khem Raj&quot; &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Friday, July 13, 2012, McClintock Matthew-B29882 &lt;<a href=3D"mai=
lto:B29882@freescale.com">B29882@freescale.com</a>&gt; wrote:<br>
&gt; &gt; On Fri, Jul 13, 2012 at 3:43 PM, Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; On Fri, Jul 13, 2012 at 1:06 PM, Matthew McClintock &lt;<a hr=
ef=3D"mailto:msm@freescale.com">msm@freescale.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt; This prevents kexec from building for this part since it =
does not work<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Matthew McClintock &lt;<a href=3D"mailto:m=
sm@freescale.com">msm@freescale.com</a>&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt; &nbsp;meta/recipes-core/tasks/<a href=3D"http://task-core=
-tools-testapps.bb">task-core-tools-testapps.bb</a> | &nbsp; &nbsp;1 &#43;<=
br>
&gt; &gt;&gt;&gt; &nbsp;1 file changed, 1 insertion(&#43;)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/meta/recipes-core/tasks/<a href=3D"http://ta=
sk-core-tools-testapps.bb">task-core-tools-testapps.bb</a> b/meta/recipes-c=
ore/tasks/<a href=3D"http://task-core-tools-testapps.bb">task-core-tools-te=
stapps.bb</a><br>
&gt; &gt;&gt;&gt; index b5847f8..bdd0d05 100644<br>
&gt; &gt;&gt;&gt; --- a/meta/recipes-core/tasks/<a href=3D"http://task-core=
-tools-testapps.bb">task-core-tools-testapps.bb</a><br>
&gt; &gt;&gt;&gt; &#43;&#43;&#43; b/meta/recipes-core/tasks/<a href=3D"http=
://task-core-tools-testapps.bb">task-core-tools-testapps.bb</a><br>
&gt; &gt;&gt;&gt; @@ -22,6 &#43;22,7 @@ KEXECTOOLS ?=3D &quot;kexec&quot;<b=
r>
&gt; &gt;&gt;&gt; &nbsp;KEXECTOOLS_mips ?=3D &quot;&quot;<br>
&gt; &gt;&gt;&gt; &nbsp;KEXECTOOLS_mipsel ?=3D &quot;&quot;<br>
&gt; &gt;&gt;&gt; &nbsp;KEXECTOOLS_powerpc ?=3D &quot;&quot;<br>
&gt; &gt;&gt;&gt; &#43;KEXECTOOLS_e5500-64b ?=3D &quot;&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; you should use arch override here this is not machine specifi=
c recipe probably<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; KEXECTOOLS_powerpc64 ?=3D &quot;&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; is better<br>
&gt; &gt;<br>
&gt; &gt; I thought about that at first, but there are plenty of powerpc64<=
br>
&gt; &gt; machines that do support kexec ;) It's really just the Freescale<=
br>
&gt; &gt; variant.<br>
&gt;<br>
&gt; OK I see I thought PowerPC 32 bit is ignored already so chances of 64 =
bit working are even less but as you say it works on some of them so be it<=
/p>
<p>Actually some freescale 32 bits parts work with kexec as I did some of t=
hat enablement. I just need to test it out and change the other line.
</p>
<p>-M<br>
</p>
<p>&gt;<br>
&gt; &gt;<br>
&gt; &gt; -M<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; &nbsp;RDEPENDS_${PN} =3D &quot;\<br>
&gt; &gt;&gt;&gt; &nbsp; &nbsp; &nbsp;blktool \<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; 1.7.10<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; _______________________________________________<br>
&gt; &gt;&gt;&gt; Openembedded-core mailing list<br>
&gt; &gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt;&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/lis=
tinfo/openembedded-core">
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><b=
r>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.openembedded.org</a><br>
&gt; &gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core">
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><b=
r>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/op=
enembedded-core">
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><b=
r>
&gt; &gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><b=
r>
&gt;<br>
</p>
</body>
</html>

--_000_CAEsOVNekKT9jP5XSTaskrr3sp5omoYd4Suw3ZZ3nKtNe2UWcQmailg_--
