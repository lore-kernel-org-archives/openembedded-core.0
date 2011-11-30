Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVtQY-0003iW-Tt for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:18:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUNCJmp007430
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:12:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07331-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:12:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUNCBdC007424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:12:12 GMT
Message-ID: <1322694739.17484.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 23:12:19 +0000
In-Reply-To: <D3052EEA-B188-4ED9-B230-0726FB04218B@dominion.thruhere.net>
References: <cover.1322607016.git.sgw@linux.intel.com>
	<1322665602.12609.9.camel@ted>
	<D3052EEA-B188-4ED9-B230-0726FB04218B@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/26] Various Package Updates
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
X-List-Received-Date: Wed, 30 Nov 2011 23:18:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 16:09 +0100, Koen Kooi wrote:
> Op 30 nov. 2011, om 16:06 heeft Richard Purdie het volgende geschreven:
> 
> > On Tue, 2011-11-29 at 15:00 -0800, Saul Wold wrote:
> >> Saul Wold (26):
> >>  wget: Update to 1.13.4
> >>  json-glib: Update to 0.14.2
> >>  libdrm: Update to 2.4.27
> >>  mkfontscale: Update to 1.0.9
> >>  xdpyinfo: Update to 1.3.0
> >>  xinit: Update to 1.3.1
> >>  xkbcomp: Update to 1.2.3
> >>  xprop: Update to 1.2.1
> >>  xrandr: Update to 1.3.5
> >>  xset: Update to 1.2.2
> >>  xwininfo: Update to 1.1.2
> >>  xf86-input-mouse: Update to 1.7.1
> >>  xf86-input-synaptics: Update to 1.5.0
> >>  xf86-video-intel: Update to 2.17.0
> >>  lame: Update to 3.99.3
> >>  gdbm: Update to 1.10
> >>  libtasn1: Update to 2.11
> >>  ocf-linux: Add ocf-linux to support openssl 1.0
> >>  openssl-0.9.8: move parallel-make fix to 0.9.8
> >>  openssl: Add openssl 1.0
> >>  PR Bump for OpenSSL 1.0
> >>  Distro Tracking: Update Ownership and Update Dates
> > 
> > I've taken these including openssl 1.0.
> 
> So when can I expect patches to remove it from meta-oe?

Keep in mind Saul is a little under the weather at the moment so it
might not be instant. I'm sure he'd appreciate any help. I'm doing my
best to keep OE-Core patches flowing.

Cheers,

Richard



