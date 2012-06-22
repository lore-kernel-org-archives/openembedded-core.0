Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Shsmx-0003qC-9F
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 03:35:55 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0M5Z00KL2T53S8I0@vms173009.mailsrvcs.net>; Thu,
	21 Jun 2012 19:24:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 023C220526; Thu,
	21 Jun 2012 20:24:38 -0400 (EDT)
Date: Thu, 21 Jun 2012 20:24:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <CALbNGRQ5CBSDS8zPnkem59mOjzAGDy8FHZifU_g5f9z59yOybg@mail.gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-id: <20120622002438.GE30753@denix.org>
MIME-version: 1.0
References: <CALbNGRQCVUeZFX_xxVe=3ixZMm7MRt3WWB5VxemNs0Bi+qCHcQ@mail.gmail.com>
	<20120621230216.GD30753@denix.org>
	<CALbNGRQ5CBSDS8zPnkem59mOjzAGDy8FHZifU_g5f9z59yOybg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-ti] massive fallout after updates / was (no subject)
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
X-List-Received-Date: Fri, 22 Jun 2012 01:35:55 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Fri, Jun 22, 2012 at 01:34:54AM +0200, Andreas M=FCller wrote:
> On Fri, Jun 22, 2012 at 1:02 AM, Denys Dmytriyenko <denis@denix.org=
> wrote:
> No need to understand everything: By removing require linux-tools.i=
nc
> (the fastest patch I ever had :) I can now build again.
>=20
> @layer maintainers: removing
>=20
> require linux-tools.inc
>=20
> should be taken into consideration

Thanks!

--=20
Denys



