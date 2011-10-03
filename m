Received: from smtp21.4emm.com ([69.18.222.6])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RAZID-0006P4-Hk
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 05:34:13 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB21.4emm.local ([::1]) with mapi id 14.01.0289.001; Sun, 2 Oct 2011
	23:28:42 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Problem building gcc-cross-initial with latest
	linaro patches.
Thread-Index: AcyBdW3EAFRrhFolRvKbyBPHL5SDZAAJyaKAAAfwhJA=
Date: Mon, 3 Oct 2011 03:28:42 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF19CD7C@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF19BD42@MBX20.4emm.local>
	<CAEsOVNd8rh+-KqYWd=Tngp1GfLavxb5FZgNEAHMc42iK5Gn-dw@mail.gmail.com>
In-Reply-To: <CAEsOVNd8rh+-KqYWd=Tngp1GfLavxb5FZgNEAHMc42iK5Gn-dw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: Problem building gcc-cross-initial with latest linaro patches.
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
X-List-Received-Date: Mon, 03 Oct 2011 03:34:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> McClintock Matthew-B29882
> Sent: Monday, 3 October 2011 11:18 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] Problem building gcc-cross-initial with latest lin=
aro
> patches.
>=20
> On Sun, Oct 2, 2011 at 9:46 PM, James Limbouris
> <james@digitalmatter.com.au> wrote:
> > | xterm Xt error: Can't open display:
> > | xterm: =A0DISPLAY is not set
> > | ERROR: Error executing a python function in /home/james/oe/sources/oe=
-
> core/meta/recipes-devtools/
>=20
> Did you have the DISPLAY setup properly though? I noticed some issue
> with this. Some point in the past an xterm would pop up properly, then
> it stopped working and I could not longer get a TERMCMD prompt.
>=20
> -M

I have a working DISPLAY in the shell that I launch bitbake from. Is anyone=
 aware of any additional setup required?



