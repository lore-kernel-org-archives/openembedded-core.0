Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SCGjm-0006Gn-JZ
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 22:41:58 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1I0017ZEEXS230@vms173015.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 15:32:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 22B99201CB; Mon,
	26 Mar 2012 16:32:56 -0400 (EDT)
Date: Mon, 26 Mar 2012 16:32:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <CA+b4E8yygK0_d1YkXn3_DdbkOb-L6-8pC1h9ojVTi3m8UasRzg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120326203256.GB3368@denix.org>
MIME-version: 1.0
References: <CA+b4E8yygK0_d1YkXn3_DdbkOb-L6-8pC1h9ojVTi3m8UasRzg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Stable release of oe-core
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
X-List-Received-Date: Mon, 26 Mar 2012 20:41:58 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Mon, Mar 26, 2012 at 04:25:19PM -0400, Brandon Stafford wrote:
> Hi all,
>=20
> I don't see an RC branch or anything like that in the git repo. I'm
> about to make the leap from the oe classic 2011.03-maintenance bran=
ch
> to oe-core, so I'm trying to figure out the right place to land.
>=20
> In the March 13, 2012, OE TSC minutes, I noticed this text:
>   c. oe-core release
> =A0 =A0 =A0 feature freeze in 1 week
> =A0 =A0 =A0 final freeze 2-3 weeks from=A018=A0Mar
>=20
> Do I just need a little patience?

Correct, OE-Core (and some other layers) follows the 6-month release =
schedule of
the Yocto Project (which is October and April) that is getting ready =
for v1.2:

http://www.yoctoproject.org/blogs/davest/2012/progress-yocto-project-=
v1.2

--=20
Denys



