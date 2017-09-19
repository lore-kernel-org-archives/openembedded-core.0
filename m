Return-Path: <prvs=043542d3a3=mike.looijmans@topicproducts.com>
X-Greylist: delayed 1872 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Sep 2017 05:58:20 UTC
Received: from mx36-out12.antispamcloud.com (mx36-out12.antispamcloud.com
	[209.126.121.60])
	by mail.openembedded.org (Postfix) with ESMTP id 4561E781EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 05:58:20 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1duB3k-0001X8-0K for openembedded-core@lists.openembedded.org;
	Tue, 19 Sep 2017 07:27:08 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Sep 2017 07:26:58 +0200
To: <openembedded-core@lists.openembedded.org>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <de7d5253-ad4b-a9dc-4d53-413a0014a8c0@topic.nl>
Date: Tue, 19 Sep 2017 07:26:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
X-Filter-ID: PqwsvolAWURa0gwxuN3S5YEa3T7JuZT23fGO2rGt3ZgWMD8gia7lRmdoHJ3n0cm6Vtfp9X1ZBchZ
	wvx8a7dTUQWF0kx98HH3GX+iQK7NiP6LBDMrD7q/cJogwbqzsuokIXMJ1U4MKKnQ5SAJ1V9dkP9x
	bu57BDazLmklZgT7xza2rj6pk4EbBl0qSAHnjUyeXwyWgq6PLONlwfsJSoAO8bDyxIbzW95L4UAJ
	BVa/YBk8CVsONrMJuGzuoGnKTKcygLJjfy2/hUPxxGqITycuLMdYaphGvYopQ24KJ9kgRDN3pbXn
	aMbbC1QSUBxihEsjBWOBqoptsYkcljagCMIDypReAQCFQo+KUtaSCrVTlxOfVsst/QEVbupaaYfx
	KYRJ8ar4sO9kYmr7/nmchPR9G2DCX9m2p4wUnZpURALMKaPBcC9OMLR/g2nFXNsLRUFiMZgHEKhZ
	csVHVGePyIMTSrKqefbWb9LgHVcrUolS+C/fLM7Ww0jFUCG51FTiiz6cR64dodD7udB+zcx8OjSt
	1b1YgBvhxKfoFZHs3o0j+S0jv2y8/jlUqm+TeNrMp4+EE+rDN/FnSl88wIa35p4FFXznVNpEBSRM
	35KuCE6M5jOyxQgNyqqf/IN48z1lpo6ODRmiSLYXQoEVxAAhr5KC2/vg7iEFLP+SSY+Av5+AiC4K
	XP3vTB7AsR5+kaiIjlO6Iw9C0PQ5NLyrXuzfSqvsySr0uqThpuuRzPsvGgTJwhV8JmFmLZ6h3eau
	qEcwyeT0VZvJGSxm4bcH1lFUB/zPeGsnJ395jBJAgljEd2a/UHQV6Xe4bIYRHe1fiVaECIfGCs+d
	m3T5GTMS0IoMjuD73MBlNCXldRLkC5TILJuZrGhtP3IHr7mRRBdQ+rEKkqhnmNb6vV/9OcbV5CTm
	BwBTZU8v1DnRT2U8cfkuAuwvJls=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Tue, 19 Sep 2017 05:58:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 18-09-17 20:43, Burton, Ross wrote:
> On 18 September 2017 at 19:41, Andre McCurdy <armccurdy@gmail.com=20
> <mailto:armccurdy@gmail.com>> wrote:
>=20
>     On Mon, Sep 18, 2017 at 8:17 AM, Burton, Ross <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>> wrote:
>      > On 18 September 2017 at 16:07, Peter Kjellerstedt
>      > <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>>=
 wrote:
>      >>
>      >> >=20

Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail



