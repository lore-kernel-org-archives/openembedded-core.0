Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>)
	id 1Qi5sl-0004mB-6b; Sat, 16 Jul 2011 16:30:15 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LOF0050PHAVWSA0@vms173005.mailsrvcs.net>; Sat,
	16 Jul 2011 08:25:45 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 16FE58; Sat, 16 Jul 2011 08:25:40 -0500
Received: from [192.168.1.13] by rkmorris.us with HTTP; Sat,
	16 Jul 2011 08:25:38 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Sat, 16 Jul 2011 08:25:38 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1310822738895594500@rkmorris.us>
In-reply-to: <CAMKF1spOJJP=qdDbYpcnArUR1rjvJznXXiB7KAqQNT5R7J8N_Q@mail.gmail.com>
References: <CAMKF1spOJJP=qdDbYpcnArUR1rjvJznXXiB7KAqQNT5R7J8N_Q@mail.gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 2
X-Mailman-Approved-At: Sat, 16 Jul 2011 16:32:13 +0200
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Populating meta-oe with new patches on oe.dev
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
X-List-Received-Date: Sat, 16 Jul 2011 14:30:15 -0000
Content-type: multipart/alternative;
	boundary="===axigen=5536424865644401253159918978167057270354=axigen==="

--===axigen=5536424865644401253159918978167057270354=axigen===
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

My apologies for the dumb question, but I admit that I don't know the answe=
r, so ...

=20

Can someone explain the differences between oe-core and OpenEmbedded, and i=
n particular the various git repositories? I ask because I'm struggling to =
get OE running on my h1940 (using openembedded), but I have a feeling that =
this may be the wrong repository to use ... but I just don't know ... :-(. =
I'm also not sure which ones are being worked on going forward (as I would =
like to submit changes once I get things working, but again don't know whic=
h repository is the right one).

=20

Thanks in advance for your help!

=20

... Russell

=20



On Fri, 07/15/2011 04:42 PM, Khem Raj <raj.khem@gmail.com> wrote:


>=20
Hello
>=20
> As we all know that next release of OpenEmbedded is slated based on
> oe-core, I would like to request submitters and committers of
> the patches for oe.dev to port the patches to meta-oe or any other
> layer that is suitable for a given patch. Any new recipes
> being added to oe.dev should definitely go into the new layered structure
>=20
> Please follow the commit guidelines for meta-oe/oe-core and submit the
> appropriate pull requests so that when we cut out the next release we
> don't miss any of those patches.
>=20
> Thanks for your cooperation and help
>=20
> -Khem
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

--===axigen=5536424865644401253159918978167057270354=axigen===
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html><head><style id=3D"axi-htmleditor-style" type=3D"text/css">p { margin=
: 0px; }</style></head><body style=3D"font-size: 10pt; font-family: Arial; =
background-image: none; background-repeat: repeat; background-attachment: f=
ixed;"><P>Hi,</P>
<P>&nbsp;</P>
<P>My apologies for the dumb question, but I admit that I don't know the an=
swer, so ...</P>
<P>&nbsp;</P>
<P>Can someone explain the differences between oe-core and OpenEmbedded, an=
d in particular the various git repositories? I ask because I'm struggling =
to get OE running on my h1940 (using openembedded), but I have a feeling th=
at this may be the wrong repository to use ... but I just don't know ... :-=
(. I'm also not sure which ones are being worked on going forward (as I wou=
ld like to submit changes once I get things working, but again don't know w=
hich repository is the right one).</P>
<P>&nbsp;</P>
<P>Thanks in advance for your help!</P>
<P>&nbsp;</P>
<P>... Russell</P>
<P>&nbsp;</P>
<P><BR><BR>On Fri, 07/15/2011 04:42 PM, Khem&nbsp;Raj&nbsp;&lt;raj.khem@gma=
il.com&gt; wrote:<BR></P>
<BLOCKQUOTE style=3D"BORDER-LEFT: rgb(0,0,204) 2px solid; PADDING-LEFT: 4px=
; MARGIN-LEFT: 16px">
<DIV style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Hello<BR><BR>As we all k=
now that next release of OpenEmbedded is slated based on<BR>oe-core, I woul=
d like to request submitters and committers of<BR>the patches for oe.dev to=
 port the patches to meta-oe or any other<BR>layer that is suitable for a g=
iven patch. Any new recipes<BR>being added to oe.dev should definitely go i=
nto the new layered structure<BR><BR>Please follow the commit guidelines fo=
r meta-oe/oe-core and submit the<BR>appropriate pull requests so that when =
we cut out the next release we<BR>don't miss any of those patches.<BR><BR>T=
hanks for your cooperation and help<BR><BR>-Khem<BR><BR>___________________=
____________________________<BR>Openembedded-devel mailing list<BR><A href=
=3D"mailto:Openembedded-devel@lists.openembedded.org" target=3D_blank>Opene=
mbedded-devel@lists.openembedded.org</A><BR><A href=3D"http://server.home:8=
080/redir.hsp?url=3D%68%74%74%70%3A%2F%2F%6C%69%73%74%73%2E%6C%69%6E%75%78%=
74%6F%67%6F%2E%6F%72%67%2F%63%67%69%2D%62%69%6E%2F%6D%61%69%6C%6D%61%6E%2F%=
6C%69%73%74%69%6E%66%6F%2F%6F%70%65%6E%65%6D%62%65%64%64%65%64%2D%64%65%76%=
65%6C" target=3D_blank>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/=
openembedded-devel</A><BR></DIV></BLOCKQUOTE></body></html>

--===axigen=5536424865644401253159918978167057270354=axigen===--
