Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1TkVjJ-0002XN-Cm
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 09:07:20 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TkVV9-002dch-JM>; Mon, 17 Dec 2012 08:52:39 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TkVV9-001Ae2-Ho>; Mon, 17 Dec 2012 08:52:39 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1TkVV8-0001Fp-FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 08:52:38 +0100
Date: Mon, 17 Dec 2012 08:52:38 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <20121217075238.GA4305@mi.fu-berlin.de>
References: <alpine.DEB.2.02.1212160555200.745@oneiric>
	<CAGfZjq49PpLifX4aRAJ1gq7L8mm45Wqm3w+3wRYRS6_QqMsfcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGfZjq49PpLifX4aRAJ1gq7L8mm45Wqm3w+3wRYRS6_QqMsfcA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: sprinkled references to "powerpc" vs "ppc" in adt-installer
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
X-List-Received-Date: Mon, 17 Dec 2012 08:07:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 16, 2012 at 04:11:15PM -0500, Bill Traynor wrote:
> On Dec 16, 2012 5:57 AM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
> >
> >
> >   perusing adt-installer recipe and files and i notice there are a few
> > mentions of "powerpc" whereas it seems that "ppc" is the correct
> > architecture abbreviation.  obviously doesn't hurt anything but it
> > might be confusing for people reading the source.
> 
> Isn't the architecture just called Power now?

Nope, POWER is the midiron architecture from IBM, where POWERPC is a subset of POWER.

Bye Henning.