-----Original Message-----
>      >> > From: openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>
>      >> > [mailto:openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>] On Behalf =
Of
>      >> > Mike Looijmans
>      >> > Sent: den 18 september 2017 16:07
>      >> > To: openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>
>      >> > Cc: Mike Looijmans <mike.looijmans@topic.nl
>     <mailto:mike.looijmans@topic.nl>>; Peter Kjellerstedt
>      >> > <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.co=
m>>
>      >> > Subject: [OE-core] [PATCH] base-files: profile: Get rid of "res=
ize"
>      >> >
>      >> > The "resize" command actually outputs shell commands to be exec=
uted, for
>      >> > example:
>      >> >
>      >> > $ resize
>      >> > COLUMNS=3D102;
>      >> > LINES=3D27;
>      >> > export COLUMNS LINES;
>      >> >
>      >> > The output of "resize" is being discarded to /dev/null so the c=
all has
>      >> > no
>      >> > effect whatsoever, and does not change the environment (it cann=
ot change
>      >> > the
>      >> > environment of its parent). Remove the call and hence solve the=
 messages
>      >> > about shells missing "command" or "tty" or "resize".
>      >> >
>      >> > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl
>     <mailto:mike.looijmans@topic.nl>>
>      >> > ---
>      >> >  meta/recipes-core/base-files/base-files/profile | 9 ---------
>      >> >  1 file changed, 9 deletions(-)
>      >> >
>      >> > diff --git a/meta/recipes-core/base-files/base-files/profile
>      >> > b/meta/recipes-core/base-files/base-files/profile
>      >> > index a062028..cfd0d69 100644
>      >> > --- a/meta/recipes-core/base-files/base-files/profile
>      >> > +++ b/meta/recipes-core/base-files/base-files/profile
>      >> > @@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then
>      >> >       unset i
>      >> >  fi
>      >> >
>      >> > -if command -v resize >/dev/null && command -v tty >/dev/null; =
then
>      >> > -     # Make sure we are on a serial console (i.e. the device u=
sed
>      >> > starts with
>      >> > -     # /dev/tty[A-z]), otherwise we confuse e.g. the eclipse l=
auncher
>      >> > which
>      >> > -     # tries do use ssh
>      >> > -     case $(tty) in
>      >> > -             /dev/tty[A-z]*) resize >/dev/null;;
>      >> > -     esac
>      >> > -fi
>      >> > -
>      >> >  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>      >> >
>      >> >  umask 022
>      >> > --
>      >> > 1.9.1
>      >>
>      >> Hold on. Looking at busybox' source code for resize, it seems tha=
t
>      >> it actually does something besides outputting the shell code to
>      >> set the variables (which is actually enabled by a separate featur=
e
>      >> called ENABLE_FEATURE_RESIZE_PRINT). It also calls
>      >> ioctl(STDERR_FILENO, TIOCSWINSZ, &w) where w contains the
>      >> calculated sizes.
>      >
>      > My knowledge of ANSI escapes is incredibly sketchy, but isn't that=
 the code
>      > to *get* the size of the screen?  Put the cursor at 999,999, then =
ask where
>      > it is?
>=20
>     The behaviour may have got broken with the various /etc/profile
>     rewrites but it certainly did do something useful originally - it
>     greatly improves usability for shells run on serial consoles. Please
>     don't just remove it.
>=20
>=20
> The question is does it do something useful *now*?

My experience is that it does not, and never has. I run serial consoles all=
=20
the time, and if they're not sized to 80x25 weird stuff happens.

Start vi on a serial terminal and it only uses the top 80x25. If a command=
=20
exceed the 80 char mark, the cursor goes all weird.
Running "eval `resize`" fixes that (until you resize the window). Running j=
ust=20
"resize" does not have any effect on that at all.

Cannot we determine the presence of "tty" and "resize" commands at compile=
=20
time? something like:

if has_command("tty") and has_command("resize"):
     install -m 755 ${S}/resize.sh ${D}${sysconfdir}/profile.d/


